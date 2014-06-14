# -*- coding: utf-8 -*-

from django.core.management.base import NoArgsCommand
from django.conf import settings
import logging
from hackathon14.utils.get_employers import SmgApi


class Command(NoArgsCommand):

    help = 'Update employers'

    def handle(self, *args, **options):
        api = SmgApi('ihar.niamilentsau', 'Logi9tech!')
        employers = api.get_employers()
