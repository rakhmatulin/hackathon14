# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Employer'
        db.create_table(u'twid_employer', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('profile_id', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('depth_id', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('first_name_eng', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('last_name_eng', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('birth_day', self.gf('django.db.models.fields.DateField')()),
            ('skype', self.gf('django.db.models.fields.CharField')(default='', max_length=200)),
            ('phone', self.gf('django.db.models.fields.CharField')(default='', max_length=200)),
            ('room', self.gf('django.db.models.fields.PositiveIntegerField')(default=0)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75)),
        ))
        db.send_create_signal(u'twid', ['Employer'])

        # Adding model 'Device'
        db.create_table(u'twid_device', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('sku', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('model', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('os', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('version', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('mac', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=255, null=True, blank=True)),
        ))
        db.send_create_signal(u'twid', ['Device'])


    def backwards(self, orm):
        # Deleting model 'Employer'
        db.delete_table(u'twid_employer')

        # Deleting model 'Device'
        db.delete_table(u'twid_device')


    models = {
        u'twid.device': {
            'Meta': {'object_name': 'Device'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'mac': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'os': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'sku': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'version': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'})
        },
        u'twid.employer': {
            'Meta': {'object_name': 'Employer'},
            'birth_day': ('django.db.models.fields.DateField', [], {}),
            'depth_id': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'first_name_eng': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'last_name_eng': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'phone': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '200'}),
            'profile_id': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'room': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'skype': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '200'})
        }
    }

    complete_apps = ['twid']