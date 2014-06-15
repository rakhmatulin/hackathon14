from collections import defaultdict
from django.core.urlresolvers import reverse
from django.db import models
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.db.models import Q
from django.utils.datetime_safe import datetime
from django.contrib.auth.models import User


class EmployerManager(models.Manager):

    def get_queryset(self):
        return super(EmployerManager, self).get_queryset().\
            filter(room__gte=500, room__lt=600)


class Employer(models.Model):

    profile_id = models.PositiveIntegerField()
    user_id = models.ForeignKey(User, null=True, related_name='employer')
    dept_id = models.PositiveIntegerField()
    first_name_eng = models.CharField(max_length=200)
    last_name_eng = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    birth_day = models.DateField()
    skype = models.CharField(max_length=200, default='', null=True, blank=True)
    phone = models.CharField(max_length=200, default='', null=True, blank=True)
    image = models.ImageField(upload_to='employer', null=True, blank=True)
    room = models.PositiveIntegerField()
    email = models.EmailField()
    date_action = models.DateTimeField(blank=True, null=True)
    skills = models.TextField(blank=True)

    objects = EmployerManager()

    def get_absolute_url(self):
        return reverse('single_employe_view', args=(self.id,))

    def get_devices(self):
        return Device.objects.filter(employer=self)

    def __unicode__(self):
        return u'%s %s' % (self.first_name, self.last_name,)


class DeviceManager(models.Manager):
    pass


class Device(models.Model):

    sku = models.CharField(max_length=50, blank=True)
    model = models.CharField(max_length=50, blank=True)
    os = models.CharField(max_length=50, blank=True)
    version = models.CharField(max_length=50, blank=True)
    mac = models.CharField(max_length=50, blank=True)
    image = models.ImageField(max_length=255, null=True, blank=True, upload_to='device')
    status = models.BooleanField(default=False)
    employer = models.ForeignKey(Employer, blank=True, null=True)
    date_action = models.DateTimeField(blank=True, null=True)

    objects = DeviceManager()

    def __unicode__(self):
        return u'%s' % self.model

    def assign(self, employer):
        if self.employer is not None and self.employer == employer:
            return False
        self.employer = employer
        self.save()
        return True

    def employer_autocomplete(self, name, limit=10):
        query = Employer.objects.filter(
            Q(last_name_eng__startswith=name) |
            Q(first_name_eng__startswith=name))
        if self.employer is not None:
            query = query.exclude(id=self.employer.id)
        return query[:limit]

    @classmethod
    def get_devices_by_room(cls, query):
        devices = Device.objects.filter(employer__isnull=False).\
            select_related('employer')
        if query:
            devices = devices.filter(
                Q(sku__icontains=query) | Q(model__icontains=query) | Q(os__icontains=query))
        dt = defaultdict(list)
        for device in devices:
            dt[device.employer.room].append(device)
        return dict(dt)

    def get_absolute_url(self):
        return reverse('single_device_view', args=(self.id,))


class History(models.Model):
    old_employer = models.ForeignKey(
        Employer, null=True, blank=True, default=None,
        related_name='old_employers')
    employer = models.ForeignKey(Employer, related_name='employers')
    device = models.ForeignKey(Device)
    date = models.DateTimeField(auto_now_add=True)
    date.editable = True

    def __unicode__(self):
        return u'%s %s' % (self.device.sku, self.employer.last_name,)


class DeviceUpdateRequest(models.Model):
    employer = models.ForeignKey(Employer)
    device = models.ForeignKey(Device)
    date = models.DateTimeField(auto_now_add=True)
    request_message = models.TextField(null=False, blank=False)
    likes = models.IntegerField(default=0)
    dislikes = models.IntegerField(default=0)
    approved = models.BooleanField(default=False)

    def __unicode__(self):
        return u'%s %s' % (self.request_message, self.device.sku,)

    def save(self, *args, **kwargs):
        owners = []
        for history_item in History.objects.filter(device=self.device):
            owners.append(history_item.employer)
        if len(owners)/2 < self.likes:
            self.approved = True
        if len(owners)/2 < self.dislikes:
            self.approved = False
        super(DeviceUpdateRequest, self).save(*args, **kwargs)


class DeviceUpdateEmployer(models.Model):
    update_request = models.ForeignKey(DeviceUpdateRequest)
    employer = models.ForeignKey(Employer)

@receiver(pre_save, sender=Device)
def add_history(sender, **kwargs):
    instance = kwargs.get('instance')
    if not instance or not instance.id:
        return
    if instance.employer:
        device = Device.objects.get(id=instance.id)
        old_employer = device.employer
        if instance.employer != old_employer:
            History.objects.create(
                old_employer=old_employer,
                employer=instance.employer, device=instance)
            instance.date_action = datetime.now()
            instance.employer.date_action = datetime.now()
            instance.employer.save()

