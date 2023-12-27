from __future__ import absolute_import, unicode_literals
import os
from celery import Celery
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'novoSinc.settings')

# Use RabbitMQ as the message broker
app = Celery('novoSinc')

# Load task modules from all registered Django app configs.
app.config_from_object('django.conf:settings', namespace='CELERY')

app.conf.beat_schedule = {
    'testa_envio_todos': {
        'task': 'aplicacao.tasks.testa_envio_todos',
        'schedule': crontab(minute='*'),  # Run every minute
    },
}

# Auto-discover tasks in all installed apps.
app.autodiscover_tasks()