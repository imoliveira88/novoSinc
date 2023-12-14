import mysql.connector
from datetime import datetime, timedelta

mysql				= require('mysql')
date_CTRL 		= require('./../controllers/date-ctrl')
oracledb_CTRL 	= require('./oracle_db-ctrl')

# TABELAS
TABELA_CLIENTES = "sinc_clientes"
TABELA_TOKEN_DEVICE = "sinc_token_devices"
TABELA_PROTOCOLOS = "sinc_protocolos"
TABELA_DETALHES_PROTOCOLOS = "sinc_protocolos_detalhes"

# TAGS
OK = "ok"
ERRO = "erro"
TAG_USUARIO_EXISTENTE = "ER_DUP_ENTRY"
TAG_TOKEN_GRAVADO = 1
TAG_TOKEN_NAO_GRAVADO = 0
TAG_NOVO_TOKEN

#Todos os callback foram transformados em "return". Verificar como adaptar o uso

def db():
    conn_mysql = mysql.connector.connect(
        user='root',
        password='',
        host='localhost',
        port='3306',
        database='sinc_db',
        multipleStatements=True
    )
    return conn_mysql

def set_ultima_matricula_servico(cliente, tipo):
    conn_mysql = db()

    cursor = conn_mysql.cursor()

    sql_set_ultima_mat = (
        "INSERT INTO sinc_ultima_notificacao "
        "(titulo, ultima_data, id_pir, matricula, idperfilfaturamento, not_tipo, meio_not, contato_cliente, nome_cliente) "
        "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
    )

    data_atual = datetime.now().strftime('%Y-%m-%d')

    values = (
        cliente['TITULO'],
        data_atual,
        cliente['ID_CLIENTE'],
        cliente['MATRICULA'],
        cliente['IDPERFILFATURAMENTO'],
        tipo,
        cliente['NOT'],
        cliente['CONTATO'],
        cliente['NOME_CLIENTE']
    )

    try:
        cursor.execute(sql_set_ultima_mat, values)
        conn_mysql.commit()
        print('Ultima matricula salva com sucesso')
    except mysql.connector.Error as err:
        print(f'Erro ao salvar a ultima matricula! {err}')
    finally:
        cursor.close()
        conn_mysql.close()

def salvar_protocolos(dados): #Era salvarProtocolos

	conn_mysql = db()
    posts = dados['result']
    sql_grava_protocolos = "INSERT INTO " + TABELA_PROTOCOLOS + " SET %s"

    # Salvar todos os protocolos
    for post in posts:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_grava_protocolos, post)
        conn_mysql.commit()
        cursor.close()

    data_atual = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print({
        'protocolos_gravados': len(posts),
        'data_gravacao': data_atual
    })

    result = {
        'status': 'OK',
        'result': {
            'protocolos_gravados': len(posts)
        }
    }
    conn_mysql.close()
    return result
	

def salvar_detalhes_protocolos(id_protocolo, dados): # Era salvarDetalhesProtocolos
    conn_mysql = db()
    posts = dados['result']
    sql_grava_protocolos = "INSERT INTO " + TABELA_DETALHES_PROTOCOLOS + " SET %s"

    for post in posts:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_grava_protocolos, post)
        conn_mysql.commit()
        cursor.close()

    data_atual = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print({
        'detalhes_protocolos_gravados': len(posts),
        'data_gravacao': data_atual
    })

    result = {
        'status': 'OK',
        'result': {
            'detalhes_protocolos_gravados': len(posts)
        }
    }
    conn_mysql.close()
    return result

def alterar_status_titulo(id_status, descricao_status, data_assinatura, titulo_fatura):
    conn_mysql = db()
    sql_update_status_titulo = f'UPDATE {TABELA_DETALHES_PROTOCOLOS}'

    if id_status == 3:
        sql_update_status_titulo += ' SET id_status = %s, descricao_status = %s, data_assinatura = %s WHERE titulo_fatura = %s AND id_status <> 4'
    else:
        sql_update_status_titulo += ' SET id_status = %s, descricao_status = %s, data_assinatura = %s WHERE titulo_fatura = %s'

    conn_mysql.cursor().execute(sql_update_status_titulo, (id_status, descricao_status, data_assinatura, titulo_fatura))

    try:
        conn_mysql.commit()
        return({'status': 'ok', 'result': 'Status atualizado com sucesso!!!'})
    except mysql.connector.Error as error:
        return({'status': 'error', 'result': str(error)})
    finally:
        conn_mysql.close()

def consultar_protocolos(datafiltro):
    conn_mysql = db()
    sql_get_protocolos = (
        "SELECT "
        "id_protocolo, "
        "apelido_condominio, "
        "qtde_clientes, "
        "DATE_FORMAT(vencimento_titulo, '%d/%m/%Y') as vencimento_titulo "
        "FROM " + TABELA_PROTOCOLOS +
        " WHERE DATE(vencimento_titulo) = DATE(%s)"
    )

    try:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_protocolos, (datafiltro,))
        result = cursor.fetchall()

        if result:
            return({'status': 'OK', 'result': result})
        else:
            return({'status': 'ERRO', 'result': {'message': 'Nenhum protocolo encontrado'}})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})

    finally:
        cursor.close()
        conn_mysql.close()

import mysql.connector

def atualizar_status_titulos_por_protocolo(protocolo):
    conn_mysql = db()

    sql_get_detalhes_protocolos = (
        "SELECT "
        "titulo_fatura, "
        "condominio_torre_apt, "
        "valor_fatura, "
        "nome_cliente, "
        "id_status, "
        "descricao_status "
        "FROM " + TABELA_DETALHES_PROTOCOLOS +
        ' WHERE id_protocolo = %s AND id_status <> 4'
    )

    cursor = conn_mysql.cursor(dictionary=True)
    cursor.execute(sql_get_detalhes_protocolos, (protocolo,))
    result = cursor.fetchall()

    if result:
        array_result = result
        for detalhes in array_result:
            resp = oracledb_CTRL.get_titulo_em_atraso(detalhes['titulo_fatura'])
            if len(resp['result']) == 0:
                conn = db()
                data_atual = date_CTRL.get_data(0, '-')
                conn.cursor().execute(
                    'UPDATE ' + TABELA_DETALHES_PROTOCOLOS +
                    ' SET id_status = %s, data_assinatura = %s WHERE titulo_fatura = %s',
                    (4, data_atual, detalhes['titulo_fatura'])
                )
                conn.commit()
                conn.close()

        return('ok')

    else:
        print(f'Protocolo: {protocolo} sem detalhes')

    cursor.close()
    conn_mysql.close()

import mysql.connector

def consultar_detalhes_protocolos(protocolo):
    conn_mysql = db()

    sql_get_detalhes_protocolos = (
        "SELECT "
        "titulo_fatura, "
        "condominio_torre_apt, "
        "valor_fatura, "
        "nome_cliente, "
        "id_status, "
        "descricao_status, "
        "DATE_FORMAT(data_assinatura, '%d/%m/%Y') as data_assinatura "
        "FROM " + TABELA_DETALHES_PROTOCOLOS +
        ' WHERE id_protocolo = %s'
    )

    print(sql_get_detalhes_protocolos)

    atualizar_status_titulos_por_protocolo(protocolo, lambda resp: print('LOG_SiNC: STATUS ATUALIZADO') if resp == 'ok' else None)

    conn_mysql.commit()  # Committing any pending transactions from the previous function

    def query_detalhes_protocolos():
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_detalhes_protocolos, (protocolo,))
        result = cursor.fetchall()

        if result:
            return({'status': 'OK', 'result': result})
        else:
            return({'status': 'ERRO', 'result': {'message': 'Nenhum detalhe de protocolo encontrado'}})

        cursor.close()
        conn_mysql.close()

    conn_mysql.commit()  # Committing any changes before executing the query
    conn_mysql.ping(reconnect=True)  # Reconnecting in case the connection was closed
    query_detalhes_protocolos()

def validar_gravacao_protocolos(data_vencimento):
    conn_mysql = db()

    sql_get_protocolos = (
        "SELECT CASE WHEN COUNT(vencimento_titulo) > 0 "
        "THEN true ELSE false END AS tem_protocolo "
        "FROM " + TABELA_PROTOCOLOS +
        " WHERE DATE(vencimento_titulo) = DATE(%s)"
    )

    try:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_protocolos, (data_vencimento,))
        result = cursor.fetchone()

        return({'status': 'OK', 'result': result})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})

    finally:
        cursor.close()
        conn_mysql.close()
	
def get_ids_protocolos():
    conn_mysql = db()

    sql_get_ids_protocolos = (
        "SELECT _id, id_protocolo, DATE_FORMAT(vencimento_titulo, '%Y-%m-%d') as vencimento_titulo "
        "FROM " + TABELA_PROTOCOLOS
    )

    try:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_ids_protocolos)
        result = cursor.fetchall()
        return({'status': 'OK', 'result': result})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})
    finally:
        cursor.close()
        conn_mysql.close()

def get_protocolos_inadimplentes():
    conn_mysql = db()

    sql_get_protocolos_inadimplentes = (
        "SELECT id_protocolo "
        "FROM " + TABELA_PROTOCOLOS + " "
        "WHERE DATEDIFF(CURRENT_DATE, vencimento_titulo) = (SELECT dias_inadimplencia FROM sinc_parametros)"
    )

    try:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_protocolos_inadimplentes)
        result = cursor.fetchall()

        return({'status': 'OK', 'result': result})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})

    finally:
        cursor.close()
        conn_mysql.close()

def consultar_titulos(id_protocolo):
    conn_mysql = db()

    sql_get_titulos_fatura = (
        "SELECT titulo_fatura "
        "FROM " + TABELA_DETALHES_PROTOCOLOS + " "
        "WHERE id_protocolo = %s"
    )

    try:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_titulos_fatura, (id_protocolo,))
        result = cursor.fetchall()

        return({'status': 'OK', 'result': result})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})

    finally:
        cursor.close()
        conn_mysql.close()

def consultar_protocolo_por_titulo(titulo):
    conn_mysql = db()

    sql_get_protocolo_por_titulo = (
        "SELECT id_protocolo "
        "FROM " + TABELA_DETALHES_PROTOCOLOS + " "
        "WHERE titulo_fatura = %s"
    )

    try:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_get_protocolo_por_titulo, (titulo,))
        result = cursor.fetchall()

        return({'status': 'OK', 'result': result})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})

    finally:
        cursor.close()
        conn_mysql.close()

def get_clientes_aptos_para_corte():
    conn_mysql = db()

    get_protocolos_aptos = (
        "SELECT id_protocolo, vencimento_titulo "
        "FROM " + TABELA_PROTOCOLOS + " "
        "WHERE DATEDIFF(CURRENT_DATE, vencimento_titulo) = (SELECT dias_inadimplencia FROM sinc_parametros)"
    )

    try:
        # Atualizando Status dos Titulos a serem consultados
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(get_protocolos_aptos)
        result = cursor.fetchall()

        if result:
            array_result = result
            for detalhes in array_result:
                atualizar_status_titulos_por_protocolo(detalhes['id_protocolo'], lambda res: print(res))

            # Capturando dados já atualizados dos clientes aptos para corte
            sql_get_clientes_aptos_corte = (
                "SELECT detalhes.condominio_torre_apt as imovel, "
                "detalhes.nome_cliente as nomecliente, "
                "detalhes.titulo_fatura as titulo, "
                "DATE_FORMAT(protocolo.vencimento_titulo, '%d/%m/%Y') as vencimentotitulo, "
                "detalhes.valor_fatura as valortitulo "
                "FROM (" + get_protocolos_aptos + ") as protocolo, sinc_protocolos_detalhes detalhes "
                "WHERE protocolo.id_protocolo = detalhes.id_protocolo AND detalhes.id_status = 3"
            )

            cursor.execute(sql_get_clientes_aptos_corte)
            result_clients = cursor.fetchall()

            return({'status': 'OK', 'result': result_clients})

    except mysql.connector.Error as err:
        return({'status': 'ERRO', 'result': {'message': str(err)}})

    finally:
        cursor.close()
        conn_mysql.close()