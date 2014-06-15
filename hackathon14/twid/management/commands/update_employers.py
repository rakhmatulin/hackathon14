# -*- coding: utf-8 -*-

import logging
from django.core.management.base import NoArgsCommand
from hackathon14.utils.get_employers import SmgApi


logger = logging.getLogger("twid")


class Command(NoArgsCommand):

    help = 'Update employers'

    def handle(self, *args, **options):
        api = SmgApi('xxxx', 'xxxx')
        api.start()
