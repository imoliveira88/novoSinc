from aplicacao.date import get_data
from datetime import datetime, timedelta
from aplicacao.models import Envio
from django.utils import timezone
import cx_Oracle

def select_from_get_faturas_view():
    return (
        """SELECT CODDOC, MATRICULA, CLIENTE, TITULO, EMAIL, ID AS ID_CLIENTE, NOME_CLIENTE,
        TO_CHAR(EMISSAO, 'DD/MM/YYYY') AS EMISSAO, TO_CHAR(VENCIMENTO, 'DD/MM/YYYY') as DATA_VENCIMENTO_FATURA, TO_CHAR(VALOR, 'FM999G999G990D90') as VALOR_FATURA,
        ENDERECO, NUMERO, IDPERFILFATURAMENTO, BAIRRO, CEP, UF_CLIENTE, CIDADE_CLIENTE, TELEFONE, 'CELULAR' AS TIPOTELEFONE,
        CASE WHEN FORMAMEDICAO ='DIARIA' THEN '72 Horas' ELSE '30 Dias' END AS TEMPO
        FROM piramide.view_sinc_inadimplencia_fim"""
    )#Ver quais campos realmente são necessários

def faturas_proximas_vencer():
    adicional = " WHERE (to_date(CURRENT_DATE, 'DD/MM/YYY') = VENCIMENTO - 2)" #Alterado 17FEV2024
    #adicional = " WHERE (SYSDATE < VENCIMENTO - INTERVAL '2' DAY) AND (SYSDATE > VENCIMENTO - INTERVAL '1' DAY)" #TODO Fazer teste na segunda
    query = f'{select_from_get_faturas_view()} {adicional}'
    rows = executa_select_piramide(query)
    return rows

def faturas_vencidas():
    adicional = """WHERE (to_date(CURRENT_DATE, 'DD/MM/YYY')) = PIRAMIDE.SETDATANOTIFICACAO_SINC(CODDOC, vencimento, CIDADE_CLIENTE)
                 AND CLIENTE NOT IN ('105','151','152','153','426')""" #Alterado 17FEV2024
    #adicional = " WHERE SYSDATE > VENCIMENTO + INTERVAL '2' DAY AND CLIENTE NOT IN ('105', '151','152','153', '426')"
    query = f'{select_from_get_faturas_view()} {adicional}'
    rows = executa_select_piramide(query)
    return rows

def salva_envio(cliente, tipo):
    tipo_envio = ""
    if tipo == 2:
        tipo_envio = "Próximas a vencer"
    elif tipo == 3:
        tipo_envio = "Vencidas"

    item = Envio(contrato=cliente['MATRICULA'],email=cliente['EMAIL'],cliente=cliente['NOME_CLIENTE'],titulo=cliente['TITULO'],data_envio=timezone.now(),status_envio=cliente['STATUS'],tipo_envio=tipo_envio,data_vencimento=cliente['DATA_VENCIMENTO_FATURA'])
    #item.save() 17FEV2024 já salva no try, correto? TODO

    try:
        item.save()
        nome_cliente = cliente['TITULO']
        print(f'Informações do envio de e-mail referente ao título {nome_cliente} salvas com sucesso')
    except Exception as err:
        print(f'Erro na tentativa de envio de e-mail referente ao título {nome_cliente}. Erro {err}')

# Responsável por executar SELECT
def executa_select_piramide(query):
    connection = cx_Oracle.connect(
        user="SINC_INADIPLENTES",
        password="AN4LISYS_IN4D1",
        dsn="192.168.1.46:1521/piramide.intranet.copergas.com.br"
    )
    cursor = connection.cursor()
    cursor.execute(query)

    # Fetch column names
    columns = [col[0] for col in cursor.description]

    # Fetch all rows as a list of dictionaries
    rows = [dict(zip(columns, row)) for row in cursor.fetchall()]

    cursor.close()
    connection.close()
    return rows

# Responsável por executar INSERT, UPDATE e DELETE
def executa_query_piramide(query):
    connection = cx_Oracle.connect(
        user="SINC_INADIPLENTES",
        password="AN4LISYS_IN4D1",
        dsn="192.168.1.46:1521/piramide.intranet.copergas.com.br"
    )
    cursor = connection.cursor()
    cursor.execute(query)
    afetadas = cursor.rowcount
    cursor.close()
    connection.close()
    return afetadas

# Corrigir após finalizar o mysql.py
def salva_ultima_notificacao(cliente, tag): #Era salvaUltimaNotificacao

    salva_envio(cliente, tag)
    afetadas = 0

    if (tag == 3 or tag == 4):
        afetadas = set_info_not_piramide(cliente, tag)

    return afetadas

# Apenas para teste, não insere informações no Pirâmide
def salva_ultima_notificacao_teste(cliente, tag): #Era salvaUltimaNotificacao
    salva_envio(cliente, tag)
    afetadas = 0

    return afetadas

def set_info_not_piramide(cliente, tag):
    # Aviso de débito
    afetadas = 0

    try:
        if (tag == 3):
            insertInfoAvisoDebito = ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
			    + "('001','" + cliente['TITULO'] +"', 'DT_AVDEB', '00000015', '" + get_data(1,"/") + "'); COMMIT; END;")
            afetadas = executa_query_piramide(insertInfoAvisoDebito)
        else:
            insertInfoAvisoSuspensao = ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
			    + "('001','" + cliente['TITULO'] +"', 'DT_AVSUS', '00000015', '" + get_data(1,"/") + "'); COMMIT; END;")
            afetadas = executa_query_piramide(insertInfoAvisoSuspensao)
        print('Registro inserido no Piramide')
    except cx_Oracle.DatabaseError as erro:
        print(f'Erro de SQL - registro já existente {erro}')
        return 0

    return afetadas

