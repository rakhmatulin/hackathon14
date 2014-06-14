from django.shortcuts import render_to_response
from twid.models import Device, Employer

def index(request):
    devices = Device.objects.all()
    return render_to_response('index.html', locals())

def about(request):
    return render_to_response('about.html')

def employer_list(request):
    employers = Employer.objects.all()
    return render_to_response('employer_list.html', locals())
