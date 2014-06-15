from django import template
from django.core.urlresolvers import reverse


register = template.Library()


@register.inclusion_tag('twid/map_room.html')
def room(rooms_dict, room_number):
    devices = rooms_dict.get(room_number)
    return {'devices': devices, 'room_number': room_number}


@register.simple_tag
def url_replace(request, field, value):
    dict_ = request.GET.copy()
    dict_[field] = value
    return '?%s' % dict_.urlencode()


@register.simple_tag
def active_url(request, pattern):
    url = reverse(pattern)
    path = request.path
    if path.startswith(url) and url not in path.lstrip(url):
        return 'active'
    return ''
