from __future__ import absolute_import, unicode_literals
from celery import shared_task
from datetime import datetime
import logging
from aplicacao.queries import faturas_proximas_vencer, faturas_vencidas
from aplicacao.emails import notificar_clientes_teste, notificar_clientes

logger = logging.getLogger(__name__)

@shared_task
def tarefa():
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
def envia_notificacoes_teste():
    print("Antes da checagem de e-mails a enviar")
    clientes = faturas_proximas_vencer()
    print("Dicionário de clientes com faturas próximas a vencer setado")
    notificar_clientes_teste(2,clientes)
    print("Após envio dos e-mails de notificação de faturas próximas a vencer e início do dicionário de clientes com faturas vencidas")

    clientes = faturas_vencidas()
    print("Dicionário de clientes com faturas vencidas setado")
    notificar_clientes_teste(3,clientes)
    print("Após envio dos e-mails de notificação de faturas vencidas")

@shared_task
def envia_notificacoes():
    print("Antes da checagem de e-mails a enviar")
    clientes = faturas_proximas_vencer()
    print("Dicionário de clientes com faturas próximas a vencer setado")
    notificar_clientes(2,clientes)
    print("Após envio dos e-mails de notificação de faturas próximas a vencer e início do dicionário de clientes com faturas vencidas")

    clientes = faturas_vencidas()
    print("Dicionário de clientes com faturas vencidas setado")
    notificar_clientes(3,clientes)
    print("Após envio dos e-mails de notificação de faturas vencidas")