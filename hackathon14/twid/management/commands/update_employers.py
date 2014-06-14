# -*- coding: utf-8 -*-

import logging
import Queue
import json
import os
from collections import deque
from django.core.management.base import NoArgsCommand
from django.conf import settings
from hackathon14.utils.get_employers import SmgApi


logger = logging.getLogger("twid")


def download_employer(employer_id, queue):


class Command(NoArgsCommand):

    help = 'Update employers'

    def handle(self, *args, **options):
        api = SmgApi('ihar.niamilentsau', 'Logi9tech!')
        employers_file = os.path.join(settings.MEDIA_ROOT, 'employers.json')
        if os.path.exists(employers_file):
            with open(employers_file) as fl:
                employers = json.loads(fl.read())
        else:
            employers = api.get_employers()
            with open(employers_file, 'w') as fl:
                fl.write(json.dumps(employers))
        queue = Queue.Queue()
        for employer in employers:
        #    queue.
        #pool = gevent.Pool(10)
        queue.enqu


