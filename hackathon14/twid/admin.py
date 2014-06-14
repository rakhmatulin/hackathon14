from django.contrib import admin

from .models import Device


class DeviceAdmin(admin.ModelAdmin):
    model = Device


admin.site.register(Device, DeviceAdmin)
