from django.db import models


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


class Device(models.Model):
    sku = models.CharField(max_length=50, blank=True)
    model = models.CharField(max_length=50, blank=True)
    os = models.CharField(max_length=50, blank=True)
    version = models.CharField(max_length=50, blank=True)
    mac = models.CharField(max_length=50, blank=True)
    image = models.ImageField(max_length=255, null=True, blank=True, upload_to='device')
    status = models.BooleanField(default=False)

    def __unicode__(self):
        return u'%s' % self.model
