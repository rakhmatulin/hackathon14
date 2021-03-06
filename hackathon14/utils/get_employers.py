# -*- coding: utf-8 -*-
import json
import re
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.core.files.uploadedfile import SimpleUploadedFile
from django.http import HttpResponse
from django.utils.datetime_safe import datetime
import requests
import logging
from StringIO import StringIO
import os
from django.conf import settings
from hackathon14.twid.models import Employer


logger = logging.getLogger('twid')


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
        return picture.read()

    @staticmethod
    def parse_date(date_str):
        dt = re.search(r'\d+', date_str).group()
        return datetime.fromtimestamp(int(int(dt) / 1000.0))

    def process_employer(self, employer_id):
        logger.info("Getting employer info: %s" % employer_id)
        employer_info = self.get_employer_info(employer_id)['Profile']
        logger.info("Getting employer picture: %s" % employer_info['Image'])
        employer_picture = StringIO(
            self.get_employers_picture(employer_info['Image']))
        birth_day = SmgApi.parse_date(employer_info['Birthday'])
        params = {
            'profile_id': employer_info['ProfileId'],
            'dept_id': employer_info['DeptId'],
            'first_name_eng': employer_info['FirstNameEng'],
            'last_name_eng': employer_info['LastNameEng'],
            'first_name': employer_info['FirstName'],
            'last_name': employer_info['LastName'],
            'birth_day': birth_day,
            'skype': employer_info['Skype'],
            'phone': employer_info['Phone'],
            'room': employer_info['Room'],
            'email': employer_info['Email']
        }
        employer = Employer(**params)
        image_name = '%s.png' % employer_id
        suf = SimpleUploadedFile(
            image_name, employer_picture.read(), content_type='image/png')
        employer.image.save('%s.png' % employer_id, suf, save=False)
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
        for employer in employers:
            self.process_employer(employer['ProfileId'])

    def login(self, request):
        url = self.AUTH_URL % (self.username, self.password)
        response = requests.get(url).json()
        if response["ErrorCode"]:
            return
        employer = Employer.objects.filter(
            email__startswith=self.username).first()
        if not employer:
            logger.error(
                "Cannot find employer with username %s" % self.username)
            return
        if not employer.user_id:
            # create new user
            logger.error("Creating new user")
            user = User(username=employer.profile_id)
            user.set_password('')
            user.save()
            employer.user_id = user
            employer.save()
        user = authenticate(username=employer.user_id.username, password='')
        if not user:
            logger.error("cannot authenticate user %s" % user)
            return
        login(request, user)
        return user


def json_response(data, status=200):
    return HttpResponse(
        json.dumps(data), content_type="application/json", status=status)


def json_error_response(text, status=400):
    return json_response({'error': {'message': text}}, status=status)


def json_success_response(text, status=200):
    return json_response({'success': {'message': text}}, status=status)
