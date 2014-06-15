from django.core.urlresolvers import reverse
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from datetime import datetime
import re

from hackathon14.twid.forms import UpdateRequestForm
from django.template import RequestContext

from hackathon14.twid.models import DeviceUpdateRequest
from hackathon14.twid.models import Device, Employer, History, DeviceUpdateEmployer
from hackathon14.utils.get_employers import json_error_response, \
    json_success_response


def device_single(request, device_id):
    if request.method == "POST":
        if not request.user.is_authenticated():
            return redirect(reverse('sign_in'))
        form = UpdateRequestForm(request.POST)
        if form.is_valid():
            employer = Employer.objects.get(user_id=request.user)
            update_request = DeviceUpdateRequest()
            update_request.date = datetime.now()
            update_request.request_message = request.POST.get('request_message')
            update_request.employer = employer
            update_request.device = Device.objects.get(id=device_id)
            update_request.save()
            return redirect(reverse('single_device_view', args=(device_id,)))
    else:
        form = UpdateRequestForm()
    device = Device.objects.get(id=device_id)
    update_requests = DeviceUpdateRequest.objects.filter(device=device)
    history = History.objects.filter(device=device).order_by('-date')
    names = {}
    employers = Employer.objects.all()
    if device.employer_id:
        employers = employers.exclude(id=device.employer_id)
    for developer in employers:
        names[developer.id] = developer.first_name_eng + " " + developer.last_name_eng
    owner = False
    if len(history):
        owner = history[0].employer
    context = {
        'device': device,
        'history': history,
        'update_requests': update_requests,
        'owner': owner,
        'names': names,
        'form': form,
    }
    return render_to_response('twid/device_single.html', context, RequestContext(request))


def employer_single(request, employer_id):
    employer = Employer.objects.get(id=employer_id)
    devices = employer.get_devices()
    skills = []
    if employer.skills:
        skills = re.split(r'\s*,\s*', employer.skills)
    context = {
        'employer': employer,
        'devices': devices,
        'skills': skills,
    }
    return render(request, 'twid/employer_single.html', context)


@login_required
def assign_device(request, device_id):
    device = Device.objects.filter(id=device_id).first()
    if device is None:
        return json_error_response('Not found', status=404)
    employer_id = request.POST.get('employer_id')
    if not employer_id:
        return json_error_response('Bad request', status=400)
    employer = Employer.objects.filter(id=employer_id).first()
    if employer is None:
        return json_error_response('Not found', status=400)
    if not device.assign(employer):
        return json_error_response(
            'Cannot assign employer. Seems to assigned already',
            status=400)
    return json_success_response('Assigned')


@login_required
def vote_for_update(request, request_id, vote):
    employer = Employer.objects.filter(user_id=request.user)[0]
    update_request = DeviceUpdateRequest.objects.get(id=request_id)
    possible_employers = []
    for history_item in History.objects.filter(device=update_request.device):
        possible_employers.append(history_item.employer)
    try:
        if employer in possible_employers:
            if DeviceUpdateEmployer.objects.filter(
                    update_request=update_request, employer=employer):
                raise Exception
            device_update_employer = DeviceUpdateEmployer(
                update_request=update_request, employer=employer)
            device_update_employer.save()
            update_request = DeviceUpdateRequest.objects.get(id=request_id)
            if int(vote) == 1:
                update_request.likes += 1
            elif int(vote) == 0:
                update_request.dislikes += 1
            update_request.save()
        else:
            raise Exception
    except Exception:
        return json_error_response('Something strange happend.', status=400)
    return json_success_response('Voted!')
