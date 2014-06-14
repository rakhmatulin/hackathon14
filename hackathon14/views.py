from django.shortcuts import render_to_response
from hackathon14.twid.forms import IndexFilterForm
from twid.models import Device, Employer


def index(request):
    device_filter = IndexFilterForm.FILTER_CHOICE[0][0]
    form = IndexFilterForm(request.GET or {'device_filter': device_filter})
    if form.is_valid():
        device_filter = form.cleaned_data['device_filter']
    order_params = {
        1: '-history__date',
        2: 'model',
        3: 'employer__last_name_eng',
    }
    devices = Device.objects.select_related('employer').\
        order_by(order_params[device_filter])
    return render_to_response('index.html', locals())


def about(request):
    return render_to_response('about.html')


def employer_list(request):
    employers = Employer.objects.all()
    return render_to_response('employer_list.html', locals())
