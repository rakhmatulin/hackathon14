from django import forms


class IndexFilterForm(forms.Form):

    FILTER_CHOICE = (
        (1, 'Date'),
        (2, 'Name'),
        (3, 'Owner')
    )

    device_filter = forms.TypedChoiceField(
        choices=FILTER_CHOICE, widget=forms.RadioSelect(),
        initial=FILTER_CHOICE[0][0], coerce=int,
        empty_value=FILTER_CHOICE[0][0])