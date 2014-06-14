from django.conf.urls import patterns, include, url

from django.contrib import admin
from hackathon14.twid.views import device_single
import hackathon14

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'hackathon14.views.index', name='index'),
    url(r'^device/(?P<device_id>\d+)/$', device_single, name='device_view'),
    url(r'^admin/', include(admin.site.urls)),
)
