from aplicacao.date import get_data
import mysql.connector
from datetime import datetime, timedelta
from aplicacao.models import Envio
from django.utils import timezone

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

#Todos os callback foram transformados em "return". Verificar como adaptar o uso

def set_ultima_matricula_servico(cliente, tipo):
    tipo_envio = ""
    if tipo == 2:
        tipo_envio = "Próximas a vencer"
    elif tipo == 3:
        tipo_envio = "Vencidas"

    item = Envio(contrato=cliente['MATRICULA'],email=cliente['EMAIL'],titulo=cliente['TITULO'],data_envio=timezone.now(),status_envio=cliente['STATUS'],tipo_envio=tipo_envio)
    item.save()

    try:
        item.save()
        print('Ultima matricula salva com sucesso')
    except mysql.connector.Error as err:
        print(f'Erro ao salvar a ultima matricula! {err}')

def salvar_protocolos(dados):
    conn_mysql = db()
    posts = dados['result']
    sql_grava_protocolos = "INSERT INTO " + TABELA_PROTOCOLOS + " SET %s"

    # Salvar todos os protocolos
    for post in posts:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_grava_protocolos, post)
        conn_mysql.commit()
        cursor.close()

    data_atual = timezone.now().strftime('%Y-%m-%d %H:%M:%S')
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
	
def salvar_detalhes_protocolos(id_protocolo, dados):
    conn_mysql = db()
    posts = dados['result']
    sql_grava_protocolos = "INSERT INTO " + TABELA_DETALHES_PROTOCOLOS + " SET %s"

    for post in posts:
        cursor = conn_mysql.cursor(dictionary=True)
        cursor.execute(sql_grava_protocolos, post)
        conn_mysql.commit()
        cursor.close()

    data_atual = timezone.now().strftime('%Y-%m-%d %H:%M:%S')
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