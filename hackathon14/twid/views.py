from django.shortcuts import render_to_response


def device_single(request, device_id):
    context = {
        'device_id': device_id
    }
    return render_to_response('twid/device_single.html', context)


def employe_single(request, employe_id):
    context = {
        'employe_id': employe_id
    }
    return render_to_response('twid/employe_single.html', context)