from django.contrib import admin

from .models import Device, DeviceUpdateRequest, History, Employer


class DeviceAdmin(admin.ModelAdmin):
    model = Device


class DeviceUpdateRequestAdmin(admin.ModelAdmin):
    model = DeviceUpdateRequest


class EmployerAdmin(admin.ModelAdmin):
    model = Employer


class HistoryAdmin(admin.ModelAdmin):
    model = History


admin.site.register(Device, DeviceAdmin)
admin.site.register(DeviceUpdateRequest, DeviceUpdateRequestAdmin)
admin.site.register(Employer, EmployerAdmin)
admin.site.register(History, HistoryAdmin)
