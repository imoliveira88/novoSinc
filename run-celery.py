from __future__ import absolute_import, unicode_literals
import os
import sys
from celery import Celery
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'novoSinc.settings')

# It uses REDIS as the message broker
app = Celery('novoSinc')

# Load task modules from all registered Django app configs.
app.config_from_object('django.conf:settings', namespace='CELERY')
app.conf.broker_connection_retry_on_startup = True

app.conf.beat_schedule = {
    'envia_notificacoes_teste': {
        'task': 'aplicacao.tasks.envia_notificacoes',
        'schedule': crontab(minute='35', hour='17', day_of_week='*'),  # It runs 14:40 every day
    },
}

# Auto-discover tasks in all installed apps.
app.autodiscover_tasks()