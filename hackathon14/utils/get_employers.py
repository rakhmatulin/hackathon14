# -*- coding: utf-8 -*-
from collections import deque
import json

import logging
from StringIO import StringIO
import os
from django.conf import settings
from gevent.pool import Pool
import requests
from hackathon14.twid.models import Employer

logging.basicConfig()
logger = logging.getLogger('smg_api')


class SmgApi(object):

    AUTH_URL = (
        'https://smg.itechart-group.com/MobileServiceNewTest/'
        'MobileService.svc/Authenticate?username=%s&password=%s')
    EMPLOYERS_URL = (
        'https://smg.itechart-group.com/MobileServiceNewTest/'
        'MobileService.svc/GetAllEmployees?sessionId=%s')

    EMPLOYERS_INFO_URL = (
        'https://smg.itechart-group.com/MobileServiceNewTest/'
        'MobileService.svc/GetEmployeeDetails?sessionId=%s&profileId=%s')

    def __init__(self, username, password):
        self.username = username
        self.password = password
        self._session_id = None

    @property
    def session_id(self):
        if self._session_id is None:
            self._session_id = self._get_session_id()
        return self._session_id

    def _get_session_id(self):
        url = self.AUTH_URL % (self.username, self.password)
        response = requests.get(url).json()
        return response['SessionId']

    def get_employers(self):
        url = self.EMPLOYERS_URL % self.session_id
        response = requests.get(url).json()
        return response['Profiles']

    def get_employer_info(self, profile_id):
        url = self.EMPLOYERS_INFO_URL % (self.session_id, profile_id)
        response = requests.get(url).json()
        return response

    @classmethod
    def get_employers_picture(cls, url):
        picture = requests.get(url, stream=True).raw
        return picture

    def process_employer(self, employer_id):
        logger.info("Getting employer info: %s" % employer_id)
        employer_info = self.get_employer_info(employer_id)
        logger.info("Getting employer picture: %s" % employer_info['Image'])
        employer_picture = StringIO(
            self.get_employers_picture(employer_info['Image']))
        employer = Employer(*employer_info)
        employer.image.save(
            '%s.png' % employer_id, employer_picture, save=False)
        employer.save()
        logger.info("Added new employer")

    def start(self):
        employers_file = os.path.join(settings.MEDIA_ROOT, 'employers.json')
        if os.path.exists(employers_file):
            with open(employers_file) as fl:
                employers = json.loads(fl.read())
        else:
            employers = self.get_employers()
            with open(employers_file, 'w') as fl:
                fl.write(json.dumps(employers))
        logger.info("Got employers list")
        queue = deque()
        for employer in employers:
            queue.append(int(employer['ProfileId']))
        pool = Pool(10)
        while queue:
            pool.spawn(self.process_employer(queue.pop()))
        pool.join()
