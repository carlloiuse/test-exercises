from django.conf.urls import patterns, include, url

urlpatterns = patterns('morse_code.apps.core.views',
    url(r'$', 'home'),
)
