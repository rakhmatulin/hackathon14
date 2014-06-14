from django.shortcuts import render_to_response

from hackathon14.twid.models import DeviceUpdateRequest
from hackathon14.twid.models import Device, Employer, History
from hackathon14.utils.get_employers import json_error_response, \
    json_success_response


def device_single(request, device_id):
    device = Device.objects.get(id=device_id)
    update_requests = DeviceUpdateRequest.objects.filter(device=device)
    history = History.objects.filter(device=device).order_by('-date')
    owner = history[0].employer

    context = {
        'device': device,
        'history': history,
        'update_requests': update_requests,
        'owner': owner,
    }
    return render_to_response('twid/device_single.html', context)


def employer_single(request, employer_id):
    employer = Employer.objects.get(id=employer_id)
    context = {
        'employer': employer
    }
    return render_to_response('twid/employer_single.html', context)


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


def vote_for_update(request, request_id, vote):
    try:
        update_request = DeviceUpdateRequest.objects.get(id=request_id)
        if int(vote) == 1:
            update_request.likes += 1
        elif int(vote) == 0:
            update_request.dislikes += 1
        update_request.save()
    except Exception:
        return json_error_response(
                'Something strange happend.',
                status=400
        )
    return json_success_response('Voted!')
