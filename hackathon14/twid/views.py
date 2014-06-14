from django.shortcuts import render_to_response
from hackathon14.twid.models import Device, Employer, History
from hackathon14.utils.get_employers import json_response


def device_single(request, device_id):
    device = Device.objects.get(id=device_id)
    history = History.objects.filter(device=device)

    context = {
        'device': device,
        'history': history,
    }
    return render_to_response('twid/device_single.html', context)


def employe_single(request, employe_id):

    context = {
        'employe_id': employe_id
    }
    return render_to_response('twid/employe_single.html', context)


def assign_device(request, device_id):
    device = Device.objects.filter(id=device_id).first()
    if device is None:
        return json_response({'error': {'message': 'Not found'}}, status=404)
    employer_id = request.POST.get('employer_id')
    if not employer_id:
        return json_response({'error': {'message': 'Bad request'}}, status=400)
    employer = Employer.objects.filter(id=employer_id).first()
    if employer is None:
        return json_response({'error': {'message': 'Bad request'}}, status=400)
    history = device.assign(employer)
    if history is None:
        return json_response({'error': {
            'message': 'Cannot assign employer. Seems to assigned already'}},
            status=400)
    return json_response({'success': {'message': 'Assigned'}})

