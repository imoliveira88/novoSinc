from __future__ import absolute_import, unicode_literals
from celery import shared_task
from datetime import datetime
import logging
from aplicacao.queries import faturas_proximas_vencer
from aplicacao.emails import notificar_clientes_teste

logger = logging.getLogger(__name__)

@shared_task
def my_background_task():
    try:
        now = datetime.now()
        formatted_time = now.strftime("%d-%m-%Y %H:%M:%S")
        message = f"Tarefa de background rodando em {formatted_time}"
        print(message)
        logger.info(message)
    except Exception as e:
        print(f"Error in my_background_task: {e}")
        logger.exception(f"Error in my_background_task: {e}")

@shared_task
def tarefa(request):
    print("Antes da captura de todos os clientes na condição de faturas próximas ao vencimento")
    clientes = faturas_proximas_vencer()
    print("Dicionário de clientes setado")
    notificar_clientes_teste(2,clientes)
    print("Após envio dos e-mails")