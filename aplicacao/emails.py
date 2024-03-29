import os
import time
import smtplib
import re
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from aplicacao.date import formatar_data_por_extenso, get_data
from aplicacao.queries import salva_ultima_notificacao, salva_ultima_notificacao_teste
from jinja2 import Environment, FileSystemLoader
from aplicacao.queries import faturas_proximas_vencer, faturas_vencidas
from novoSinc.settings import BASE_DIR, STATIC_ROOT
from datetime import datetime
from django.utils import timezone
from aplicacao.models import Modelo, Envio

import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

GFIN = ['sinc@copergas.com.br', 'caixa.sinc@copergas.com.br']

# COLABORADORES QUE VÃO RECEBER UMA CÓPIA POR ESTAREM NO GRUPO DE EMAIL
COLABORADORES_COMERCIAL =   ['sinc.comercial@copergas.com.br']
COLABORADORES_RESIDENCIAL = ['sinc.residencial@copergas.com.br']
COLABORADORES_VEICULAR =    ['sinc.veicular@copergas.com.br']
COLABORADORES_INDUSTRIAL =  ['sinc.industrial@copergas.com.br']

TAG_FATURA_DISPONIVEL = 1
TAG_FATURA_PROX_VENCER = 2
TAG_FATURA_VENCIDA = 3
TAG_AVISO_SUSPENSAO = 4

def notifica_cliente(tag, cliente, espera):
    espera_atual = espera
    if (tag != 2 and (validar_valor_no_array(cliente['IDPERFILFATURAMENTO'], ['30000009', '3']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES COMERCIAL!")
        colaboradores = GFIN + COLABORADORES_COMERCIAL
    elif (tag != 2 and (validar_valor_no_array(cliente['IDPERFILFATURAMENTO'],[ '30000010', '2', '1']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES RESIDENCIAL!")
        colaboradores = GFIN + COLABORADORES_RESIDENCIAL
    elif (tag != 2 and (cliente['IDPERFILFATURAMENTO'] == '10020000' )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES VEICULAR!")
        colaboradores = GFIN + COLABORADORES_VEICULAR
    elif (tag != 2 and (validar_valor_no_array(cliente['IDPERFILFATURAMENTO'], ['20020329', '30000007', '30000028', '30000016', '5', '9']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES INDUSTRIAL!")
        colaboradores = GFIN + COLABORADORES_INDUSTRIAL
    else:
        colaboradores = GFIN
    print(f'Cliente atual -> {cliente}')
    if  (cliente['EMAIL'] is not None and cliente['EMAIL'] != '' and email_valido(cliente['EMAIL'])):
        # Refatorar enviar_email de modo a fazer um tratamento de exceção que fará o papel do callback; "err" é booleano
        #err = enviar_email(tag, cliente.CONTATO, colaboradores, cliente) # Produção
        err = not enviar_email(tag, cliente['EMAIL'],'', cliente) # Teste

        if err:
            print(f'Oversending: aguardando 25 segundos para tentar novamente. Erro: {err}')
            time.sleep(25) # Aguarda 25 segundos antes de tentar reenviar
            espera_atual = espera + 25
            print(f'Espera atual: {espera_atual}')
            notifica_cliente(tag, cliente, espera_atual)
            if espera_atual > 75:
                cliente['STATUS'] = 'Não enviado'
                salva_ultima_notificacao(cliente, tag) # Caso tenha falhado três vezes, passa para o próximo cliente, evitando loop infinito
        else:
            cliente['STATUS'] = 'Enviado' # E-mail enviado com sucesso
            salva_ultima_notificacao(cliente, tag) # Persistirá na tabela de envios independente do status do envio
    else:
        cliente['STATUS'] = 'Não enviado'
        salva_ultima_notificacao(cliente, tag)

def email_valido(email):
    # Regular expression pattern for validating email addresses
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

    # Check if the email matches the pattern
    if re.match(pattern, email):
        return True
    else:
        return False

def notifica_cliente_teste(tag, cliente, espera):
    espera_atual = espera
    colaboradores = ''
    if (tag != 2 and (validar_valor_no_array(cliente['IDPERFILFATURAMENTO'], ['30000009', '3']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES COMERCIAL!")
        colaboradores = GFIN + COLABORADORES_COMERCIAL
    elif (tag != 2 and (validar_valor_no_array(cliente['IDPERFILFATURAMENTO'],[ '30000010', '2', '1']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES RESIDENCIAL!")
        colaboradores = GFIN + COLABORADORES_RESIDENCIAL
    elif (tag != 2 and (cliente['IDPERFILFATURAMENTO'] == '10020000' )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES VEICULAR!")
        colaboradores = GFIN + COLABORADORES_VEICULAR
    elif (tag != 2 and (validar_valor_no_array(cliente['IDPERFILFATURAMENTO'], ['20020329', '30000007', '30000028', '30000016', '5', '9']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES INDUSTRIAL!")
        colaboradores = GFIN + COLABORADORES_INDUSTRIAL
    else:
        #console.log("NENHUM GRUPO DE COLABORADOR ADICIONADO!")
        colaboradores = GFIN
    print(f'Cliente atual -> {cliente}')
    if  (cliente['EMAIL'] is not None and cliente['EMAIL'] != '') :
        # Refatorar enviar_email de modo a fazer um tratamento de exceção que fará o papel do callback; "err" é booleano
        #err = enviar_email(tag, cliente.CONTATO, colaboradores, cliente) # Produção
        err = not enviar_email(tag, cliente['EMAIL'],'', cliente) # Teste

        if err:
            print(f'Oversending: aguardando 25 segundos para tentar novamente. Erro: {err}')
            time.sleep(25) # Aguarda 15 segundos antes de tentar reenviar
            espera_atual = espera + 25
            notifica_cliente(tag, cliente, espera_atual)
            if espera_atual > 75:
                cliente['STATUS'] = 'Não enviado - Problema SMTP'
                salva_ultima_notificacao_teste(cliente, tag) # Caso tenha falhado três vezes, passa para o próximo cliente, evitando loop infinito
        else:
            cliente['STATUS'] = 'Enviado' # E-mail enviado com sucesso
            salva_ultima_notificacao_teste(cliente, tag) # Persistirá na tabela de envios independente do status do envio
    else:
        cliente['STATUS'] = 'Não enviado'
        salva_ultima_notificacao_teste(cliente, tag)


#Retirada a condicional referente ao envio de SMS
def notificar_clientes(tag, clientes): # Era notificarClientes
    for cliente in clientes:
        if not ja_enviado(cliente,tag):
            notifica_cliente(tag,cliente,0) #Adicionado 21FEV2024
    # E-mails enviados
    if tag == 3:
        emails = Modelo.objects.get(id=2).emails
        enviar_email_relatorio('Vencidas',emails)
    else:
        emails = Modelo.objects.get(id=1).emails
        print(f'Emails {emails}')
        enviar_email_relatorio('Próximas a vencer',emails)

#Retirada a condicional referente ao envio de SMS
def notificar_clientes_teste(tag, clientes): # Era notificarClientes
    for cliente in clientes:
        cliente['DATA'] = datetime.now().strftime('%Y-%m-%d')
        cliente['STATUS'] = 'Não enviado'
        cliente['EMAIL'] = 'igor.oliveira@copergas.com.br'
        notifica_cliente_teste(tag,cliente,0)
    # E-mails enviados
    if tag == 3:
        enviar_email_relatorio('Vencidas',cliente['EMAIL'])
    else:
        emails = Modelo.objects.get(id=1).emails
        print(f'Emails {emails}')
        enviar_email_relatorio('Próximas a vencer','igor.oliveira@copergas.com.br,jose.logiquesistemas@copergas.com.br')

def validar_valor_no_array(val, array):
    for a in array:
        if(a == val):
            return True
    return False

def read_file_content(file_path):
    with open(file_path, 'rb') as file:
        return file.read()

def ja_enviado(cliente,tag):
    envios = Envio.objects.filter(tipo_envio=tag,titulo=cliente['TITULO'])
    if envios.count() > 0:
        return True
    return False


def enviar_email(tag, destinatario, cco, contexto):
    caminho1_path = f'{STATIC_ROOT}/images/logo-coper2.png'
    caminho2_path = f'{STATIC_ROOT}/images/2-via-ico.png'

    with open(caminho1_path, 'rb') as caminho1_file:
        caminho1_content = caminho1_file.read()

    with open(caminho2_path, 'rb') as caminho2_file:
        caminho2_content = caminho2_file.read()

    assunto = ''

    if tag == 1:
        assunto = 'Copergás - Fatura Disponível'
    elif tag == 3:
        assunto = 'Copergás - Aviso de Débito'
    elif tag == 2:
        assunto = 'Copergás - Fatura Próxima a Vencer'
    elif tag == 4:
        assunto = 'Copergás - Aviso de Suspensão'

    contexto['DATA_EXTENSA'] = formatar_data_por_extenso(get_data(0, '/'))
    contexto['CAMINHO1'] = 'cid:logo-coper2.png'
    contexto['CAMINHO2'] = 'cid:2-via-ico.png'

    # Create MIME message
    message = MIMEMultipart()
    message['From'] = 'sinc@copergas.com.br'
    destinatarios = destinatario.replace(" ","") #Alteração em 21FEV2024 - Objetivo: excluir espaços vazios na string de e-mails
    recipients_set = set(destinatarios.split(';'))
    recipients = list(recipients_set)
    message['To'] = ','.join(recipients)
    #message['Bcc'] = ', '.join(cco) Retirado dia 07FEV2024 devido a erro ocorrido no dia 06FEV2024
    message['Subject'] = assunto

    # Attach HTML content with inline images
    html_content = render_email_template_tabela(tag, contexto)
    message.attach(MIMEText(html_content, 'html'))

    # Attach inline images
    image1 = MIMEImage(caminho1_content)
    image1.add_header('Content-ID', '<logo-coper2.png>')
    message.attach(image1)

    image2 = MIMEImage(caminho2_content)
    image2.add_header('Content-ID', '<2-via-ico.png>')
    message.attach(image2)

    message['Return-Receipt-To'] = 'sinc@copergas.com.br'
    message['Disposition-Notification-To'] = 'sinc@copergas.com.br'
    message['DSN'] = 'SiNC 0'
    message['Return'] = 'headers'
    message['Notify'] = 'success, failure, delay'
    message['Recipient'] = 'sinc@copergas.com.br'

    try:
        # Setup the SMTP server
        with smtplib.SMTP('mail.copergas.com.br', 25) as server:
            # Login to the server
            server.login('sinc', 'Ks9xKi5CClBMqAPr1iyu')#TODO Tentar sem autenticação
            # Send the email
            server.send_message(message)
            logger.info(f'E-mail enviado para {recipients}')
        return True
    except smtplib.SMTPException as e:
        print(f"SMTP Exception: {e}")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

def enviar_email_relatorio(tag,emails):

    assunto = f'SINC - Relatório de Faturas {tag}'

    # Create MIME message
    message = MIMEMultipart()
    message['From'] = 'sinc@copergas.com.br'
    if (emails[-1] == ','):
        message['To'] = emails[:-1] #', '.join(cco) TODO colocar quem está no conhecimento do modelo
    else:
        message['To'] = emails
    message['Subject'] = assunto

    # Attach HTML content with inline images
    html_content = devolve_html(tag)
    message.attach(MIMEText(html_content, 'html'))

    message['Return-Receipt-To'] = 'sinc@copergas.com.br'
    message['Disposition-Notification-To'] = 'sinc@copergas.com.br'
    message['DSN'] = 'SiNC 0'
    message['Return'] = 'headers'
    message['Notify'] = 'success, failure, delay'
    message['Recipient'] = 'sinc@copergas.com.br'

    try:
        # Setup the SMTP server
        with smtplib.SMTP('mail.copergas.com.br', 25) as server:
            # Login to the server
            server.login('sinc', 'Ks9xKi5CClBMqAPr1iyu')
            # Send the email
            server.send_message(message)
        return True
    except smtplib.SMTPException as e:
        print(f"Exceção SMTP: {e}")
        return False
    except Exception as e:
        print(f"Um erro inesperado ocorreu: {e}")
        return False

def define_tipo_not(tag):
    models = {
        1: 'fatura-disp',
        3: 'fatura-venc',
        2: 'fatura-prox',
        4: 'aviso-susp',
        5: 'aptos-para-corte'
    }
    return models.get(tag)

# Método recupera modelo de e-mails constante em templates/modelos
def render_email_template(tag, contexto):
    modelos_path = os.path.join(BASE_DIR, 'templates/modelos')
    templates_env = Environment(loader=FileSystemLoader(modelos_path))
    template_name = f'email_{define_tipo_not(tag)}.html'
    template = templates_env.get_template(template_name)
    html_content = template.render(contexto)
    return html_content

# Método recupera modelo de e-mails constante em na tabela Modelo
def render_email_template_tabela(tag, contexto):
    # Retrieve the Modelo object based on the provided tag
    modelos_path = os.path.join(BASE_DIR, 'templates/modelos')
    templates_env = Environment(loader=FileSystemLoader(modelos_path))

    template_name = f'email_{define_tipo_not(tag)}.html'
    modelo = Modelo.objects.get(nome=template_name)

    # Use the Django template engine to render the template
    template = templates_env.from_string(modelo.conteudo)
    html_content = template.render(contexto)

    return html_content

# AVISO DE PROX A VENCER
def avisar_prox_vencer():
    rows = faturas_proximas_vencer()
    if rows.len > 0:
        clientes = rows
        afetadas = rows.len
        notificar_clientes(TAG_FATURA_PROX_VENCER, clientes)

# AVISO DE FATURA VENCIDA
def avisar_faturas_vencidas():
    rows = faturas_vencidas()
    if rows.len > 0:
        clientes = rows
        afetadas = rows.len
        notificar_clientes(TAG_FATURA_VENCIDA, clientes)

#"tag" pode ser "VENCIDAS" OU "PRÓXIMAS A VENCER"
#Deve ser colocada uma lógica de exceção para tratar a tag
def devolve_html(tag):
    current_date = timezone.now().date()  # Get the current date
    current_date_formatted = current_date.strftime("%d-%m-%Y")

    envios = Envio.objects.filter(tipo_envio=tag, data_envio__gt=current_date).order_by('id')
    numero_envios = envios.count()

    conteudo_html = f'<p><b>Relatório de envio do SINC - {current_date_formatted}</b></p>'

    if numero_envios > 0:
        conteudo_html += f'<p>Atentar para os e-mails não enviados: cheque se os e-mails de notificação estão definidos e se há e-mail inválido.</p>'
        conteudo_html += f'<p>Sendo qual for o caso, é indicado que corrija os e-mails tanto do Pirâmide como no GGAS.</p>'
        conteudo_html += f'<table style="border: 2px; background: #fff7f7; padding: 2rem"><tr><th>Contrato</th><th>Cliente</th><th>Título</th><th>Data de vencimento</th><th>E-mail</th><th>Data de envio</th><th>Status</th></tr>'
        for envio in envios:
            data_envio_formatted = envio.data_envio.strftime("%d-%m-%Y")
            conteudo_html += f'<tr><td>{envio.contrato}</td><td>{envio.cliente}</td><td>{envio.titulo}</td><td>{envio.data_vencimento}</td><td>{envio.email}</td><td>{data_envio_formatted}</td><td>{envio.status_envio}</td></tr>'
    else:
        conteudo_html += f'<p>Não há envios previstos para a data de hoje.</p>'

    conteudo_html += '</table><br><p>Atenciosamente, GETI.</p>'
    return conteudo_html

def devolve_string_emails(arquivo):
    emails = []
    try:
        with open(arquivo, 'r') as file:
            for line in file:
                email = line.strip()  # Remove leading/trailing whitespaces and newlines
                emails.append(email)
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
    return emails

# Método recupera modelo de e-mails constante em na tabela Modelo
def render_email_template_tabela_geral(modelo_email, contexto):
    # Retrieve the Modelo object based on the provided tag
    modelos_path = os.path.join(BASE_DIR, 'templates/modelos')
    templates_env = Environment(loader=FileSystemLoader(modelos_path))

    template_name = f'{modelo_email}.html'
    modelo = Modelo.objects.get(nome=template_name)

    # Use the Django template engine to render the template
    template = templates_env.from_string(modelo.conteudo)
    html_content = template.render(contexto)

    return html_content

def notificar_geral(modelo, emails, assunto): # Era notificarClientes
    for email in emails:
        enviar_email_geral(email,'igor.oliveira@copergas.com.br', assunto, modelo) #Adicionado 21FEV2024

#Envia e-mails de acordo com o modelo, contexto e assunto definidos
def enviar_email_geral(destinatario, cco, assunto_email, modelo): #TODO Atentar ao BCC, visto que está com o cco. Verificar funcionamento correto
    caminho1_path = f'{STATIC_ROOT}/images/logo-coper2.png'
    caminho2_path = f'{STATIC_ROOT}/images/2-via-ico.png'

    contexto = []

    with open(caminho1_path, 'rb') as caminho1_file:
        caminho1_content = caminho1_file.read()

    with open(caminho2_path, 'rb') as caminho2_file:
        caminho2_content = caminho2_file.read()

    assunto = assunto_email

    contexto['DATA_EXTENSA'] = formatar_data_por_extenso(get_data(0, '/'))
    contexto['CAMINHO1'] = 'cid:logo-coper2.png'
    contexto['CAMINHO2'] = 'cid:2-via-ico.png'

    # Create MIME message
    message = MIMEMultipart()
    message['From'] = 'sinc@copergas.com.br'
    destinatarios = destinatario.replace(" ","") #Alteração em 21FEV2024 - Objetivo: excluir espaços vazios na string de e-mails
    recipients_set = set(destinatarios.split(';'))
    recipients = list(recipients_set)
    message['To'] = ','.join(recipients)
    message['Bcc'] = cco
    message['Subject'] = assunto

    # Attach HTML content with inline images
    html_content = render_email_template_tabela_geral(modelo, contexto)
    message.attach(MIMEText(html_content, 'html'))

    # Attach inline images
    image1 = MIMEImage(caminho1_content)
    image1.add_header('Content-ID', '<logo-coper2.png>')
    message.attach(image1)

    image2 = MIMEImage(caminho2_content)
    image2.add_header('Content-ID', '<2-via-ico.png>')
    message.attach(image2)

    message['Return-Receipt-To'] = 'sinc@copergas.com.br'
    message['Disposition-Notification-To'] = 'sinc@copergas.com.br'
    message['DSN'] = 'SiNC 0'
    message['Return'] = 'headers'
    message['Notify'] = 'success, failure, delay'
    message['Recipient'] = 'sinc@copergas.com.br'

    try:
        # Setup the SMTP server
        with smtplib.SMTP('mail.copergas.com.br', 25) as server:
            # Login to the server
            server.login('sinc', 'Ks9xKi5CClBMqAPr1iyu')#TODO Tentar sem autenticação
            # Send the email
            server.send_message(message)
            logger.info(f'E-mail enviado para {recipients}')
        return True
    except smtplib.SMTPException as e:
        print(f"Exceção SMTP: {e}")
        return False
    except Exception as e:
        print(f"Um erro inesperado ocorreu: {e}")
        return False
