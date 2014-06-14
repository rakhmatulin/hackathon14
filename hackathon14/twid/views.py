from django.shortcuts import render_to_response
from hackathon14.twid.models import Device, Employer


def device_single(request, device_id):
    device = Device.objects.get(id=device_id)
    context = {
        'device': device
    }
    return render_to_response('twid/device_single.html', context)


def employer_single(request, employer_id):
    employer = Employer.objects.get(id=employer_id)
    context = {
        'employer': employer
    }
    return render_to_response('twid/employer_single.html', context)