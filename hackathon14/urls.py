from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from hackathon14.twid.models import Employer, History
from hackathon14.twid.views import device_single, assign_device

admin.site.register(Employer)
admin.site.register(History)
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'hackathon14.views.index', name='index'),
    url(r'^device/(?P<device_id>\d+)/$', device_single, name='device_view'),
    url(r'^device/assign/(?P<device_id>\d+)/$',
        assign_device, name='assign_device'),
    url(r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
    if settings.MEDIA_ROOT:
        urlpatterns += static(
            settings.MEDIA_URL,
            document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
