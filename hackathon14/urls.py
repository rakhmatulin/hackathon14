from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from hackathon14.twid.views import device_single, assign_device, employer_single, vote_for_update

admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^$', 'hackathon14.views.index', name='index'),
    url(r'^search/', 'hackathon14.views.search', name='search'),
    url(r'^employers/', 'hackathon14.views.employer_list', name='employer_list'),
    url(r'^history/employer/(?P<employer_id>\d+)/',
        'hackathon14.views.history_list', name='history_list_employer'),
    url(r'^history/device/(?P<device_id>\d+)/',
        'hackathon14.views.history_list', name='history_list_device'),
    url(r'^history/', 'hackathon14.views.history_list', name='history_list'),
    url(r'^about/', 'hackathon14.views.about', name='about'),
    url(r'^device/(?P<device_id>\d+)/$', device_single, name='single_device_view'),
    url(r'^employer/(?P<employer_id>\d+)/$', employer_single, name='single_employe_view'),
    url(r'^device/assign/(?P<device_id>\d+)/$',
        assign_device, name='assign_device'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^vote_for_update/(?P<request_id>\d+)/(?P<vote>\d+)/$', vote_for_update, name='vote_for_update'),
)

if settings.DEBUG:
    if settings.MEDIA_ROOT:
        urlpatterns += static(
            settings.MEDIA_URL,
            document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
