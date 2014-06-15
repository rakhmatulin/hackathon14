from django.contrib.auth import logout
from django.core.urlresolvers import reverse
from django.db.models import Count
from django.shortcuts import render, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from hackathon14.twid.forms import DevicesFilterForm, EmployersFilterForm, \
    SignInForm
from twid.models import Device, Employer, History
from django.db.models import Q


PAGINATOR_COUNT = 20


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
        3: 'employer',
    }
    order_extra_params = {
        1: 'date_action',
        3: 'employer_id',
    }
    order_param = order_params[device_filter]
    devices_query = Device.objects.select_related('employer')
    if device_filter in (1, 3):
        order_extra_param = order_extra_params[device_filter]
        devices_query = devices_query.extra(select={
            'null_values': 'CASE WHEN %s.%s IS NULL THEN 0 ELSE 1 END' %
            (Device._meta.db_table, order_extra_param)}
        ).order_by('-null_values', order_param)
    else:
        devices_query = devices_query.order_by(order_param)
    page = data.get('page')
    paginator = Paginator(devices_query, PAGINATOR_COUNT)
    try:
        devices = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        devices = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        devices = paginator.page(paginator.num_pages)
    devices_by_room = Device.get_devices_by_room(False)
    return render(request, 'index.html', locals())


def search(request):
    query = request.GET.get('query', '')
    devices = Device.objects.select_related('employer').\
        order_by('-date_action')
    if query:
        devices = devices.filter(
            Q(sku__icontains=query) | Q(model__icontains=query) | Q(os__icontains=query))
    devices_by_room = Device.get_devices_by_room(query)
    return render(request, 'search.html', locals())


def about(request):
    return render(request, 'about.html', locals())


def sparta(request):
    return render(request, 'sparta.html', locals())


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
    employers_query = Employer.objects.annotate(count=Count('device'))
    if employer_filter == 1:
        order_extra_param = 'date_action'
        employers_query = employers_query.extra(select={
            'null_values': 'CASE WHEN %s.%s IS NULL THEN 0 ELSE 1 END' %
            (Employer._meta.db_table, order_extra_param)}
        ).order_by('-null_values', order_param)
    else:
        employers_query = employers_query.order_by(order_param)
    page = data.get('page')
    paginator = Paginator(employers_query, PAGINATOR_COUNT)
    try:
        employers = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        employers = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        employers = paginator.page(paginator.num_pages)
    return render(request, 'employer_list.html', locals())


def history_list(request, employer_id=None, device_id=None):
    data = request.GET.copy()
    history_query = History.objects.select_related(
        'employer', 'device').order_by('-date')
    if employer_id is not None:
        history_query = history_query.filter(
            Q(employer_id=employer_id) | Q(old_employer_id=employer_id))
    if device_id is not None:
        history_query = history_query.filter(device_id=device_id)
    page = data.get('page')
    paginator = Paginator(history_query, PAGINATOR_COUNT)
    try:
        history = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        history = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        history = paginator.page(paginator.num_pages)
    return render(request, 'history.html', locals())


def sing_in(request):
    next_url = request.GET.get('next')
    initial = {'next': next_url} if next_url else {}
    form = SignInForm(request, request.POST or None, initial=initial)
    if form.is_valid():
        return redirect(form.cleaned_data.get('next') or 'index')
    return render(request, 'login.html', locals())


def sign_out(request):
    logout(request)
    return redirect(reverse('sign_in'))
