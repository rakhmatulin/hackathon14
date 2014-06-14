# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'DeviceUpdateRequest'
        db.create_table(u'twid_deviceupdaterequest', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('employer', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['twid.Employer'])),
            ('device', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['twid.Device'])),
            ('date', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('request_message', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal(u'twid', ['DeviceUpdateRequest'])


    def backwards(self, orm):
        # Deleting model 'DeviceUpdateRequest'
        db.delete_table(u'twid_deviceupdaterequest')


    models = {
        u'twid.device': {
            'Meta': {'object_name': 'Device'},
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
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Device']"}),
            'employer': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['twid.Employer']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'request_message': ('django.db.models.fields.TextField', [], {})
        },
        u'twid.employer': {
            'Meta': {'object_name': 'Employer'},
            'birth_day': ('django.db.models.fields.DateField', [], {}),
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