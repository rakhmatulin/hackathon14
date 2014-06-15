from django import forms
from hackathon14.utils.get_employers import SmgApi


class DevicesFilterForm(forms.Form):

    FILTER_CHOICE = (
        (1, 'Date'),
        (2, 'Name'),
        (3, 'Owner')
    )

    device_filter = forms.TypedChoiceField(
        choices=FILTER_CHOICE, widget=forms.RadioSelect(),
        initial=FILTER_CHOICE[0][0], coerce=int,
        empty_value=FILTER_CHOICE[0][0])


class EmployersFilterForm(forms.Form):

    FILTER_CHOICE = (
        (1, 'Date'),
        (2, 'Name'),
        (3, 'Count')
    )

    employer_filter = forms.TypedChoiceField(
        choices=FILTER_CHOICE, widget=forms.RadioSelect(),
        initial=FILTER_CHOICE[0][0], coerce=int,
        empty_value=FILTER_CHOICE[0][0])


class UpdateRequestForm(forms.Form):
    request_message = forms.Textarea()
    device = forms.IntegerField()


class SignInForm(forms.Form):

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(SignInForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['placeholder'] = 'username'
        self.fields['username'].widget.attrs['type'] = 'password'
        self.fields['password'].widget.attrs['placeholder'] = 'password'

    username = forms.CharField(
        max_length=100, required=True, widget=forms.PasswordInput())
    password = forms.CharField(max_length=100, required=True)

    def clean(self):
        cleaned_data = self.cleaned_data
        if not cleaned_data:
            return cleaned_data
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')
        if not username or not password:
            return cleaned_data
        api = SmgApi(username, password)
        user = api.login(self.request)
        if not user:
            raise forms.ValidationError(
                "Cannot login using SMG. Check username and password")
        return cleaned_data
