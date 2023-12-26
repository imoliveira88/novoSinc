from __future__ import absolute_import, unicode_literals
import os
from celery import Celery
from celery.schedules import crontab
import logging

logger = logging.getLogger(__name__)

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'novoSinc.settings')
app = Celery('novoSinc', broker='redis://192.168.60.136:6379/0')

# Load task modules from all registered Django app configs.
app.config_from_object('django.conf:settings', namespace='CELERY')

app.conf.beat_schedule = {
    'my_background_task': {
        'task': 'aplicacao.tasks.my_background_task',
        'schedule': crontab(minute='*'),  # Run every minute
    },
}

# Auto-discover tasks in all installed apps.
app.autodiscover_tasks()