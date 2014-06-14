from django.contrib import admin

from .models import Device, DeviceUpdateRequest


class DeviceAdmin(admin.ModelAdmin):
    model = Device

class DeviceUpdateRequestAdmin(admin.ModelAdmin):
    model = DeviceUpdateRequest


admin.site.register(Device, DeviceAdmin)
admin.site.register(DeviceUpdateRequest, DeviceUpdateRequestAdmin)
