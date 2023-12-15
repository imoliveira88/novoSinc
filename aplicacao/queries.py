from aplicacao.date import get_data
import cx_Oracle
import mysql

def select_from_get_faturas_view():
    return (
        "SELECT CODDOC, MATRICULA, CLIENTE, TITULO, EMAIL, ID AS ID_CLIENTE, NOME_CLIENTE,"
        + "TO_CHAR(EMISSAO, 'DD/MM/YYYY') AS EMISSAO, TO_CHAR(VENCIMENTO, 'DD/MM/YYYY') as DATA_VENCIMENTO_FATURA, TO_CHAR(VALOR, 'FM999G999G990D90') as VALOR_FATURA,"
        + "ENDERECO, NUMERO, IDPERFILFATURAMENTO, BAIRRO, CEP, UF_CLIENTE, CIDADE_CLIENTE, TELEFONE, 'CELULAR' AS TIPOTELEFONE,"
        + "CASE WHEN FORMAMEDICAO ='DIARIA' THEN '72 Horas' ELSE '30 Dias' END AS TEMPO "
        + "FROM piramide.view_sinc_inadimplencia_fim"
    )

def faturas_proximas_vencer():
    query = (select_from_get_faturas_view() + " WHERE (to_date(CURRENT_DATE, 'DD/MM/YYY') = VENCIMENTO - 2) ORDER BY MATRICULA")
    rows = executa_select_piramide(query)
    return rows

def faturas_vencidas():
    query = (select_from_get_faturas_view() + " WHERE (to_date(CURRENT_DATE, 'DD/MM/YYY')) = PIRAMIDE.SETDATANOTIFICACAO_SINC(CODDOC, vencimento, CIDADE_CLIENTE)"
                                         + " AND CLIENTE NOT IN ('105', '151','152','153', '426') "
	                                     + "ORDER BY MATRICULA")
    rows = executa_select_piramide(query)
    return rows

def set_info_not_piramide(cliente,tag):
    constante = ""
    if (tag == 3): #Caso do aviso de débito
        constante += ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
                   + "('001','" + cliente.TITULO +"', 'DT_AVDEB', '00000015', '" + get_data(1,"/") + "'); COMMIT; END;")

    else: #Caso do aviso de suspensão
        constante += ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
                   + "('001','" + cliente.TITULO +"', 'DT_AVSUS', '00000015', '" + get_data(1,"/") + "'); COMMIT; END;")
    afetadas = executa_query_piramide(constante)
    return afetadas

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
def salva_ultima_notificacao (cliente, tag): #Era salvaUltimaNotificacao
    
    mysql.set_ultima_matricula_servico(cliente, tag)

    if (tag == 3 or tag == 4):
        afetadas = set_info_not_piramide(cliente, tag)

    return afetadas

def set_info_not_piramide(cliente, tag):
    # Aviso de débito
    if (tag == 3):
        insertInfoAvisoDebito = ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
			+ "('001','" + cliente.TITULO +"', 'DT_AVDEB', '00000015', '" + get_data(1,"/") + "'); COMMIT; END;")
        afetadas = executa_query_piramide(insertInfoAvisoDebito)
    else:
        insertInfoAvisoSuspensao = ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
			+ "('001','" + cliente.TITULO +"', 'DT_AVSUS', '00000015', '" + get_data(1,"/") + "'); COMMIT; END;")
        afetadas = executa_query_piramide(insertInfoAvisoSuspensao)
    return afetadas