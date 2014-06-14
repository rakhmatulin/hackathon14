from django.db.models import Count
from django.shortcuts import render_to_response
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from hackathon14.twid.forms import DevicesFilterForm, EmployersFilterForm
from twid.models import Device, Employer
from django.db.models import Q


EMPLOYER_PAGINATOR_COUNT = 30


def index(request):
    device_filter = DevicesFilterForm.FILTER_CHOICE[0][0]
    data = request.GET.copy()
    if not 'device_filter' in data:
        data['device_filter'] = device_filter
    form = DevicesFilterForm(data)
    if form.is_valid():
        device_filter = form.cleaned_data['device_filter']
    order_params = {
        1: '-date_action',
        2: 'model',
        3: 'employer__last_name_eng',
    }
    order_param = order_params[device_filter]
    devices = Device.objects.select_related('employer').order_by(order_param)
    devices_by_room = Device.get_devices_by_room(False)
    return render_to_response('index.html', locals())


def search(request):
    query = request.GET.get('query')
    devices = Device.objects.select_related('employer').\
        filter(
            Q(sku__icontains=query) |
            Q(model__icontains=query)).\
        order_by('-date_action')
    devices_by_room = Device.get_devices_by_room(query)
    return render_to_response('search.html', locals())


def about(request):
    return render_to_response('about.html')


def employer_list(request):
    employer_filter = EmployersFilterForm.FILTER_CHOICE[0][0]
    data = request.GET.copy()
    if not 'employer_filter' in data:
        data['employer_filter'] = employer_filter
    form = EmployersFilterForm(data)
    if form.is_valid():
        employer_filter = form.cleaned_data['employer_filter']
    order_params = {
        1: '-date_action',
        2: 'last_name_eng',
        3: '-count',
    }
    order_param = order_params[employer_filter]
    all_employers = Employer.objects.\
        annotate(count=Count('device')).order_by(order_param)
    page = data.get('page')
    paginator = Paginator(all_employers, EMPLOYER_PAGINATOR_COUNT)
    try:
        employers = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        employers = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        employers = paginator.page(paginator.num_pages)
    return render_to_response('employer_list.html', locals())
