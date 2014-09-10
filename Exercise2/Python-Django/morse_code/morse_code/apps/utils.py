from django.conf import settings
from logging import getLogger


logger = getLogger(getattr(settings, 'DEFAULT_LOGGER_PROFILE', 'default'))


def debug(*messages, **kwargs):
    logging_type = kwargs.get('type', 'debug')
    request = kwargs.get('request', None)

    full_message = u''

    if request:
        full_message += u'[{}] {} '.format(get_client_ip(request),
                                          request.user if request.user.is_authenticated() else '')

    for message in messages:
        full_message += str(message).decode('utf-8')

    logging_method = getattr(logger, logging_type, None) or logger.debug
    logging_method(full_message)


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')

    if x_forwarded_for:
        return x_forwarded_for.split(',')[0]
    else:
        return request.META.get('REMOTE_ADDR')
