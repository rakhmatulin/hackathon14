from django.shortcuts import render_to_response


def device_single(request, device_id):
    context = {
        'device_id': device_id
    }
    return render_to_response('twid/device_single.html', context)
