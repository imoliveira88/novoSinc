import cx_Oracle

def select_from_get_faturas_view():
    return (
        "SELECT CODDOC, MATRICULA, CLIENTE, TITULO, EMAIL, ID AS ID_CLIENTE, NOME_CLIENTE,"
        + "TO_CHAR(EMISSAO, 'DD/MM/YYYY') AS EMISSAO, TO_CHAR(VENCIMENTO, 'DD/MM/YYYY') as DATA_VENCIMENTO_FATURA, TO_CHAR(VALOR, 'FM999G999G990D90') as VALOR_FATURA,"
        + "ENDERECO, NUMERO, IDPERFILFATURAMENTO, BAIRRO, CEP, UF_CLIENTE, CIDADE_CLIENTE, TELEFONE, 'CELULAR' AS TIPOTELEFONE,"
        + "CASE WHEN FORMAMEDICAO ='DIARIA' THEN '72 Horas' ELSE '30 Dias' END AS TEMPO "
        + "FROM piramide.view_sinc_inadimplencia_fim"
    )

def faturas_proximas_vencer():
    return (select_from_get_faturas_view() + " WHERE (to_date(CURRENT_DATE, 'DD/MM/YYY') = VENCIMENTO - 2) ORDER BY MATRICULA")

def faturas_vencidas():
    return (select_from_get_faturas_view() + " WHERE (to_date(CURRENT_DATE, 'DD/MM/YYY')) = PIRAMIDE.SETDATANOTIFICACAO_SINC(CODDOC, vencimento, CIDADE_CLIENTE)"
                                         + " AND CLIENTE NOT IN ('105', '151','152','153', '426') "
	                                     + "ORDER BY MATRICULA")

def set_info_not_piramide(cliente,tag):
    constante = ""
    if (tag == 3): #Caso do aviso de débito
        constante += ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
                   + "('001','" + cliente.TITULO +"', 'DT_AVDEB', '00000015', '" + date_CTRL.getData(1,"/") + "'); COMMIT; END;")

    else: #Caso do aviso de suspensão
        constante += ("BEGIN INSERT INTO PIR_ATRIBUTO_TITREC values "
                   + "('001','" + cliente.TITULO +"', 'DT_AVSUS', '00000015', '" + date_CTRL.getData(1,"/") + "'); COMMIT; END;")
    executa_query_piramide(constante)

def executa_query_piramide(query):
    connection = cx_Oracle.connect(
        user="SINC_INADIPLENTES",
        password="AN4LISYS_IN4D1",
        dsn="192.168.1.46:1521/piramide.intranet.copergas.com.br"
    )

    cursor = connection.cursor()
    cursor.execute(query)

    cursor.close()
    connection.close()

def salva_ultima_notificacao (cliente, tag): #Era salvaUltimaNotificacao
    
    mysql_CTRL.setUltimaMatriculaServico(cliente, tag);

    if (tag == 3 || tag == 4) {
        oracledb_CTRL.setInfoNotPiramide (cliente, tag, function (resp) {
        if(resp.status == "error") {
            console.log("NAO FOI POSSIVEL INSERIR INFORMACOES DE AVISO NO PIRAMIDE (" + tag + " - " + cliente.TITULO + ")");
        }else {
            console.log("INFORMACOES SALVAS NO PIRAMIDE! (" + cliente.TITULO + ")");
        }
    });
    }
    
}