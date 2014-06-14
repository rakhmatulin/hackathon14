from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from hackathon14.twid.forms import IndexFilterForm
from twid.models import Device, Employer
from django.db.models import Q


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
    devices_by_room = Device.get_devices_by_room()
    return render_to_response('index.html', locals())

def search(request):
    query = request.GET.get('query')
    devices = Device.objects.select_related('employer').\
        filter(
            Q(sku__icontains=query) |
            Q(model__icontains=query)).\
        order_by('-history__date')
    devices_by_room = Device.get_devices_by_room()
    return render_to_response('search.html', locals())

def about(request):
    return render_to_response('about.html')


def employer_list(request):
    all_employers = Employer.objects.all()

    page = request.GET.get('page')
    paginator = Paginator(all_employers, 30)

    try:
        employers = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        employers = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        employers = paginator.page(paginator.num_pages)

    return render_to_response('employer_list.html', locals())
