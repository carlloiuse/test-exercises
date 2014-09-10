from django.shortcuts import render
from .forms import MorseCodeForm

def home(request, template_name='core/home.html'):
    return render(request, template_name, {
        'form': MorseCodeForm(),
        })
