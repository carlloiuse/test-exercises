from django import forms
from django.utils.translation import ugettext_lazy as _

class MorseCodeForm(forms.Form):
    data_in = forms.CharField(label=_("Input"), widget=forms.Textarea,
        required=False)
    data_out = forms.CharField(label=_("Output"), widget=forms.Textarea,
        required=False)
