# -*- coding: utf-8 -*-
from django.db.models.query import QuerySet
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import DataMigration
from django.db import models
from twid.models import Employer, History, Device


class Migration(DataMigration):

    def forwards(self, orm):
        "Write your forwards methods here."
        # Note: Don't use "from appname.models import ModelName". 
        # Use orm.ModelName to refer to models in this application,
        # and orm['appname.ModelName'] for models in other applications.
        query = History.objects.order_by('date').query
        query.group_by = ['employer_id']
        history = QuerySet(query=query, model=History)
        for h in history:
            employer = Employer.objects.get(id=h.employer_id)
            employer.date_action = h.date
            employer.save()
        query = History.objects.order_by('date').query
        query.group_by = ['device_id']
        history = QuerySet(query=query, model=History)
        for h in history:
            device = Device.objects.get(id=h.device_id)
            device.date_action = h.date
            device.save()

    def backwards(self, orm):
        "Write your backwards methods here."
        pass

    models = {
        u'twid.device': {
            'Meta': {'object_name': 'Device'},
            'date_action': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'employer': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Employer']", 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'mac': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'os': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'sku': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'status': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'version': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'})
        },
        u'twid.deviceupdaterequest': {
            'Meta': {'object_name': 'DeviceUpdateRequest'},
            'approved': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Device']"}),
            'dislikes': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'employer': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Employer']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'likes': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'request_message': ('django.db.models.fields.TextField', [], {})
        },
        u'twid.employer': {
            'Meta': {'object_name': 'Employer'},
            'birth_day': ('django.db.models.fields.DateField', [], {}),
            'date_action': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'dept_id': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'first_name_eng': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'last_name_eng': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'phone': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'profile_id': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'room': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'skype': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '200', 'null': 'True', 'blank': 'True'})
        },
        u'twid.history': {
            'Meta': {'object_name': 'History'},
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Device']"}),
            'employer': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Employer']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['twid']
    symmetrical = True
