from django.db import models
from django.db.models import Q


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

    def __unicode__(self):
        return u'%s %s' % self.first_name, self.last_name

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

    objects = DeviceManager()

    def __unicode__(self):
        return u'%s' % self.model

    def get_current_employer(self):
        return History.objects.filter(device=self).\
            order_by('-date').first()

    def assign(self, employer):
        current_employer = self.get_current_employer()
        if current_employer is not None and current_employer == employer:
            return
        History.objects.create(employer=employer, deviice=self)

    def employer_autocomplete(self, name, limit=10):
        current_employer = self.get_current_employer()
        query = Employer.objects.filter(
            Q(last_name_eng__startswith=name) |
            Q(first_name_eng__startswith=name))
        if current_employer is not None:
            query = query.exclude(id=current_employer.id)
        return query


class History(models.Model):
    employer = models.ForeignKey(Employer)
    device = models.ForeignKey(Device)
    date = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return u'%s' % self.model
