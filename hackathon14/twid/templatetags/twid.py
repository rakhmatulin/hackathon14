from django import template


register = template.Library()


@register.inclusion_tag('twid/map_room.html')
def room(rooms_dict, room_number):
    devices = rooms_dict.get(room_number)
    return {'devices': devices, 'room_number': room_number}
