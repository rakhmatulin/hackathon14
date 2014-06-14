from django.db import models


class Employer(models.Model):

    profile_id = models.PositiveIntegerField()
    depth_id = models.PositiveIntegerField()
    first_name_eng = models.CharField(max_length=200)
    last_name_eng = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    birth_day = models.DateField()
    skype = models.CharField(max_length=200, default='')
    phone = models.CharField(max_length=200, default='')
    image = models.ImageField(upload_to='employer/images')
    room = models.CharField(max_length=200)
    email = models.EmailField()
