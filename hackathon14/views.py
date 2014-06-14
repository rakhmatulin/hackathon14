from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from twid.models import Device, Employer


def index(request):
    devices = Device.objects.select_related('employer').\
        prefetch_related('employer__device_set')
    return render_to_response('index.html', locals())


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
