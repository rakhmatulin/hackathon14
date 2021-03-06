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
    parts = pattern.split(',')
    urls = [reverse(part) for part in parts]
    path = request.path
    if any([path.startswith(url)
            and url not in path.lstrip(url) for url in urls]):
        return 'active'
    return ''


@register.assignment_tag
def allowed_vote(request, req):
    same_user = (request.user.is_authenticated and
                 req.employer.user_id == request.user)
    if not request.user.is_authenticated() or same_user:
        return False
    if request.user.id in [update.employer.user_id for update in req.updates]:
        return False
    return True
