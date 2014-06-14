from django.shortcuts import render_to_response
from twid.models import Device

def index(request):
    devices = Device.objects.all()
    return render_to_response('index.html', locals())
