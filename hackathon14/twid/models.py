from collections import defaultdict
from django.core.urlresolvers import reverse
from django.db import models
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.db.models import Q


class EmployerManager(models.Manager):
    pass


class Employer(models.Model):

    profile_id = models.PositiveIntegerField()
    dept_id = models.PositiveIntegerField()
    first_name_eng = models.CharField(max_length=200)
    last_name_eng = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    birth_day = models.DateField()
    skype = models.CharField(max_length=200, default='', null=True, blank=True)
    phone = models.CharField(max_length=200, default='', null=True, blank=True)
    image = models.ImageField(upload_to='employer', null=True, blank=True)
    room = models.CharField(max_length=200)
    email = models.EmailField()

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
    def get_devices_by_room(cls):
        devices = Device.objects.filter(employer__isnull=False).\
            select_related('employer')
        dt = defaultdict(list)
        for device in devices:
            dt[device.employer.room].append(device)
        return dict(dt)

    def get_absolute_url(self):
        return reverse('single_device_view', args=(self.id,))


class History(models.Model):
    employer = models.ForeignKey(Employer)
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

@receiver(pre_save, sender=Device)
def add_history(sender, **kwargs):
    instance = kwargs.get('instance')
    if not instance or not instance.id:
        return
    if instance.employer:
        device = Device.objects.filter(id=instance.id).first()
        old_employer = device.employer
        if instance.employer != old_employer:
            History.objects.create(employer=instance.employer, device=instance)

