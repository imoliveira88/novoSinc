import os
import time
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from aplicacao.date import formatar_data_por_extenso, get_data
from aplicacao.queries import salva_ultima_notificacao
from jinja2 import Environment, FileSystemLoader
from aplicacao.queries import faturas_proximas_vencer, faturas_vencidas
from novoSinc.settings import BASE_DIR

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
    if (tag != 2 and (validar_valor_no_array(cliente.IDPERFILFATURAMENTO, ['30000009', '3']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES COMERCIAL!")
        colaboradores = GFIN + COLABORADORES_COMERCIAL
    elif (tag != 2 and (validar_valor_no_array(cliente.IDPERFILFATURAMENTO,[ '30000010', '2', '1']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES RESIDENCIAL!")
        colaboradores = GFIN + COLABORADORES_RESIDENCIAL
    elif (tag != 2 and (cliente.IDPERFILFATURAMENTO == '10020000' )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES VEICULAR!")
        colaboradores = GFIN + COLABORADORES_VEICULAR
    elif (tag != 2 and (validar_valor_no_array(cliente.IDPERFILFATURAMENTO, ['20020329', '30000007', '30000028', '30000016', '5', '9']) )):
        #console.log("ADICIONANDO GRUPO DE COLABORADORES INDUSTRIAL!")
        colaboradores = GFIN + COLABORADORES_INDUSTRIAL
    else:
        #console.log("NENHUM GRUPO DE COLABORADOR ADICIONADO!")
        colaboradores = GFIN
    if  (cliente.NOT == 'EMAIL'):
        # Refatorar enviar_email de modo a fazer um tratamento de exceção que fará o papel do callback; "err" é booleano
        err = enviar_email(tag, cliente.CONTATO,  colaboradores, cliente)

        if err:
            print(err)
            print('OVERSENDING: AGUARDANDO 20 SEGUNDOS PARA CONTINUAR')
            time.sleep(15) # Aguarda 15 segundos antes de tentar reenviar
            espera_atual = espera + 15
            notifica_cliente(tag, cliente, espera_atual)
            if espera_atual > 45:
                return # Caso tenha falhado três vezes, passa para o próximo cliente, evitando loop infinito
        else:
            salva_ultima_notificacao(cliente, tag)
        #console.log("CLIENTE SEM E-MAIL PARA CONTATO - " + cliente.TITULO);

#Retirada a condicional referente ao envio de SMS
def notificar_clientes(tag, clientes): # Era notificarClientes
    for cliente in clientes:
        notifica_cliente(tag,cliente)
    # E-mails enviados
    
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
        if contato['EMAIL'] is not None and not is_excecao(contato['EMAIL']):
            contato['NOT'] = 'EMAIL'
            contato['CONTATO'] = contato['EMAIL']
        else:
            contato['NOT'] = 'NULL'

    return contatos

def validar_valor_no_array(val, array):
    for a in array:
        if(a == val):
            return True
    return False

def enviar_email(tag, destinatario, cco, contexto):
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

    caminho = f'{BASE_DIR}/aplicacao/static/images/logo-coper2.png'

    with open(caminho, 'rb') as file:
        logo_content = file.read()
        
    caminho2 = f'{BASE_DIR}/aplicacao/static/images/logo-coper2.png'
    with open(caminho2, 'rb') as file:
        icon_content = file.read()

    message = MIMEMultipart()
    message['From'] = 'sinc@copergas.com.br'
    message['To'] = destinatario
    message['Bcc'] = ', '.join(cco)
    message['Subject'] = assunto

    message.attach(MIMEText(''))  # Text content

    # HTML content
    html_content = render_email_template(tag, contexto)

    message.attach(MIMEText(html_content, 'html'))

    # Attachments
    message.attach(MIMEImage(logo_content, name='logo-coper2.png'))
    message.attach(MIMEImage(icon_content, name='2-via-ico.png'))

    # Headers
    message['Return-Receipt-To'] = 'sinc@copergas.com.br'
    message['Disposition-Notification-To'] = 'sinc@copergas.com.br'

    # DSN settings
    message['DSN'] = 'SiNC 0'
    message['Return'] = 'headers'
    message['Notify'] = 'success, failure, delay'
    message['Recipient'] = 'sinc@copergas.com.br'

    try:
        # Setup the SMTP server
        with smtplib.SMTP('mail.copergas.com.br', 25) as server:
            server.starttls()
            # Login to the server
            server.login('sinc', 'Ks9xKi5CClBMqAPr1iyu')
            # Send the email
            server.send_message(message)
        return True
    except Exception as e:
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

def render_email_template(tag, contexto):
    modelos_path = os.path.join(BASE_DIR, 'aplicacao/modelos')
    templates_env = Environment(loader=FileSystemLoader(modelos_path))
    template_name = f'email_{define_tipo_not(tag)}.htm'
    template = templates_env.get_template(template_name)
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