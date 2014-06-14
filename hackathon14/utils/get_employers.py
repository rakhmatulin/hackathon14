# -*- coding: utf-8 -*-

import logging
import requests

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
