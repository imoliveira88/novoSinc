import os
import time
import smtplib
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
    espera_atual = 0
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
    if  (cliente['EMAIL'] != None):
        # Refatorar enviar_email de modo a fazer um tratamento de exceção que fará o papel do callback; "err" é booleano
        #err = enviar_email(tag, cliente.CONTATO, colaboradores, cliente) # Produção
        err = not enviar_email(tag, cliente['EMAIL'],'', cliente) # Teste

        if err:
            print(err)
            print('Oversending: aguardando 15 segundos para tentar novamente.')
            time.sleep(15) # Aguarda 15 segundos antes de tentar reenviar
            espera_atual = espera + 15
            notifica_cliente(tag, cliente, espera_atual)
            if espera_atual > 45:
                salva_ultima_notificacao(cliente, tag) # Caso tenha falhado três vezes, passa para o próximo cliente, evitando loop infinito
        else:
            cliente['STATUS'] = 'Enviado' # E-mail enviado com sucesso
            salva_ultima_notificacao(cliente, tag) # Persistirá na tabela de envios independente do status do envio
    else:
        salva_ultima_notificacao(cliente, tag)

def notifica_cliente_teste(tag, cliente, espera):
    espera_atual = 0
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
    if  (cliente['EMAIL'] != None):
        # Refatorar enviar_email de modo a fazer um tratamento de exceção que fará o papel do callback; "err" é booleano
        #err = enviar_email(tag, cliente.CONTATO, colaboradores, cliente) # Produção
        err = not enviar_email(tag, cliente['EMAIL'],'', cliente) # Teste

        if err:
            print(err)
            print('Oversending: aguardando 15 segundos para tentar novamente.')
            time.sleep(15) # Aguarda 15 segundos antes de tentar reenviar
            espera_atual = espera + 15
            notifica_cliente(tag, cliente, espera_atual)
            if espera_atual > 45:
                salva_ultima_notificacao_teste(cliente, tag) # Caso tenha falhado três vezes, passa para o próximo cliente, evitando loop infinito
        else:
            cliente['STATUS'] = 'Enviado' # E-mail enviado com sucesso
            salva_ultima_notificacao_teste(cliente, tag) # Persistirá na tabela de envios independente do status do envio
    else:
        salva_ultima_notificacao_teste(cliente, tag)


#Retirada a condicional referente ao envio de SMS
def notificar_clientes(tag, clientes): # Era notificarClientes
    for cliente in clientes:
        notifica_cliente(tag,cliente)
    # E-mails enviados

#Retirada a condicional referente ao envio de SMS
def notificar_clientes_teste(tag, clientes): # Era notificarClientes
    for cliente in clientes:
        cliente['DATA'] = datetime.now().strftime('%Y-%m-%d')
        cliente['STATUS'] = 'Não enviado'
        cliente['EMAIL'] = 'igor.oliveira@copergas.com.br'
        notifica_cliente_teste(tag,cliente,0)
    # E-mails enviados
    if tag == 3:
        enviar_email_relatorio('Vencidas')
    else:
        enviar_email_relatorio('Próximas a vencer')
    
def trata_array(contatos):
    def is_excecao(email):
        email_excecao = ['fulano@gmail.com']
        email = email.split('; ')

        # Compare if all exceptions are in some client's email
        for excecao in email_excecao:
            if excecao in email:
                return True
        return False

    for contato in contatos:
        contato['STATUS'] = False # Valor da key STATUS inicialmente setada para False
        if contato['EMAIL'] is not None and not is_excecao(contato['EMAIL']):
            contato['NOT'] = 'EMAIL'
            contato['CONTATO'] = contato['EMAIL']
        else:
            contato['NOT'] = 'NULL'
            contato['CONTATO'] = contato['']

    return contatos

def validar_valor_no_array(val, array):
    for a in array:
        if(a == val):
            return True
    return False

def read_file_content(file_path):
    with open(file_path, 'rb') as file:
        return file.read()

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
    message['To'] = destinatario
    message['Bcc'] = ', '.join(cco)
    message['Subject'] = assunto

    # Attach HTML content with inline images
    html_content = render_email_template_tabela(tag, contexto) #28DEZ - Estava render_email_template
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
            server.login('sinc', 'Ks9xKi5CClBMqAPr1iyu')
            # Send the email
            server.send_message(message)
            logger.info(f'E-mail enviado para {destinatario}')
        return True
    except smtplib.SMTPException as e:
        print(f"SMTP Exception: {e}")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

def enviar_email_relatorio(tag):
    
    assunto = f'SINC - Relatório de Faturas {tag}'

    # Create MIME message
    message = MIMEMultipart()
    message['From'] = 'sinc@copergas.com.br'
    message['To'] = 'igor.oliveira@copergas.com.br' #', '.join(cco) TODO colocar quem está no conhecimento do modelo
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
        notificar_clientes(TAG_FATURA_PROX_VENCER, trata_array(clientes))

# AVISO DE FATURA VENCIDA
def avisar_faturas_vencidas():
    rows = faturas_vencidas()
    if rows.len > 0:
        clientes = rows
        afetadas = rows.len
        notificar_clientes(TAG_FATURA_VENCIDA, trata_array(clientes))

#"tag" pode ser "VENCIDAS" OU "PRÓXIMAS A VENCER"
#Deve ser colocada uma lógica de exceção para tratar a tag
def devolve_html(tag):
    current_date = timezone.now().date()  # Get the current date
    current_date_formatted = current_date.strftime("%d-%m-%Y")
    
    envios = Envio.objects.filter(tipo_envio=tag, data_envio__gt=current_date).order_by('id')

    conteudo_html = f'<h2>Relatório de envio de faturas de {current_date_formatted}<h2><br>'

    conteudo_html += f'<table style="border: 2px; background: #bcbcbc; padding: 2rem"><tr><th>Contrato</th><th>Título</th><th>E-mail</th><th>Data de envio</th><th>Status</th></tr>'
    for envio in envios:
        data_envio_formatted = envio.data_envio.strftime("%d-%m-%Y")  # Format date as dd-mm-yyyy
        conteudo_html += f'<tr><td>{envio.contrato}</td><td>{envio.titulo}</td><td>{envio.email}</td><td>{data_envio_formatted}</td><td>{envio.status_envio}</td></tr>'
    
    conteudo_html += '</table>'
    return conteudo_html