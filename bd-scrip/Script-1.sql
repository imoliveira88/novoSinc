SELECT text FROM all_views WHERE view_name = 'VW_DADOS_INADIMPLENCIA'

SELECT table_name FROM all_tab_columns WHERE column_name = 'EMAIL'

SELECT * FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR
COPC_CD vem da tabela CONTRATO_PONTO_CONSUMO
SELECT * FROM CONTRATO
POCN_CD vem de PONTO_CONSUMO -> POCN_DS

SELECT * FROM CLIENTE WHERE CLIE_NM LIKE 'ELIZANDRA DA SILVA SAMPAIO VOLKEL' -- 32451886000186 CLIE_CD = 219282

SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR


SELECT * FROM CONSUMO_HISTORICO ORDER BY COHI_CD DESC FETCH NEXT 10 ROWS ONLY


select * from  view_totais_mensais_bi_final WHERE NUMERO_NOTA = 429548



SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'DCA RESTAU%' -- POCN_CD = 25,130,131
SELECT COEC_DS_EMAIL FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 214369))

CLIENTE CLIDS_EMAI

SELECT * FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR cpc
LEFT JOIN CONTRATO_PONTO_CONSUMO pc ON cpc.COPC_CD = pc.COPC_CD
WHERE COEC_CD = 41027

CONTRATO_PONTO_CONSUMO (COPC_CD,CONT_CD,POCN_CD)

SELECT * FROM CONTRATO


SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '% MARIA CECILIA RODRIGUES%APT 0102%' -- POCN_CD = 304930
SELECT * FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE COPC_CD = 304930

--24OUT-- Demanda Ana Gamboa

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%CBVP%' -- POCN_CD = 2026
SELECT COEC_DS_EMAIL FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 2026)) GROUP BY COEC_DS_EMAIL

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'ROBERIO GOMES%' -- POCN_CD = 2026
SELECT COEC_DS_EMAIL FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 2026)) GROUP BY COEC_DS_EMAIL


ARLANXEO – só recebe próxima do vencimento, vencida não

SELECT POCN_CD, POCN_DS FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%RLANXEO%' -- POCN_CD = 25,130,131
SELECT COEC_DS_EMAIL FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 24))


SELECT POCN_CD FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%RLANXEO%' -- POCN_CD = 25,130,131
SELECT CONT_IN_USO, COSI_CD FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 24)


CBVP – não recebe avisos

SELECT POCN_CD, POCN_DS FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%CBVP' -- POCN_CD = 25,130,131
SELECT COEC_DS_EMAIL FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 2026))

--Verificar e-mail recebido Everest

SELECT * FROM CLIENTE WHERE CLIE_NM LIKE 'ADILSON FRANC%'

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ADILSON FRANCISCO%' -- POCN_CD = 298949
SELECT * FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 298949))

SELECT table_name, column_name FROM all_tab_columns WHERE column_name LIKE '%EMAIL'

SELECT * FROM CHAMADO_ALT_CONTATO  WHERE CHCO_EMAIL LIKE 'contato@everestenergia.com.br'

--30OUT - Demanda e-mail

SELECT text FROM all_views WHERE view_name = 'VW_DADOS_INADIMPLENCIA2'


--13NOV

--felipenunes2010@hotmail.com

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%PETR%NUNE%ARUARU%%' -- POCN_CD = 311327
SELECT * FROM GGAS_ADMIN.CONTRATO_PONTO_CONS_EMAIL_COBR WHERE (COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 311327))


--02JAN

-- NOTA 438769

SELECT * FROM DOCUMENTO_FISCAL WHERE DOFI_NR = 438769

select * from  view_totais_mensais_bi_final 438974ORDER BY NUMERO_NOTA DESC

-- 03JAN

-- Rota Supervisório - IND Penalidades

SELECT * FROM ROTA --ROTA_CD = 144 para SUPERVISORIOINDPENALIDADES

SELECT * FROM ROTA WHERE ROTA_NR LIKE '%INTERNACIO%'

SELECT * FROM PONTO_CONSUMO WHERE ROTA_CD = 144

SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 160

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144) -- Todos os pontos de consumo têm city_gate

SELECT * FROM PONTO_CONSUMO_SITUACAO

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144)-- COPC_CD, CONT_CD

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144)) ORDER BY CONT_TM_ULTIMA_ALTERACAO
--47886
--50476
--46487
--50504

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE COPC_DS_EMAIL_ENTREGA LIKE 'cavabist%' //4500, 23565
SELECT * FROM CONTRATO WHERE CONT_CD IN (4500, 23565)

UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50504,50556) --Estava 5

UPDATE CONTRATO SET COSI_CD = 9 WHERE CONT_CD IN (4500) --Estava 9

SELECT * FROM CITY_GATE WHERE CIGA_CD IN (SELECT CIGA_CD FROM PONTO_CONSUMO_CITY_GATE WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144)) -- Todos os pontos de consumo têm city_gate


SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144) AND CONT_CD IN (47886,50476,46487,50504)

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (6048, 3427) --POCN_CD = 6570 CONT_CD = 3287 6412 --COPC_CD = 34986 
SELECT * FROM contrato WHERE CONT_CD IN (6412, 3287)
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 6570

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 6570

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'EDF%ATLANTICO NORTE%0301%' --EDF. ATLANTICO NORTE, APT 1502 -- POCN_CD = 2851, IMOV_CD = 3088
UNION 
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'EDF%ATLANTICO NORTE%1502%' --6048, 3427

SELECT * FROM IMOVEL WHERE IMOV_CD IN (6412, 3700, 3088) -- 3700, 41

--
3700	19433				229	APT 1502	EDF. ATLANTICO NORTE, APT 1502*		1	1	3	1		4		1		0											8253	1	0	2017-08-16 17:55:45.581								0
--

SELECT CONT_IN_USO  FROM CONTRATO WHERE CONT_CD IN (35608,37122)
SELECT * FROM CONTRATO_SITUACAO --1 ATIVO, 2 ENCERRADO

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'EDF%ATLANTICO NORTE%0301%' --PEGA POCN_CD
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (6048, 3427) -- PEGA CONT_CD
SELECT CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN ... -- verifica se há mais de um registro com 1

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD = 35608
		
---

SELECT table_name FROM all_tab_columns WHERE column_name = 'POCS_CD'

SELECT * FROM PONTO_CONSUMO_SITUACAO

-- Mostra contratos em negociação
select   pocn.pocn_cd, pocn.imov_cd, pocn.pocn_ds, 
         cont.cosi_cd, cosi.cosi_ds, pocn.pocn_cd_supervisorio
from ponto_consumo pocn
LEFT join contrato_ponto_consumo copc ON pocn.pocn_cd = copc.pocn_cd
LEFT join contrato cont ON copc.cont_cd = cont.cont_cd
inner join contrato_situacao cosi ON cosi.cosi_cd = cont.cosi_cd
where pocn.rota_cd = 144
and cont.cosi_cd <> 1
and cont.cont_in_uso = 1
;

SELECT * FROM PONTO_CONSUMO WHERE rota_cd = 48

SELECT * FROM rota

SELECT * FROM contrato_situacao --Ativo = 1

-- Rota não processada por null pointer exception. Encontrados dois contratos em negociação. Retirar pontos de consumo da rota e reprocessar a rota??


select * from DOCUMENTO_FISCAL WHERE dofi_nr = 429548 -- priscila naara de farias CPF 09679659429 --FATU_CD = 774565
      SELECT * FROM FATURA_ITEM WHERE FATU_CD = 774565
      SELECT * FROM SEGMENTO WHERE SEGM_CD = 4
      SELECT * FROM FATURA WHERE FATU_CD = 774565 -- POCN_CD = 251478 CLIE_CD = 233048 COHI_CD = 1102568
      SELECT * FROM CONSUMO_HISTORICO WHERE COHI_CD = 1102568
      
      UPDATE CONSUMO_HISTORICO SET COHI_IN_USO = 1 WHERE COHI_CD = 1102568
	  SELECT * FROM CLIENTE WHERE CLIE_CD = 233048 -- Priscila Naara de Farias
      SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 251478 -- POCN_DS JARDINS DO FRIO
      SELECT * FROM CLIENTE WHERE CLIE_NM LIKE 'PISCILA NAARA%' -- 32451886000186 CLIE_CD = 219282
      SELECT * FROM FATURA WHERE POCN_CD = 251478 AND FATU_CD = 774565
      
SELECT * FROM consumo_historico WHERE COHI_DT_AM_FATURAMENTO = 202401 AND COHI_NR_CICLO = 1 ORDER BY COHI_TM_ULTIMA_ALTERACAO desc


-- 03JAN

SELECT * FROM DOCUMENTO_FISCAL WHERE DOFI_NR = 429548

DROP VIEW VIEW_TOTAIS_MENSAIS_LEFT

--

SELECT * FROM VIEW_TOTAIS_MENSAIS_BI_FINAL WHERE NUMERO_NOTA = 438974 --6323,28

SELECT * FROM FATURA WHERE FATU_CD = 438974

SELECT COHI_IN_FATURAMENTO FROM CONSUMO_HISTORICO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144) AND COHI_DT_AM_FATURAMENTO = 202312 AND COHI_NR_CICLO = 5

UPDATE CONSUMO_HISTORICO SET COHI_IN_FATURAMENTO = 0 WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144) AND COHI_DT_AM_FATURAMENTO = 202312 AND COHI_NR_CICLO = 5

-- alterar campo COHI_IN_FATURAMENTO para valor igual a 0;

-- 04JAN

-- Verificar atividades de medição semanal
SELECT * FROM SUPER_MEDICAO_HORARIA ORDER BY SUMH_TM_LEITURA DESC

-- Nenhum ponto de consumo faturado na rota SUPERVISORIOPENALIDADES

SELECT * FROM FATURAMENTO_GRUPO WHERE FAGR_DS LIKE 'SUPERVISORIO%PENALIDA%' --FAGR_CD = 1067

UNION

SELECT * FROM FATURAMENTO_GRUPO WHERE FAGR_DS LIKE 'SUPERVISORIO%INTERNACIO%' -- FAGR_CD = 1346

SELECT * FROM FATURAMENTO_CRONOGRAMA WHERE FAGR_CD = 1067 AND FACR_DT_AM_FATURAMENTO = 202312
SELECT * FROM ROTA WHERE ROTA_NR LIKE 'SUPERVI%PENA%' --ROTA_CD = 144 para SUPERVISORIOINDPENALIDADES
UNION
SELECT * FROM ROTA WHERE ROTA_NR LIKE 'SUPERVI%INTERNA%' --ROTA_CD = 160 para SUPERVISORIOINTERNACIONAL

SELECT * FROM ROTA_CRONOGRAMA WHERE ROTA_CD = 144 AND ROCR_DT_AM_REFERENCIA = 202312


Algumas informações técnicas da rota e cronograma:


Percorrendo mapa de cronogramas por rota
Chave do mapa sendo iterado é a seguinte rota: SUPERVISORIOINDPENALIDADES
Nao foi possivel atualizar o cronograma da Rota SUPERVISORIOINDPENALIDADES para a atividade FATURAR GRUPO
Não foi possível atualizar data de realização dos cronogramas, lista de cronogramas verificados NULA
Processo FATURAR GRUPO do módulo de FATURAMENTO executado com sucesso em 04/01/2024 10:14:18

-- Cancelamento das notas e reprocessamento

SELECT * FROM CONSUMO_HISTORICO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144) AND COHI_DT_AM_FATURAMENTO = 202312 AND COHI_NR_CICLO = 5

UPDATE CONSUMO_HISTORICO SET COHI_IN_FATURAMENTO = 0 WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 144) AND COHI_DT_AM_FATURAMENTO = 202312 AND COHI_NR_CICLO = 5

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'POSTO%INTERNACIO%' -- 297777, 308166

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%MURO ALTO%' -- 312926

SELECT * FROM CONSUMO_HISTORICO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 47) AND COHI_DT_AM_FATURAMENTO = 202401 AND COHI_NR_CICLO = 1

UPDATE CONSUMO_HISTORICO SET COHI_IN_FATURAMENTO = 0 WHERE POCN_CD IN (312926, 308166) AND COHI_DT_AM_FATURAMENTO = 202312 AND COHI_NR_CICLO = 4

-- Notas 784427, 784566

-- Usuário x papel

SELECT * FROM USUARIO_SISTEMA WHERE USSI_NM_LOGIN in ('heitor.leoncio','joseane.oliveira','fernanda.goncalves','jessica.lima') --FUNC_CD 320, 310, 96, 319 --UUS
SELECT * FROM FUNCIONARIO WHERE FUNC_CD IN (320, 310, 96, 319)
SELECT * FROM USUARIO_PAPEL_SISTEMA

SELECT * FROM USUARIO

-- Integração de notas

SELECT * FROM TI_CONTRATO

-- Campo de observação nota fiscal

SELECT *
FROM DOCUMENTO_COBRANCA DC
INNER JOIN DOCUMENTO_COBRANCA_ITEM DCI ON DC.DOCO_CD = DCI.DOCO_CD
INNER JOIN CREDITO_DEBITO_A_REALIZAR CDR ON DCI.CRDR_CD = CDR.CRDR_CD
WHERE DC.DOCO_CD = 532905;

SELECT * FROM DOCUMENTO_FISCAL ORDER BY DOFI_CD DESC

SELECT table_name FROM all_tab_columns WHERE column_name LIKE '%ENDERECO%'



SELECT * FROM ponto_consumo

SELECT * FROM DOCUMENTO_FISCAL

-- GGAS_ADMIN.VIEW_TI_NF_OBS_GGAS_PIR source

CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VIEW_TI_NF_OBS_GGAS_PIR" ("COD_FILIAL_ORIGEM", "COD_SERIE_ORIGEM", "COD_NF_ORIGEM", "COD_OBS_ORIGEM", "DSC_COMPLEMENTO", "COD_TIPO_OBSERVACAO", "DATAMODIFICACAO", "OPERACAO") AS 
  SELECT 
-- Ajuste no campo de observações feito em 05/01/2024
CAST('001' AS VARCHAR2(6)) AS COD_FILIAL_ORIGEM,
CAST(nf.TINF_DS_SERIE AS VARCHAR2(4)) AS COD_SERIE_ORIGEM,
--'21' AS COD_SERIE_ORIGEM,
CAST(TRIM(nf.TINF_NR) AS VARCHAR2(9 BYTE)) AS COD_NF_ORIGEM,
'98' AS COD_OBS_ORIGEM,
-- AJUSTE DO TEXTO DA OBSERVACAO DE ACORDO COM O SEGMENTO EM 31/10/2022 - INCLUINDO A MENSAGEM DE ISENÇÃO DE PIS/COFINS
case pc.raat_cd 
-- VEICULAR GNV
when 6 
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. Alíquota de ICMS conforme lei 18.305/23.

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'

when 7 
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. Alíquota de ICMS conforme lei 18.305/23.

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'

when 10
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. Alíquota de ICMS conforme lei 18.305/23.

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'
-- COMERCIAL GRANDES VOLUMES
when 4
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. Alíquota de ICMS conforme lei 18.305/23.

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'

when 14
    THEN 
'De Acordo com o Artigo 18, Titulo IV, Da Imunidade Tributaria e o Paragrafo 3o., Artigo 155 da CF os derivados de Petróleo, Gás Natural 2711.21.00, são imunes a incidência do IPI. Alíquota de ICMS conforme lei 18.305/23.

TELEATENDIMENTO: COPERGÁS: 0800 281 2002 / OUVIDORIA ARPE: 0800 281 3844.' 

when 15
    THEN 
'De acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. 

GÁS CONSUMIDO PELA COMPANHIA NA PRODUÇÃO DE ENERGIA TÉRMICA NO PERÍODO. OUVIDORIA ARPE: 0800 281 3844' 

  else
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. Alíquota de ICMS conforme lei 18.305/23.
 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.' 
 end
 AS DSC_COMPLEMENTO,
'' AS COD_TIPO_OBSERVACAO,
TINF_TM_ULTIMA_ALTERACAO as DATAMODIFICACAO, 
(CASE WHEN (nf.TINF_CD_OPERACAO = 'I') THEN ('INSERT') ELSE ('UPDATE') END) AS OPERACAO
from ti_nota_fiscal nf 
INNER JOIN TI_CONTRATO ON TI_CONTRATO.TICO_CD = nf.TICO_CD
inner join TI_NOTA_FISCAL_ITEM on nf.TINF_CD = TI_NOTA_FISCAL_ITEM.TINF_CD
--- USADO PARA RETORNAR O RAMO DE ATIVIDADE
INNER JOIN CONTRATO_PONTO_CONSUMO CPC ON CPC.COPC_CD = TI_CONTRATO.TICO_COPC_CD
INNER JOIN PONTO_CONSUMO PC ON PC.POCN_CD = CPC.POCN_CD

where TINF_CD_TIPO_OPERACAO = 'S' AND TINF_CD_TIPO_NOTA_FISCAL = 'N' 
AND TINF_CD_SITUACAO = 'NP' 
--and TINF_NR = 266719

and nf.TINF_DS_SERIE = '5'

GROUP BY TINF_DS_SERIE, TINF_NR, TINF_CD_SISTEMA_ORIGEM, TINF_CD_OPERACAO, TINF_TM_ULTIMA_ALTERACAO, ti_nota_fiscal_item.tini_cd_segmento, pc.raat_cd
union


select
CAST('001' AS VARCHAR2(6)) AS COD_FILIAL_ORIGEM,
CAST(nf.TINF_DS_SERIE AS VARCHAR2(4)) AS COD_SERIE_NF_ORIGEM,
--'21' AS COD_SERIE_ORIGEM,
CAST(TRIM(nf.TINF_NR) AS VARCHAR2(9 BYTE)) AS COD_NF_ORIGEM,
'99' AS COD_OBS_ORIGEM,  

--------------------------------

-- AJUSTE DO TEXTO DA OBSERVACAO DE ACORDO COM O RAMO DE ATIVIDADE EM 22/11/2022

case pc.raat_cd 
-- VEICULAR GNV
when 6 
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: 
Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
-- VEICULAR GNC
 when 7 
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: 
Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
-- INDUSTRIAL GRANDES VOLUMES
-- O VOLUME SERÁ A SOMA DAS QUANTIDADES PREVISTAS NO ITEM DA NOTA
when 10
    THEN 
        -- AJUSTE EM 07/08/2023 PARA INCLUIR NA OBSERVAÇÃO O TEXTO SOBRE A RECUPERAÇÃO, CASO EXISTA
        -- case when QR.QURE_MD_QR is null
        -- ENQUANTO A RECUPERAÇÃO NÃO FOR AUTOMATICA, SERÁ VERIFICADO PELO CREDITO DEBITO. QUANTO ESTIVER AUTOMATICA AI SERA DESCOMENTADA A LINHA ACIMA
        case when aux.crdr_cd is null
            then 
                'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
                || TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
                || ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
                --|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
                || ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
                || ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
                || ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
                || ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
        else
             'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
                || TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
                || ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
                --|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
                || ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
                || ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
                || ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
                || ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
                   --RECUPERÇÃO
                || '//Desconto de R$ '|| AUX.DOCI_VL || ' referente a recuperação de ' || QR.QURE_MD_QR || ' m³ de Take Or Pay.'
            end
 --Desconto de R$ 1.345,63 referente a recuperação de 1430 m³ de Take Or Pay."
-- INDUSTRIAL GRANDES VOLUMES
-- COMERCIAL GRANDES VOLUMES
when 4
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 




-- O VOLUME SERÁ A SOMA DAS QUANTIDADES PREVISTAS NO ITEM DA NOTA
when 14
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 


-- AUTOUSO CONSUMO PROPRIO
when 15
    THEN 
'' 
  else

-- ALTERAÇÃO REALIZADA DIA 08/11/22 PARA QUE O PERIODO DE LEITURA FIQUE DE ACORDO CONSIDERANDO UM DIA APÓS LEITURA ANTERIOR  
'Per. Med.:' || TO_CHAR(mh.MEHI_TM_LEITURA_ANTERIOR + 1, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(mh.MEHI_TM_LEITURA_FATURADA, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: 
Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0)) ||
' // A falta de Pagto do título, após o 35º dia do vencimento acarretará o corte do fornecimento.' 
end AS DSC_COMPLEMENTO,
'' AS COD_TIPO_OBSERVACAO,
TINF_TM_ULTIMA_ALTERACAO as DATAMODIFICACAO, 
(CASE WHEN (nf.TINF_CD_OPERACAO = 'I') THEN ('INSERT') ELSE ('UPDATE') END) AS OPERACAO
from ti_nota_fiscal  nf
INNER JOIN TI_CONTRATO ON TI_CONTRATO.TICO_CD = nf.TICO_CD
LEFT join TI_NOTA_FISCAL_ITEM on nf.TINF_CD = TI_NOTA_FISCAL_ITEM.TINF_CD
LEFT join fatura f on nf.TINF_CD_FATURA = f.FATU_CD
LEFT join consumo_historico ch on f.COHI_CD = ch.COHI_CD
LEFT join medicao_historico mh on ch.MEHI_CD_ATUAL = mh.MEHI_CD
LEFT join ti_contrato tc on nf.tico_cd = tc.TICO_CD
LEFT join contrato c on tc.TICO_CD_ORIGEM = c.cont_cd
LEFT join rota r on F.rota_cd = r.rota_cd
LEFT join faturamento_grupo fg on r.fagr_cd = fg.fagr_cd
LEFT join faturamento_cronograma fc on f.fatu_dt_am_referencia = fc.facr_dt_am_faturamento and f.fatu_nr_ciclo = fc.facr_nr_ciclo AND fc.facr_in_uso = 1 and fg.fagr_cd = fc.fagr_cd
LEFT join faturamento_atividade_cronogr fac on fc.facr_cd = fac.facr_cd and fac.atsi_cd = 8 AND fac.faac_in_uso = 1 --AND fac.faac_tm_realizacao > '01/01/2020' --FATURAR GRUPO  

--adicionado em 04/08/2023 para a recuperação
LEFT JOIN QUANTIDADE_RECUPERACAO QR ON F.FATU_CD = QR.FATU_CD 
LEFT JOIN DOCUMENTO_COBRANCA_ITEM DCI ON F.FAGE_CD = DCI.FAGE_CD
LEFT JOIN DOCUMENTO_COBRANCA DC ON DCI.DOCO_CD = DC.DOCO_CD
LEFT JOIN DOCUMENTO_COBRANCA_ITEM AUX ON DC.DOCO_CD = AUX.DOCO_CD
--
INNER JOIN CONTRATO_PONTO_CONSUMO CPC ON CPC.COPC_CD = tc.TICO_COPC_CD
INNER JOIN PONTO_CONSUMO PC ON PC.POCN_CD = CPC.POCN_CD
where TINF_CD_TIPO_OPERACAO = 'S' AND TINF_CD_TIPO_NOTA_FISCAL = 'N' 
AND TINF_CD_SITUACAO = 'NP' 

and nf.TINF_DS_SERIE = '5'
--RECUPERAÇÃO
AND AUX.FAGE_CD IS NOT NULL
--AND ti_nota_fiscal_item.tini_cd_segmento = 3
--and F.fatu_Cd = 682630


GROUP BY TINF_DS_SERIE, TINF_NR, TINF_CD_SISTEMA_ORIGEM, TINF_CD_OPERACAO, TINF_TM_ULTIMA_ALTERACAO, 
mh.MEHI_TM_LEITURA_ANTERIOR, mh.MEHI_TM_LEITURA_FATURADA, nf.TINF_VL_TOTAL, COHI_MD_PCS, 
ch.COHI_NR_FATOR_PTZ, C.CONT_DT_ANO, C.CONT_NR, ch.COHI_MD_CONSUMO_APURADO, ti_nota_fiscal_item.tini_cd_segmento
,fac.faac_dt_inicio, fac.faac_dt_FIM, pc.raat_cd, AUX.DOCI_VL, QR.QURE_MD_QR, aux.crdr_cd;







- GGAS_ADMIN.VIEW_TI_NF_OBS_GGAS_PIR source

CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VIEW_TI_NF_OBS_GGAS_PIR" ("COD_FILIAL_ORIGEM", "COD_SERIE_ORIGEM", "COD_NF_ORIGEM", "COD_OBS_ORIGEM", "DSC_COMPLEMENTO", "COD_TIPO_OBSERVACAO", "DATAMODIFICACAO", "OPERACAO") AS 
  SELECT 
CAST('001' AS VARCHAR2(6)) AS COD_FILIAL_ORIGEM,
CAST(nf.TINF_DS_SERIE AS VARCHAR2(4)) AS COD_SERIE_ORIGEM,
--'21' AS COD_SERIE_ORIGEM,
CAST(TRIM(nf.TINF_NR) AS VARCHAR2(9 BYTE)) AS COD_NF_ORIGEM,
'98' AS COD_OBS_ORIGEM,
-- AJUSTE DO TEXTO DA OBSERVACAO DE ACORDO COM O SEGMENTO EM 31/10/2022 - INCLUINDO A MENSAGEM DE ISENÇÃO DE PIS/COFINS
case pc.raat_cd 
-- VEICULAR GNV
when 6 
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI.

 Red. alíq. do ICMS Conf.Art 1º, inc.I, alínea a e b da Lei Nº
14.956, de 25/04/2013.

Operação tributada a alíquota zero de PIS e COFINS 

conforme Medida Provisória Nº 1.163, de 28 de fevereiro de 2023.

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'

when 7 
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI.

 Red. alíq. do ICMS Conf.Art 1º, inc.I, alínea a e b da Lei Nº
14.956, de 25/04/2013.

Operação tributada a alíquota zero de PIS e COFINS 

conforme Medida Provisória Nº 1.163, de 28 de fevereiro de 2023.

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'

when 10
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI.

Alíquota do ICMS conforme lei 15.599/15 art. 23-b inciso VII

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'
-- COMERCIAL GRANDES VOLUMES
when 4
    THEN 
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI.

Alíquota do ICMS conforme lei 15.599/15 art. 23-b inciso VII

 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.'

when 14
    THEN 
'De Acordo com o Artigo 18, Titulo IV, Da Imunidade Tributaria e o Paragrafo 3o., Artigo 155 da CF os derivados de Petróleo, Gás Natural 2711.21.00, são imunes a incidência do IPI. 

Isenção ICMS Conforme Decreto 14.876-91 Art. 9A,Anexo 78, Art. 87.

Faturamento conf. Contrato DTC/GCVI Nº 011/2013 Cláusula 10ª - Preço, item 10.1.1

TELEATENDIMENTO: COPERGÁS: 0800 281 2002 / OUVIDORIA ARPE: 0800 281 3844.' 

when 15
    THEN 
'De acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI. 

GÁS CONSUMIDO PELA COMPANHIA NA PRODUÇÃO DE ENERGIA TÉRMICA NO PERÍODO. OUVIDORIA ARPE: 0800 281 3844' 

  else
'De Acordo com o Artigo 18, Título IV - Da Imunidade Tributária e o Parágrafo 3º, Artigo 155 da CF os derivados de Petróleo (Gás Natural - 2711.21.00) são imunes a incidência do IPI.
 TELEATENDIMENTO: COPERGÁS: 0800 281 2002/ OUVIDORIA ARPE: 0800 281 3844.' 
 end
 AS DSC_COMPLEMENTO,
'' AS COD_TIPO_OBSERVACAO,
TINF_TM_ULTIMA_ALTERACAO as DATAMODIFICACAO, 
(CASE WHEN (nf.TINF_CD_OPERACAO = 'I') THEN ('INSERT') ELSE ('UPDATE') END) AS OPERACAO
from ti_nota_fiscal nf 
INNER JOIN TI_CONTRATO ON TI_CONTRATO.TICO_CD = nf.TICO_CD
inner join TI_NOTA_FISCAL_ITEM on nf.TINF_CD = TI_NOTA_FISCAL_ITEM.TINF_CD
--- USADO PARA RETORNAR O RAMO DE ATIVIDADE
INNER JOIN CONTRATO_PONTO_CONSUMO CPC ON CPC.COPC_CD = TI_CONTRATO.TICO_COPC_CD
INNER JOIN PONTO_CONSUMO PC ON PC.POCN_CD = CPC.POCN_CD

where TINF_CD_TIPO_OPERACAO = 'S' AND TINF_CD_TIPO_NOTA_FISCAL = 'N' 
AND TINF_CD_SITUACAO = 'NP' 
--and TINF_NR = 266719

and nf.TINF_DS_SERIE = '5'

GROUP BY TINF_DS_SERIE, TINF_NR, TINF_CD_SISTEMA_ORIGEM, TINF_CD_OPERACAO, TINF_TM_ULTIMA_ALTERACAO, ti_nota_fiscal_item.tini_cd_segmento, pc.raat_cd
union


select
CAST('001' AS VARCHAR2(6)) AS COD_FILIAL_ORIGEM,
CAST(nf.TINF_DS_SERIE AS VARCHAR2(4)) AS COD_SERIE_NF_ORIGEM,
--'21' AS COD_SERIE_ORIGEM,
CAST(TRIM(nf.TINF_NR) AS VARCHAR2(9 BYTE)) AS COD_NF_ORIGEM,
'99' AS COD_OBS_ORIGEM,  

--------------------------------

-- AJUSTE DO TEXTO DA OBSERVACAO DE ACORDO COM O RAMO DE ATIVIDADE EM 22/11/2022

case pc.raat_cd 
-- VEICULAR GNV
when 6 
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: 
Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
-- VEICULAR GNC
 when 7 
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: 
Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
-- INDUSTRIAL GRANDES VOLUMES
-- O VOLUME SERÁ A SOMA DAS QUANTIDADES PREVISTAS NO ITEM DA NOTA
when 10
    THEN 
        -- AJUSTE EM 07/08/2023 PARA INCLUIR NA OBSERVAÇÃO O TEXTO SOBRE A RECUPERAÇÃO, CASO EXISTA
        -- case when QR.QURE_MD_QR is null
        -- ENQUANTO A RECUPERAÇÃO NÃO FOR AUTOMATICA, SERÁ VERIFICADO PELO CREDITO DEBITO. QUANTO ESTIVER AUTOMATICA AI SERA DESCOMENTADA A LINHA ACIMA
        case when aux.crdr_cd is null
            then 
                'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
                || TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
                || ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
                --|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
                || ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
                || ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
                || ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
                || ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
        else
             'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
                || TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
                || ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
                --|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
                || ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
                || ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
                || ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
                || ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 
                   --RECUPERÇÃO
                || '//Desconto de R$ '|| AUX.DOCI_VL || ' referente a recuperação de ' || QR.QURE_MD_QR || ' m³ de Take Or Pay.'
            end
 --Desconto de R$ 1.345,63 referente a recuperação de 1430 m³ de Take Or Pay."
-- INDUSTRIAL GRANDES VOLUMES
-- COMERCIAL GRANDES VOLUMES
when 4
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 




-- O VOLUME SERÁ A SOMA DAS QUANTIDADES PREVISTAS NO ITEM DA NOTA
when 14
    THEN 
'Per. Med.:' || TO_CHAR(fac.faac_dt_inicio, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(fac.faac_dt_fim, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || sum(TI_NOTA_FISCAL_ITEM.TINI_QN)
--|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0))
|| ' // A falta de pagto do título, após 72 horas do vencimento, acarretará o corte do fornecimento.' 


-- AUTOUSO CONSUMO PROPRIO
when 15
    THEN 
'' 
  else

-- ALTERAÇÃO REALIZADA DIA 08/11/22 PARA QUE O PERIODO DE LEITURA FIQUE DE ACORDO CONSIDERANDO UM DIA APÓS LEITURA ANTERIOR  
'Per. Med.:' || TO_CHAR(mh.MEHI_TM_LEITURA_ANTERIOR + 1, 'DD/MM/YYYY') || ' a ' 
|| TO_CHAR(mh.MEHI_TM_LEITURA_FATURADA, 'DD/MM/YYYY')
|| ' // Volume Faturado: ' || ch.COHI_MD_CONSUMO_APURADO 
|| ' // PCS Ponderado: ' || ch.COHI_MD_PCS 
|| ' // Fator de Correção PTZ: ' || ch.COHI_NR_FATOR_PTZ
|| ' // INTEGRAÇÃO GGAS: 
Código Identificador para Débito Automático Banco do Brasil: ' || (C.CONT_DT_ANO || lpad(C.CONT_NR,5,0)) ||
' // A falta de Pagto do título, após o 35º dia do vencimento acarretará o corte do fornecimento.' 
end AS DSC_COMPLEMENTO,
'' AS COD_TIPO_OBSERVACAO,
TINF_TM_ULTIMA_ALTERACAO as DATAMODIFICACAO, 
(CASE WHEN (nf.TINF_CD_OPERACAO = 'I') THEN ('INSERT') ELSE ('UPDATE') END) AS OPERACAO
from ti_nota_fiscal  nf
INNER JOIN TI_CONTRATO ON TI_CONTRATO.TICO_CD = nf.TICO_CD
LEFT join TI_NOTA_FISCAL_ITEM on nf.TINF_CD = TI_NOTA_FISCAL_ITEM.TINF_CD
LEFT join fatura f on nf.TINF_CD_FATURA = f.FATU_CD
LEFT join consumo_historico ch on f.COHI_CD = ch.COHI_CD
LEFT join medicao_historico mh on ch.MEHI_CD_ATUAL = mh.MEHI_CD
LEFT join ti_contrato tc on nf.tico_cd = tc.TICO_CD
LEFT join contrato c on tc.TICO_CD_ORIGEM = c.cont_cd
LEFT join rota r on F.rota_cd = r.rota_cd
LEFT join faturamento_grupo fg on r.fagr_cd = fg.fagr_cd
LEFT join faturamento_cronograma fc on f.fatu_dt_am_referencia = fc.facr_dt_am_faturamento and f.fatu_nr_ciclo = fc.facr_nr_ciclo AND fc.facr_in_uso = 1 and fg.fagr_cd = fc.fagr_cd
LEFT join faturamento_atividade_cronogr fac on fc.facr_cd = fac.facr_cd and fac.atsi_cd = 8 AND fac.faac_in_uso = 1 --AND fac.faac_tm_realizacao > '01/01/2020' --FATURAR GRUPO  

--adicionado em 04/08/2023 para a recuperação
LEFT JOIN QUANTIDADE_RECUPERACAO QR ON F.FATU_CD = QR.FATU_CD 
LEFT JOIN DOCUMENTO_COBRANCA_ITEM DCI ON F.FAGE_CD = DCI.FAGE_CD
LEFT JOIN DOCUMENTO_COBRANCA DC ON DCI.DOCO_CD = DC.DOCO_CD
LEFT JOIN DOCUMENTO_COBRANCA_ITEM AUX ON DC.DOCO_CD = AUX.DOCO_CD
--
INNER JOIN CONTRATO_PONTO_CONSUMO CPC ON CPC.COPC_CD = tc.TICO_COPC_CD
INNER JOIN PONTO_CONSUMO PC ON PC.POCN_CD = CPC.POCN_CD
where TINF_CD_TIPO_OPERACAO = 'S' AND TINF_CD_TIPO_NOTA_FISCAL = 'N' 
AND TINF_CD_SITUACAO = 'NP' 

and nf.TINF_DS_SERIE = '5'
--RECUPERAÇÃO
AND AUX.FAGE_CD IS NOT NULL
--AND ti_nota_fiscal_item.tini_cd_segmento = 3
--and F.fatu_Cd = 682630

GROUP BY TINF_DS_SERIE, TINF_NR, TINF_CD_SISTEMA_ORIGEM, TINF_CD_OPERACAO, TINF_TM_ULTIMA_ALTERACAO, 
mh.MEHI_TM_LEITURA_ANTERIOR, mh.MEHI_TM_LEITURA_FATURADA, nf.TINF_VL_TOTAL, COHI_MD_PCS, 
ch.COHI_NR_FATOR_PTZ, C.CONT_DT_ANO, C.CONT_NR, ch.COHI_MD_CONSUMO_APURADO, ti_nota_fiscal_item.tini_cd_segmento
,fac.faac_dt_inicio, fac.faac_dt_FIM, pc.raat_cd, AUX.DOCI_VL, QR.QURE_MD_QR, aux.crdr_cd;

SELECT * FROM VIEW_TI_NF_SAIDA_GGAS_PIR ORDER BY DAT_EMISSAO DESC

SELECT SUM(sumd_md_consumo), SUM(sumd_md_consumo_medido)
FROM SUPER_MEDICAO_DIARIA
WHERE sumd_cd_supervisorio = 1604
AND SUMD_DT_AM_LEITURA = 202309 AND SUMD_NR_CICLO = 1

SELECT * FROM ponto_consumo WHERE pocn_DS LIKE '%CBVP'
SELECT * FROM ponto_consumo WHERE pocn_DS LIKE '%GNC%MASTERGAS%'
SELECT * FROM RAMO_ATIVIDADE

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 37 ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM CHAMADO

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC, CHAM_CD

-- Consulta para exibir chamados visualizáveis pela GDIS Operação e que não são visualizados pela DIPON

SELECT * FROM CHAMADO WHERE CHAM_CD = 139475

SELECT * FROM UNIDADE_ORGANIZACIONAL -- DIPON 44 OPERAÇÃO 37


SELECT  pocn.pocn_cd, pocn.pocn_ds--, pocn.pocn_cd_supervisorio
        ,mehi.mehi_dt_am_leitura, mehi.mehi_nr_ciclo
        ,SUM(mehi_md_consumo_medidor) AS "Consumo Medidor MEHI"
        ,SUM(cohi.cohi_md_consumo) AS "Consumo COHI"
        ,SUM(mehi_md_consumo_corretor) AS "Consumo Corretor MEHI"
        ,SUM(cohi.cohi_md_consumo_medido) AS "Consumo Medido COHI"
        ,SUM(cohi.cohi_md_consumo_apurado) AS "Consumo Apurado"--fait.fait_md_consumo
        ,SUM(fait.fait_md_consumo) AS "Consumo Fatura"
        ,SUM(fait.fait_md_consumo)/SUM(cohi.cohi_md_consumo_apurado) AS Razao
        --corrigir com diferença --> SUM(fait.fait_md_consumo) - ,SUM(cohi.cohi_md_consumo_apurado)
        ,CASE (SUM(cohi.cohi_md_consumo_apurado)) WHEN (SUM(fait.fait_md_consumo)) THEN 'OK'
            ELSE 'ANALISAR VOLUMES' 
        END AS "STATUS"
FROM ponto_consumo pocn
INNER JOIN medicao_historico mehi ON mehi.pocn_cd = pocn.pocn_cd
INNER JOIN consumo_historico cohi ON cohi.mehi_cd_atual = mehi.mehi_cd
LEFT JOIN fatura fatu ON cohi.cohi_cd = fatu.cohi_cd
LEFT JOIN fatura_item fait ON fatu.fatu_cd =fait.fatu_cd
WHERE pocn.rota_cd = 138 --133 veicular, 144 supervisorioindpenalidades 138 supervisorioindustrial
--and pocn.pocn_cd =312926 
--AND mehi.mehi_dt_am_leitura > 202312
--AND mehi.mehi_nr_ciclo = 4
and mehi_in_uso = 1
GROUP BY pocn.pocn_cd, pocn.pocn_ds
        ,mehi.mehi_dt_am_leitura, mehi.mehi_nr_ciclo
HAVING SUM(fait.fait_md_consumo) > 1 --AND (SUM(cohi.cohi_md_consumo_apurado)) <> (SUM(fait.fait_md_consumo))
ORDER BY pocn.pocn_cd, mehi.mehi_dt_am_leitura desc, mehi.mehi_nr_ciclo DESC

SELECT * FROM tarifa ORDER BY TARI_TM_ULTIMA_ALTERACAO desc;
SELECT * FROM tarifa_faixa

SELECT * FROM FATURA_ITEM_TRIBUTACAO ORDER BY FATB_TM_ULTIMA_ALTERACAO desc;
SELECT * FROM fatura;


SELECT tvt.TAVT_CD, tvt.TAVI_CD, tb.TRIB_DS, tvt.TAVT_TM_ULTIMA_ALTERACAO, tvt.TAVT_DT_INICIO_VIGENCIA  FROM TARIFA_VIGENCIA_TRIBUTO tvt
INNER JOIN Tributo tb ON tvt.TRIB_CD = tb.TRIB_CD
ORDER BY tvt.TAVT_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM tarifa ORDER BY TARI_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM TARIFA_PONTO_CONSUMO WHERE POCN_CD = 40

SELECT * FROM TARIFA_VIGENCIA_DESCONTO

pocn_cd = 40

SELECT * 

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%BEBERIBE%' --RAAT_CD = 6

SELECT "SEGMENTO",

	"RAMO_ATIVIDADE",

	"PONTO_CONSUMO",

	"LEITURA_INICIAL",

	"LEITURA_FINAL",

	"CONSUMO_DIA",

	"DATA_LEITURA",

	"CONSUMO_PTZ",

	"CONSUMO_FATURADO"
 
FROM "GGAS_ADMIN"."VIEW_CONTROLE_CONSUMO_DIARIO"
ORDER BY DATA_LEITURA DESC

SELECT * FROM VIEW_TI_NOTA_FISCAL_ENTRADA

--10JAN

--Ajuste de contrato

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'ED%NIA VIDAL%APT 0201%' --PEGA POCN_CD = 4815
UNION
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%EDF%MONTPARNASSE%APT 0102%' --PEGA POCN_CD = 4815

SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 232208) -- verifica se há mais de um registro com 1
union
SELECT *  FROM contrato WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (4802))

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (28210,31681,40841,43529)

ENSEADA DE PIEDADE - TORRE SERRAMBI, APT 1202 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE SERRAMBI, APT 0302 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE MARACAIPE, APT 2002 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE MARACAIPE, APT 0303 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE CORAIS, APT 1701 - ENSEADA DE PIEDADE - TORRE
ENSEADA DE PIEDADE - TORRE CORAIS, APT 1602 - ENSEADA DE PIEDADE - TORRE 
THE B-BURGERS PIEDADE - THE B-BURGERS PIEDADE
EDF. ROMILDO MOREIRA JR, APT 0202 - EDF. ROMILDO MOREIRA JR - APT 0202

-- contrato ativo

SELECT * FROM CONTRATO_SITUACAO

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%CAMILO%CASTELO%BRANCO%' --PEGA POCN_CD = 5326

SELECT * FROM contrato WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (5326))

SELECT CONT_CD, COSI_CD, CONT_IN_USO  FROM contrato WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (4654)) --CONT_CD = 49421 -- 'EDF DE VILLE' está em negociação

UPDATE CONTRATO SET COSI_CD = 9 WHERE CONT_CD IN (48941) --Estava 5
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (48927) --Estava 5

--6079 0303



-- Consulta Maria Clara

select lm.lemo_dt_am_faturamento as mes_ano, 
r.rota_nr as rota,
pc.pocn_ds as ponto_consumo,
lm.lemo_tm_leitura as data_leitura,
la.lean_ds as anormalidade,
--Acumulado de meses com Medidor Ilegivel
--Comentario
lm.lemo_md_leitura as valor_leitura,
case la.lean_in_bloqueia_faturamento 
 WHEN 0 then 'NÃO'
 WHEN 1 THEN 'SIM' 
 END as bloqueia_faturamento , lm.lemo_ds_observacao_leitura AS OBSERVAÇÃO_LEITURISTA
from leitura_movimento lm 
inner join ponto_consumo pc on lm.pocn_cd = pc.pocn_cd
inner join rota r on lm.rota_cd = r.rota_cd
inner join leitura_anormalidade la on lm.lean_cd = la.lean_cd
--inner join COLETOR@leitura_movimento lemo ON
WHERE lm.lemo_in_uso = 1 AND lm.lems_cd IN (3, 4, 5)
AND (to_date(to_char(lm.lemo_tm_ultima_alteracao, 'dd/MM/yy'),'dd/MM/yy') between to_date('01/01/23', 'dd/MM/yy') and to_date('31/12/23', 'dd/MM/yy'))
order by lm.lemo_dt_am_faturamento, r.rota_nr, lm.lemo_nr_sequencia_leitura

SELECT * FROM LEITURA_MOVIMENTO ORDER BY LEMO_CD DESC

SELECT * FROM LEITURA_ANORMALIDADE WHERE upper(LEAN_DS) LIKE '%MEDIDOR%' -- 41 quase ilegível, 7 medidor danificado 40 medidor ilegível

SELECT SCORE(1), title from news WHERE CONTAINS(text, 'oracle', 1) > 0;

-- GGAS_ADMIN.VIEW_TI_ITEM_NF_ENT_GGAS_PIR source

DROP DATABASE LINK coletor_ggas_link;

CREATE DATABASE LINK coletor_ggas_link
CONNECT TO postgres
IDENTIFIED BY postgres
USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.1.227)(PORT=5432))(CONNECT_DATA=(SID=coletor-ggas-prod)))'

SELECT * FROM leitura_movimento@coletor_ggas_link

VIEW_CONTROLE_CHAMADO_GDIS

SELECT * FROM RAMO_ATIVIDADE --6  VEI GNV 7 VEI GNC 11 IND GNC 12 IND CBVP

-- 11JAN

-- Usuário x papel x visualização de chamados

SELECT * FROM USUARIO_SISTEMA WHERE USSI_NM_LOGIN in ('heitor.leoncio','joseane.oliveira','fernanda.goncalves','jessica.lima') --FUNC_CD 320, 310, 96, 319 --UUS
SELECT * FROM FUNCIONARIO WHERE FUNC_CD IN (320, 310, 96, 319)
SELECT * FROM USUARIO_PAPEL_SISTEMA

SELECT * FROM CHAMADO WHERE CHAM_CD = 139475

SELECT * FROM UNIDADE_ORGANIZACIONAL -- DIPON 44 OPERAÇÃO 37

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 37 ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC
SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC, CHAM_CD

-- Chamados visualizáveis pela GDIS OPERAÇÃO

SELECT count(CHAM_CD) FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 37 ORDER BY CHAM_CD DESC

-- Chamados visualizáveis pela DIPON

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 44 ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC

-- Chamados visualizáveis por ambas 28

SELECT CHAM_CD FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 37
INTERSECT
SELECT CHAM_CD FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 44

-- Chamados visualizáveis apenas pela GDIS OPERAÇÃO e não pela DIPON
SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 37

MINUS

(SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 37
INTERSECT
SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 44)

-- Chamados com data de alteração pelo menos 01-10-2023

SELECT * FROM Chamado WHERE CHAM_CD IN(
SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 45

MINUS

(SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 45
INTERSECT
SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 44)
) ORDER BY CHAM_TM_ULTIMA_ALTERACAO DESC

INSERT INTO CHAMADO_UNIDADE_ORGANIZACIONAL (CHAM_CD, CHUO_CD, UNOR_CD, CHUO_IN_USO, CHUO_TM_ULTIMA_ALTERACAO, CHUO_NR_VERSAO) VALUES ( CHAM, VAR++, 37, 1, sysdate, 0)

SELECT COUNT(*) FROM CHAMADO WHERE CHAM_TM_ULTIMA_ALTERACAO > TO_DATE('29-09-2023','DD-MM-YYYY')

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL ORDER BY CHUO_CD DESC -- 511129
SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL ORDER BY CHUO_CD DESC




-- Não envio de e-mails abertura de chamados

SELECT * FROM CHAS_OPER_EMAIL_CADASTRO

select * from VIEW_TI_ITEM_NF_ENT_GGAS_PIR 
where num_sequencial_entrada_origem IN (800542, 800596, 800597)

select * from VIEW_TI_ITEM_NFE_IMP_GGAS_PIR 
where num_sequencial_entrada_origem IN (800542, 800596, 800597) 
order by num_sequencial_item_entrada 

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%POSTO%REAL%'

--- cod_ndo_origem 


-- CASO MONT PARNASSE 0503

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ESTAÇÃO ATLANTICO SUL%APT 1905%' --PEGA POCN_CD = 4815

SELECT cont_cd, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 17478) -- verifica se há mais de um registro com 1
union
SELECT *  FROM contrato WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (4802))

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (45241)

-- ROTA S01

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRE SERRAMBI%APT 1202%' --PEGA POCN_CD = 19629
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (19629) -- ESTAVA 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 19629) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (29842)
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (49270) -- Estava 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRE SERRAMBI%APT 0302%' --PEGA POCN_CD = 19605
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 19605) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (27328,47002)
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (19605) -- ESTAVA 2
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRE MARACAIPE%APT 2002%' --PEGA POCN_CD = 19593

SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 19593) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (27328,47002)
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 19593
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (19593) -- ESTAVA 2
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (40833) -- Estava 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRE MARACAIPE%APT 0303%' --PEGA POCN_CD = 19593
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (18675) -- ESTAVA 2
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 18675) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (39517)
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (47655) -- Estava 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRE CORAIS%APT 1701%' --PEGA POCN_CD = 19593
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (6088) -- ESTAVA 2
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 6088) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (49393) -- Estava 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRE CORAIS%APT 1602%' --PEGA POCN_CD = 19593
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (4880) -- ESTAVA 2
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 4880) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (49242) -- Estava 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%B-BURGERS PIEDADE%' --PEGA POCN_CD = 19593
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (286618) -- ESTAVA 2
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 286618) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (49673) -- Estava 12

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%EDF%ROMILDO MOREIRA%APT 0202%' --PEGA POCN_CD = 19593 
UPDATE PONTO_CONSUMO SET POCS_CD = 8 WHERE POCN_CD IN (4753) -- ESTAVA 2
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 4753) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (39095,44201)
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (47765) -- Estava 2

--Lançados na rota ROTATEMP01 rota 67 GFTEMP01

SELECT * FROM rota WHERE rota_cd = 67

SELECT * FROM CONTRATO_SITUACAO

ENSEADA DE PIEDADE - TORRE SERRAMBI, APT 1202 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE SERRAMBI, APT 0302 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE MARACAIPE, APT 2002 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE MARACAIPE, APT 0303 - ENSEADA DE PIEDADE - 
ENSEADA DE PIEDADE - TORRE CORAIS, APT 1701 - ENSEADA DE PIEDADE - TORRE
ENSEADA DE PIEDADE - TORRE CORAIS, APT 1602 - ENSEADA DE PIEDADE - TORRE 
THE B-BURGERS PIEDADE - THE B-BURGERS PIEDADE
EDF. ROMILDO MOREIRA JR, APT 0202 - EDF. ROMILDO MOREIRA JR - APT 0202

ENSEADA DE PIEDADE - TORRE MARACAIPE - APT 2002

-- Shirley

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%COSTA DAS ROCHAS%2404%' --PEGA POCN_CD = 19629
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 239205) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (36758,48490)

edf. vânia vidal, apt 1902.

SELECT * FROM CONTRATO_SITUACAO
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 302944 --PEGA POCN_CD = 19629
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 302944) AND CONT_IN_USO = 1 -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET COSI_CD = 2 WHERE CONT_CD IN (45684)


SELECT * FROM ROTA WHERE ROTA_CD = 63
-- Mostra contratos em negociação
select   pocn.pocn_cd, pocn.imov_cd, pocn.pocn_ds, 
         cont.cosi_cd, cosi.cosi_ds, pocn.pocn_cd_supervisorio
from ponto_consumo pocn
LEFT join contrato_ponto_consumo copc ON pocn.pocn_cd = copc.pocn_cd
LEFT join contrato cont ON copc.cont_cd = cont.cont_cd
inner join contrato_situacao cosi ON cosi.cosi_cd = cont.cosi_cd
where pocn.rota_cd = 48
and cont.cosi_cd <> 1
and cont.cont_in_uso = 1
;

SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (
select   pocn.pocn_cd
from ponto_consumo pocn
LEFT join contrato_ponto_consumo copc ON pocn.pocn_cd = copc.pocn_cd
LEFT join contrato cont ON copc.cont_cd = cont.cont_cd
inner join contrato_situacao cosi ON cosi.cosi_cd = cont.cosi_cd
where pocn.rota_cd = 48
and cont.cosi_cd <> 1
and cont.cont_in_uso = 1
)

NDO 

4736

SELECT * FROM contrato_ponto_consumo WHERE cont_cd IN (4736) -- 4852,4177,4861,7129
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD =302852)
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (4736)
SELECT * FROM contrato WHERE cont_cd = 50673
UNION
SELECT * FROM contrato WHERE cont_cd = 50672

-- Caso Arlanxeo

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ENSEADA DE PIEDADE%1701%' --PEGA POCN_CD = 214737

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 6088) AND COSI_CD = 1 -- verifica se há mais de um registro com 1 
union
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 19629)  AND COSI_CD = 1 --49270

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 6088)

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (20969)

INSERT INTO CHAMADO_UNIDADE_ORGANIZACIONAL (CHAM_CD, CHUO_CD, UNOR_CD, CHUO_IN_USO, CHUO_TM_ULTIMA_ALTERACAO, CHUO_NR_VERSAO)

SELECT * FROM CHAMADO ORDER BY cham_cd DESC
2312150217

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE cham_cd = 142274

SELECT * FROM UNIDADE_ORGANIZACIONAL

SELECT * FROM chamado WHERE chpr_cd = 248138

SELECT * FROM CHAMADO_PROTOCOLO ORDER BY CHPR_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM CHAMADO_PROTOCOLO WHERE CHPR_NR_PROTOCOLO = 2312150217 -- CHPR_CD = 248138

INSERT INTO CHAMADO_UNIDADE_ORGANIZACIONAL (CHAM_CD, CHUO_CD, UNOR_CD, CHUO_IN_USO, CHUO_TM_ULTIMA_ALTERACAO, CHUO_NR_VERSAO) VALUES (142274,511864,44,1,sysdate,1);


SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE CHAM_CD IN
(
SELECT CHAM_CD FROM CHAMADO WHERE CHPR_CD IN (
SELECT CHPR_CD FROM CHAMADO_PROTOCOLO WHERE CHPR_NR_PROTOCOLO IN (
2311070263,
2401150050,
2312150361,
2312150340,
2312120200,
2401150043,
2312210392,
2312210641,
2401150031,
2312250074,
2401150041
)
)
)
ORDER BY CHAM_CD

SELECT * FROM UNIDADE_ORGANIZACIONAL WHERE UNOR_CD IN (42,43,45,50,60)

SELECT * FROM UNIDADE_ORGANIZACIONAL WHERE UNOR_CD IN (37,44)

--Arlanxeo

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ARLANXEO%' --PEGA POCN_CD = 19593
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 24) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50631) -- Estava 5

-- 12JAN

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ROASTERS%' --PEGA POCN_CD = 4815
union
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ARLANXEO%' --PEGA POCN_CD = 19593

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 314006) AND COSI_CD = 1-- verifica se há mais de um registro com 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD = 50930 -- ANTES ESTAVA 2
UNION
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 24)  AND COSI_CD = 1
UNION
SELECT * FROM CONTRATO WHERE CONT_CD =18784  AND COSI_CD = 1




SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%DUVALIA%' --PEGA POCN_CD = 273601
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 278513

SELECT COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 273601)

UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (48815)

SELECT * FROM CONTRATO_SITUACAO

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%POSTO%' --PEGA POCN_CD = 4815

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 214737)-- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_NR_VERSAO = 0 WHERE CONT_CD = 49976 -- ANTES ESTAVA 1

SELECT * FROM TI_NOTA_FISCAL WHERE TINF_NR = 600

--Caso Caçulinha 4

SELECT table_name FROM all_tab_columns WHERE column_name = 'UNFE_CD'

SELECT * FROM UNIDADE_FEDERACAO

SELECT * FROM CLIENTE_SITUACAO

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 24

SELECT * FROM SEGMENTO

SELECT * FROM Cliente WHERE clie_nm_abreviado LIKE '%POSTO%LINHA%' --clie_cd = 306339 --CLSI_CD = 1 APTO, CLSI_CD = 2 INAPTO UNFE_CD = 1 SEGM_CD = 4
UPDATE Cliente SET CLSI_CD = 1, CLTI_CD = 2, SEGM_CD = 3 WHERE CLIE_CD = 306339
UNION
SELECT * FROM Cliente WHERE clie_nm_abreviado LIKE '%ARLANX%' --clie_cd = 29

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%POSTO %INHA%4' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ARLANX%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 302852) AND CONT_IN_USO = 1
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD = 50673
union
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD = 18815
UNION 
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD =49393
UNION 
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD =50673
UNION
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD =19117

SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE COPC_CD = 47683 ORDER BY COEC_CD DESC -- 85183

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD =50673

UPDATE CONTRATO_PONTO_CONSUMO SET COPC_DS_EMAIL_OPERACIONAL = 'adm.secretaria@gcaculinha.com.br' WHERE COPC_CD = 47683
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE COPC_CD = 47683

adm.secretaria@gcaculinha.com.br
supervisorcaculinha@outlook.com

UPDATE CONTRATO_PONTO_CONS_EMAIL_COBR SET COEC_DS_EMAIL = 'adm.secretaria@gcaculinha.com.br' WHERE COEC_CD = 85181
DELETE FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE COEC_CD = 85179

SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE UPPER(COEC_DS_EMAIL) LIKE 'FINANCEIRO@DOMBLACK%'

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE COPC_CD IN (22050,17436,47742,47741) -- 273600 --3454,21997

SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE COEC_CD = 85182

INSERT INTO CONTRATO_PONTO_CONS_EMAIL_COBR (COEC_CD,COEC_DS_EMAIL,COPC_CD,COEC_IN_PRINCIPAL) VALUES (85184,'',47651,0)

SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE COEC_CD > 85175 -- COEC_CD = 85355

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 3454) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50735) -- Estava 5

--Demandas Eduarda

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%NISSIN%' --PEGA POCN_CD = 19593
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 1251) -- verifica se há mais de um registro com 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (44066) -- Estava 5

-- 15 JAN

Preciso que seja inserido no cadastro do cliente POSTO IND - CAÇULINHA 4 o City Gate a ETC – GARANHUNS,
para que possamos seguir com a medição deste cliente.

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%POSTO %INHA%4' --PEGA POCN_CD = 302852 pocs_cd = 2
union
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ARLANX%' --PEGA POCN_CD = 4815 pocs_cd = 2 --POCN_CD_SUPERVISORIO

SELECT * FROM CITY_GATE -- CIGA_CD = 15 ETC Garanhuns

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE POCN_CD = 302944

SELECT * FROM cep WHERE cep_nr = '50720-590'

SELECT * FROM cep WHERE cep_nm_bairro = 'ZUMBI' -- QUAL CG atende



QUADRA E FACE DE QUADRA VIA SISTEMA

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 302944

SELECT * FROM PONTO_CONSUMO_CITY_GATE ORDER BY POCG_CD DESC

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE POCG_IN_USO = 1 ORDER BY POCG_CD DESC

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE CIGA_CD = 15 --POCG_CG = 414152

INSERT
INTO PONTO_CONSUMO_CITY_GATE (POCG_CD, CIGA_CD, POCG_PR_PARTICIPACAO, POCG_DT_VIGENCIA, POCG_TM_ULTIMA_ALTERACAO, POCN_CD, POCG_IN_USO, POCG_NR_VERSAO)
VALUES (529753,15,100,sysdate,sysdate,302852,1,0)


-- Segunda demanda GMAR - alteração da data de ativação

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%POSTO%LINHA%' --PEGA POCN_CD = 302852 --DATA INSTALAÇÃO E ATIVAÇÃO PARA 02/01/2024 rota_cd 155
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 302852) -- verifica se há mais de um registro com 1

POCN_CD_SUPERVISORIO = 312926

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD_SUPERVISORIO = 312926

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD_SUPERVISORIO IS NOT NULL ORDER BY POCN_CD_SUPERVISORIO DESC --15659

UPDATE PONTO_CONSUMO SET POCN_CD_SUPERVISORIO = 15660 WHERE POCN_CD = 302852

SELECT table_name FROM all_tab_columns WHERE column_name = '%RECUP%'

SELECT * FROM TEMP_SOLICITACAO_CONSUMO

SELECT * FROM MEDIDOR_INSTALACAO WHERE POCN_CD = 302852

UPDATE MEDIDOR_INSTALACAO
SET MEIN_DT = to_date('02/01/2024', 'DD/MM/YYYY'),
MEIN_DT_ATIVACAO = to_date('02/01/2024', 'DD/MM/YYYY'),
MEIN_DT_COVA = to_date('02/01/2024', 'DD/MM/YYYY')
WHERE POCN_CD = 302852 --Estava 09/01/2024

-- INCLUSÃO DE POCN_CD_SUPERVISORIO

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD_SUPERVISORIO IS NOT NULL ORDER BY POCN_CD_SUPERVISORIO DESC

-- Parada programada

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%POSTO IND%OLINDA%' --PEGA POCN_CD = 30 --301308
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 24

UPDATE CONTRATO_PONTO_CONSUMO SET COPC_QN_DIA_CONSEC_PARADA_CLIE = 40, COPC_QN_DIA_CONSEC_PARADA_CDL = 40  WHERE POCN_CD = 299482

-- Caso rota Sul 01

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 19605 -- ENSEADA DE PIEDADE - TORRE CORAIS - APT 1406
UNION
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 5704  -- ENSEADA DE PIEDADE - TORRE SERRAMBI - APT 0302

-- GCRC
SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 301308 --49440

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 301308) AND CONT_IN_USO = 1 --CONT_VL_VOLUME_REFERENCIA

UPDATE CONTRATO SET CONT_IN_USO = 1, COSI_CD = 1 WHERE CONT_CD = 47390
UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 49440
UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 47390
UPDATE CONTRATO SET CONT_IN_USO = 1, COSI_CD = 1 WHERE CONT_CD = 49440

UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 46801

UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 45851

SELECT * FROM FATURA WHERE FATU_CD = 784980 -- 49440 45851

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD = 49390

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 308150

UPDATE CONTRATO SET CONT_VL_VOLUME_REFERENCIA = 2000 WHERE CONT_CD = 49440

union
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 313086) AND CONT_IN_USO = 1
UNION 
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 312546) AND CONT_IN_USO = 1

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%APR%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 301308) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50584)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%TORRES DA LIBERDADE%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 313086) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50490)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%VILLA DAS JAQUEIRAS%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 5574) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (43264)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ILHA DA MADEIRA%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 312906) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50106)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%PR%A DAS OLIVEIRAS%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 312506) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (49833)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%PARADOR DE AST%IAS' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 300603) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50115)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%JARDINS PRINCE' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 312847) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50003)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ZARAGOZA' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 312850) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50007)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%COSTA%PALMEIRA%1004%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT cont_cd, cont_in_uso FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252717) AND CONT_IN_USO = 1
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (31572,31573)














TEMP10 -> NESSE CICLO (JAN-2)
TEMP2 -> 
outra TEMP para colocar o GNC ou GNV
TEMPINTERNACIONAL -> MESMA COISA

SELECT GGAS_ADMIN.SQ_CHUO_CD.NEXTVAL FROM DUAL;

ALTER SEQUENCE SQ_CHUO_CD RESTART START WITH 511864;

ALTER SEQUENCE SQ_CHUO_CD INCREMENT BY 1 MINVALUE 511864;

ALTER SEQUENCE NUM_SEQ_PRESTCONTAS_AD RESTART START WITH 19035;

ALTER SEQUENCE SQ_CHUO_CD INCREMENT BY 1;

SELECT SQ_CHUO_CD.NEXTVAL FROM dual; --514938

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL ORDER BY CHUO_CD DESC

SELECT * FROM CHAMADO_ASSUNTO_UNIDADE ORDER BY CAUO_CD DESC

SELECT * FROM CHAMADO_ASSUNTO_UNIDADE WHERE CHAS_CD IN (84,144,201,261) ORDER BY CHAS_CD

INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514962,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1) --37,44,45,48,50,60

INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514968,84,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514969,84,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514970,84,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514971,84,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514972,144,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514973,144,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514974,144,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514975,144,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514976,201,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514977,201,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514978,201,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514979,201,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514980,261,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514981,261,44,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514982,261,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);
INSERT INTO CHAMADO_ASSUNTO_UNIDADE (CAUO_CD,CHAS_CD,UNOR_CD,CAUO_IN_USO,CAUO_TM_ULTIMA_ALTERACAO,CAUO_NR_VERSAO) VALUES (514983,261,37,1,TO_DATE('19-01-2024','DD-MM-YYYY'),1);

SELECT * FROM CHAMADO_ASSUNTO WHERE UPPER(CHAS_DS) LIKE '%FALTA%' -- 84,144,201,261

SELECT * FROM UNIDADE_ORGANIZACIONAL WHERE UNOR_CD IN (45,48,50,60)
-- INSERÇÃO EM LOTE RELATIVA A CHAMADO DA GDIS

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL ORDER BY CHUO_CD DESC

UPDATE CHAMADO_UNIDADE_ORGANIZACIONAL SET UNOR_CD = 44 WHERE CHUO_CD = 511129

511863

SELECT CHAS_CD FROM CHAS_OPER_EMAIL_CADASTRO GROUP BY CHAS_CD ORDER BY CHAS_CD

INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (70,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (71,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (72,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (73,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (74,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (76,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (410,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (413,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (413,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (414,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (414,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (418,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (418,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (398,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (398,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (408,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (408,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (415,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (415,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (417,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (417,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (123,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (124,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (125,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (126,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (127,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (128,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (129,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (130,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (131,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (132,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (133,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (134,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (135,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (136,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (138,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (139,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (140,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (141,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (142,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (301,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (302,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (303,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (304,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (305,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (306,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (307,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (308,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (309,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (310,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (311,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (312,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (143,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (144,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (145,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (146,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (147,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (148,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (149,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (160,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (161,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (180,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (181,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (182,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (183,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (184,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (185,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (186,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (187,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (188,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (189,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (190,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (191,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (192,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (200,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (201,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (202,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (203,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (204,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (205,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (220,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (221,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (222,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (240,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (241,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (242,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (243,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (244,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (245,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (246,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (247,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (248,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (249,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (250,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (251,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (252,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (260,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (261,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (262,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (263,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (264,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (265,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (280,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (281,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (282,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (75,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (374,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (375,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (67,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (379,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (380,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (382,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (384,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (385,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (387,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (388,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (389,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (391,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (393,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (1,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (2,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (3,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (4,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (5,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (20,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (21,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (60,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (61,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (62,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (63,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (64,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (65,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (66,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (68,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (69,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (70,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (71,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (72,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (73,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (74,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (76,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (77,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (78,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (79,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (80,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (81,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (82,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (83,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (84,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (85,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (86,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (87,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (88,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (101,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (102,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (103,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (120,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (121,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (122,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (397,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (395,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (123,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (124,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (125,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (126,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (127,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (128,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (129,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (130,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (131,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (132,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (133,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (134,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (135,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (136,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (138,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (139,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (140,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (141,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (142,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (301,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (302,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (303,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (304,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (305,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (306,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (307,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (308,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (309,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (310,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (311,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (312,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (143,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (144,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (145,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (146,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (147,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (148,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (149,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (160,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (161,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (180,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (181,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (182,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (183,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (184,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (185,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (186,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (187,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (188,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (189,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (190,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (191,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (192,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (200,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (201,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (202,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (203,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (204,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (205,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (220,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (221,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (222,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (240,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (241,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (242,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (243,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (244,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (245,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (246,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (247,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (248,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (249,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (250,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (251,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (252,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (260,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (261,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (262,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (263,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (264,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (265,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (280,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (281,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (282,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (75,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (374,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (375,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (67,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (379,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (380,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (382,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (384,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (385,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (387,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (388,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (389,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (391,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (393,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (1,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (2,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (3,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (4,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (5,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (20,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (21,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (60,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (61,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (62,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (63,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (64,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (65,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (66,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (68,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (69,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (77,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (78,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (79,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (80,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (81,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (82,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (83,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (84,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (85,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (86,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (87,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (88,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (101,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (102,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (103,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (120,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (121,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (122,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (397,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (395,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (405,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (405,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (410,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (409,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (411,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (411,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (412,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (412,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (399,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (399,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (400,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (400,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (401,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (401,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (406,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (406,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (407,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (407,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (409,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (386,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (386,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (423,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (423,'RESPONSAVEL');


INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (419,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (419,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (421,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (421,'RESPONSAVEL');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (50,'UNIDADES_VISUALIZADORAS');
INSERT INTO CHAS_OPER_EMAIL_CADASTRO (CHAS_CD, OPEE_DS_OPERACAO) VALUES (50,'RESPONSAVEL');


SELECT * FROM FUNCIONARIO WHERE UNOR_CD IN (54)

SELECT * FROM UNIDADE_ORGANIZACIONAL -- GDIS 54

SELECT * FROM AGENTE

UPDATE FUNCIONARIO SET FUNC_IN_FISCAL =1, FUNC_IN_VENDEDOR = 1 WHERE FUNC_CD IN (320,96,319)

UPDATE FUNCIONARIO SET UNOR_CD = 54 WHERE FUNC_CD IN (96)

SELECT * FROM CHAMADO_ASSUNTO WHERE CHAS_CD IN (
40,
41,
42,
43,
44,
45,
46,
47,
48,
49,
50,
419,
421
)

--16JAN

-- Nota de devolução POSTO IND - APR OLINDA

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%UNILEVER%' --PEGA POCN_CD = 301308
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 133) -- verifica se há mais de um registro com 1
SELECT * FROM CONTRATO_CLIENTE WHERE POCN_CD = 133
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (39095,44201)
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (47765) -- Estava 2

SELECT * FROM ROTA WHERE ROTA_CD IN (133,160)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%MASTERGAS%' --PEGA POCN_CD = 301308

-- Análise GDIS

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE CHAM_CD IN
(
SELECT * FROM CHAMADO WHERE CHPR_CD IN (
SELECT CHPR_CD FROM CHAMADO_PROTOCOLO WHERE CHPR_NR_PROTOCOLO IN (
2312050126
)
)
)
ORDER BY CHAM_CD
42,43
SELECT * FROM UNIDADE_ORGANIZACIONAL WHERE UNOR_CD IN (42,43,45,50,60,47)

SELECT * FROM UNIDADE_ORGANIZACIONAL WHERE UNOR_CD IN (37,44,54)

UPDATE UNIDADE_ORGANIZACIONAL SET UNOR_CD_SUPERIOR = 54 WHERE UNOR_CD = 44

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE CHAM_CD IN
(
141700,
142852,
143585,
135035,
128493,
128927,
117680,
127053,
123578,
119482
) ORDER BY cham_cd

SELECT * FROM CHAMADO WHERE CHPR_CD IN (
SELECT CHPR_CD FROM CHAMADO_PROTOCOLO WHERE CHPR_NR_PROTOCOLO IN (
2312050126
)
) --CHAS_CD = 61, UNOR_CD

SELECT * FROM CHAMADO WHERE CHAS_CD = 61
SELECT * FROM CHAMADO WHERE UNOR_CD = 37 AND CHAM_TM_ULTIMA_ALTERACAO > TO_TIMESTAMP('10/01/2023 11:07:13', 'MM/DD/YYYY HH24:MI:SS') AND CHAM_TM_ULTIMA_ALTERACAO < TO_TIMESTAMP('01/05/2024 11:07:13', 'MM/DD/YYYY HH24:MI:SS')

SELECT * FROM CHAMADO WHERE UNOR_CD = 44 AND CHAM_TM_ULTIMA_ALTERACAO > TO_TIMESTAMP('10/01/2023 11:07:13', 'MM/DD/YYYY HH24:MI:SS') AND CHAM_TM_ULTIMA_ALTERACAO < TO_TIMESTAMP('01/05/2024 11:07:13', 'MM/DD/YYYY HH24:MI:SS')


SELECT * FROM CHAMADO_ASSUNTO WHERE CHAS_CD = 61


SELECT * FROM Chamado WHERE CHAM_CD IN(
SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 45

MINUS

(SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 45
INTERSECT
SELECT CHAM_CD
FROM CHAMADO_UNIDADE_ORGANIZACIONAL
WHERE UNOR_CD = 44)
) ORDER BY CHAM_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 44 ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC





SELECT TICO_CD_DESTINO, TICO_COPC_CD, TICO_CD_OPERACAO, TICO_CD_SITUACAO FROM TI_CONTRATO WHERE TICO_NM_CLIE LIKE '%AURORA DO CAIS%'

UPDATE TI_CONTRATO SET TICO_CD_OPERACAO = 'A', TICO_CD_SITUACAO ='P' WHERE TICO_NM_CLIE LIKE '%%AURORA DO CAIS%%'

SELECT * FROM REGISTRO WHERE TICO_COPC_CD = 206

SELECT * FROM TI_NOTA_FISCAL WHERE TINF_NR = 439691

SELECT * FROM VIEW_TI_CONTRATO_GGAS_PIR WHERE TICO_NM_CLIE LIKE '%ROSANGELA%'

TO_TIMESTAMP('')

  SELECT TO_TIMESTAMP('01/13/2023 11:37:13', 'MM/DD/YYYY HH24:MI:SS') FROM dual;

UPDATE TI_CONTRATO SET TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/17/2024 11:07:13', 'MM/DD/YYYY HH24:MI:SS') where
TICO_COPC_CD IN(
41931,
45904,
44026,
40570,
28542,
21295,
30693)
 
SELECT * FROM TI_CONTRATO where
TICO_COPC_CD IN(
41931,
45904,
44026,
40570,
28542,
21295,
30693)

CONDOMINIO DO EDIFICIO SHOPPING PARK RESIDENCE
CONDOMINIO EDIFICIO DE VILLE
CACULINHA COMBUSTIVEIS LTDA
CRISTIANE PEREIRA JOB
MANOEL RODRIGUES DE ANDRADE FILHO
RAUL JOSE DE BRITO NETO
CONDOMINIO DO EDIFICIO MORADA DO ESPINHEIRO


-- 17JAN

-- Devolução para a NFE 439072

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%VITA RESIDENCIAL CLUB%TORRE DOLCE%APT 0401%' -- 301308

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 238515 --49440 APR OLINDA
UNION
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 261072 --49440 POSTO IND - IGUEP

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 3812) AND CONT_IN_USO = 1 --CONT_VL_VOLUME_REFERENCIA
UNION
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 3007) AND CONT_IN_USO = 1 --CONT_VL_VOLUME_REFERENCIA

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 273600

SELECT * FROM CONTRATO_SITUACAO

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD = 21888
UPDATE CONTRATO SET  WHERE CONT_CD = 50789
UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 47390

--NORTE 01B
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (47568,50028,39736,46463) -- Estava 2

--NORTE 01E
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (50271) -- Estava 2

--SUL 06
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (46030,41128,45970,43307) -- Estava 2

--CENTRO 08
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (44785) -- Estava 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%EDF. ENSEADA - APT 0902%'

UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 46801

UPDATE CONTRATO SET CONT_IN_USO = 0, COSI_CD = 9 WHERE CONT_CD = 45851

SELECT * FROM FATURA WHERE FATU_CD = 784980 -- 49440 45851

-- Anormalidade NORTE 01A

-- Criar consultas para listar mais de uma versão de contrato ativa

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%SANTOS DUMONT%TORRE 07%0102%' --PEGA POCN_CD = 302852 --DATA INSTALAÇÃO E ATIVAÇÃO PARA 02/01/2024 rota_cd 155
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 209792) -- verifica se há mais de um registro com 1

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN(18881,35384)

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%SANTOS DUMONT%TORRE 10%0404%' --PEGA POCN_CD = 302852 --DATA INSTALAÇÃO E ATIVAÇÃO PARA 02/01/2024 rota_cd 155
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 209854) -- verifica se há mais de um registro com 1

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN(18881,35384)

SELECT cpc.copc_cd, ct.clie_nm, REPLACE((C.CONT_DT_ANO || TO_CHAR(C.CONT_NR, '00009')), ' ','' ) AS NUMEROMATRICULA, c.cont_dt_assinatura, PC.POCN_DS, ''''||CPC.COPC_CD||'L''', ''''||C.CLIE_CD_ASSINATURA||'L''', R.ROTA_NR, TC.TICO_NM_CLIE
FROM PONTO_CONSUMO PC 
INNER JOIN CONTRATO_PONTO_CONSUMO CPC ON CPC.POCN_CD = PC.POCN_CD

INNER JOIN CONTRATO C ON C.CONT_CD = CPC.CONT_CD
inner join CLIENTE ct on C.CLIE_CD_ASSINATURA = ct.CLIE_CD
LEFT JOIN TI_CONTRATO TC ON (TC.TICO_COPC_CD = CPC.COPC_CD OR TC.TICO_CD_ORIGEM = C.CONT_CD OR TC.TICO_CONT_PAI_CD = C.CONT_CD_PAI)
left join ti_cliente cl on TC.TICO_CD_CLIENTE = cl.TICL_CD_ORIGEM
INNER JOIN ROTA R ON (R.ROTA_CD = PC.ROTA_CD)
WHERE C.CONT_IN_USO = 1 AND C.COSI_CD = 1 AND ((TC.TICO_CD IS NULL) )

SELECT * FROM TI_CONTRATO WHERE TICO_NM_CLIE LIKE '%ROSANGELA MAGGI%'

UPDATE TI_CONTRATO SET TICO_CD_OPERACAO = 'I', TICO_CD_SITUACAO = 'NP' WHERE TICO_NM_CLIE LIKE '%ROSANGELA MAGGI%'

SELECT * FROM VIEW_TI_CONTRATO_GGAS_PIR WHERE tico_nm_clie LIKE '%JOB%'

SELECT * FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('CRISTIANE PEREIRA JOB')

UPDATE TI_CONTRATO SET TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/23/2024 17:55:13', 'MM/DD/YYYY HH24:MI:SS')  WHERE TICO_CD IN (17251,17453,4035,18005)

-- rosangela maggi de sousa constando como não integrada

-- POSTO IND OLINDA

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%COSTA DAS PALMEIRAS%1004%' --RAAT 6
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252717) -- verifica se há mais de um registro com 1

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO WHERE CONT_NR = 691))

UPDATE CONTRATO SET COSI_CD = 2 WHERE CONT_CD IN(35270)

202300119-NULL (contrato - superior direito) 
	784980
	
SELECT * FROM FATURA WHERE FATU_CD = 784980
UNION
SELECT * FROM FATURA WHERE FATU_CD = 784978

--

UPDATE CONTRATO SET CONT_NR = 119 WHERE CONT_CD = 46801 -- Estava 2079

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 301308) AND CONT_IN_USO = 1
UNION
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 297776) AND CONT_IN_USO = 1

SELECT * FROM CONTRATO WHERE CONT_NR = 2079 -- 1832, 22882, 27459, 27319

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD IN (1832, 22882, 27459, 27319)

301308 -- APR OLINDA
297776       MAMELUCO

posto ind - mameluco - posto ind - mameluco - 
202300117-00 - Fatura 784978 

-- 18JAN

SELECT TICO_CD_DESTINO, TICO_COPC_CD, TICO_CD_OPERACAO, TICO_CD_SITUACAO FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('CRISTIANE PEREIRA JOB')

SELECT * FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('TARCISIO NOGUEIRA DE SOUZA',
'MARIA DA CONCEIÇAO BOUDOUX SILVA')

UPDATE TI_CONTRATO SET TICO_CD_OPERACAO = 'A', TICO_CD_SITUACAO = 'NP', TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/18/2024 16:39:13', 'MM/DD/YYYY HH24:MI:SS') WHERE TICO_NM_CLIE IN
('LAURISTTON MENDES TEIXEIRA DE VASCONCELOS')

UPDATE TI_CONTRATO SET TICO_CD_SITUACAO = 'NP', TICO_DS_ERRO = '', TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/18/2024 09:46:13', 'MM/DD/YYYY HH24:MI:SS')  WHERE TICO_NM_CLIE IN
('TARCISIO NOGUEIRA DE SOUZA',
'MARIA DA CONCEIÇAO BOUDOUX SILVA')

SELECT * FROM VIEW_TI_CONTRATO_GGAS_PIR WHERE TICO_NM_CLIE IN
('%AURORA%')




-- CONSULTA PARA RETORNAR SITUAÇÃO DO CONTRATO POR ROTA

SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN (
select   pocn.pocn_cd
from ponto_consumo pocn
LEFT join contrato_ponto_consumo copc ON pocn.pocn_cd = copc.pocn_cd
LEFT join contrato cont ON copc.cont_cd = cont.cont_cd
inner join contrato_situacao cosi ON cosi.cosi_cd = cont.cosi_cd
where pocn.rota_cd = 106
and cont.cosi_cd <> 1
and cont.cont_in_uso = 1
)

SELECT POCN_CD FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD IN
(
SELECT CONT_CD FROM CONTRATO WHERE CONT_CD IN
(
SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN
(
SELECT POCN_CD FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD IN
(
SELECT CONT_CD FROM CONTRATO WHERE CONT_CD IN
(
SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (
SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 48)
)
)) 
AND COSI_CD <> 1
AND cont_in_uso = 1
)) GROUP BY POCN_CD

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (

)

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 133
SELECT COUNT(*) FROM PONTO_CONSUMO WHERE ROTA_CD = 150
SELECT COUNT(*) FROM IMOVEL WHERE ROTA_CD = 150

SELECT * FROM cliente WHERE clie_nm LIKE '%UNILEVER%' --CLIE_CD = 182
SELECT * FROM CLIENTE_ENDERECO WHERE CLIE_CD = 182

SELECT * FROM ROTA WHERE ROTA_CD = 150 -- 150 N01E 106 N01B 53 S06

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 4397
SELECT * FROM CONTRATO_SITUACAO
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (
4397
)) AND CONT_IN_USO = 1

UPDATE CONTRATO SET COSI_CD = 12 WHERE CONT_CD IN (45651)

SELECT * FROM VIEW_ACOMPANHAMENTO_CRONOGRAMA

SELECT * FROM VIEW_CONTROLE_CHAMADO_GDIS WHERE STATUS_CHAMADO <> 'FINALIZADO'

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD IN (44785
)


Rota Sul01

UPDATE CONTRATO SET COSI_CD = 12 WHERE CONT_CD = 49087 --Estava encerrado POCN_CD = 4458

-- 48439 está 12

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD IN(5941,2995,3007,239110)


UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (28807,37411)


SELECT * FROM PONTO_CONSUMO WHERE ROTA_CD = 47 AND POCS_CD <> 2

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 3687
UNION
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 1835

UPDATE PONTO_CONSUMO SET ENCO_CD_MODALIDADE_USO = 215 WHERE POCN_CD IN (
4994,
6522,
252691,
252686,
252770,
252704
)

4737
19593
19629
18675
286618

SELECT * FROM ponto_consumo WHERE POCN_CD = 19593

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 45)) AND CONT_IN_USO = 1 AND CONT_DT_VENC_OBRIGACOES IS NOT NULL AND COSI_CD = 1 AND CONT_DT_VENC_OBRIGACOES < SYSDATE --49402 situação 2

UPDATE CONTRATO SET CONT_DS = '-' WHERE CONT_CD IN (37346,38468)

SELECT pocn_cd FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 47) AND ENCO_CD_REGIME_CONSUMO IS NULL GROUP BY POCN_CD ORDER BY POCN_CD

SELECT * FROM ENTIDADE_CONTEUDO ORDER BY ENCO_CD

SELECT pocn_cd FROM PONTO_CONSUMO_CITY_GATE WHERE pocn_cd IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 47) ORDER BY pocn_cd

SELECT * FROM rota --48 S01, 45 C10, 47 c12

SELECT * FROM PONTO_CONSUMO_SITUACAO

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%VITA RESIDENCIAL CLUB%TORRE ALLEGRO%APT 1207%' --POCN_CD = 4397
SELECT CONT_CD, COSI_CD, CONT_IN_USO FROM CONTRATO WHERE CONT_CD IN
(SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 4397)

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 4397 -- CONT_CD = 50968

SELECT * FROM contrato WHERE cont_cd IN (SELECT cont_cd FROM CONTRATO_PONTO_CONSUMO WHERE pocn_cd = 3687)


SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 4994) AND CONT_IN_USO = 1 --45653 situação 2
UPDATE CONTRATO SET CONT_IN_USO = 1 WHERE CONT_CD IN (46215)
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252691) AND CONT_IN_USO = 1 --39112 situação 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252686) AND CONT_IN_USO = 1 --48840 situação 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252770) AND CONT_IN_USO = 1 --50015 situação 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252704) AND CONT_IN_USO = 1 --49402 situação 2

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 4737) AND CONT_IN_USO = 1 --51077 situação 2
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (32493,42949)
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 19593) AND CONT_IN_USO = 1 --40833 situação 1 MAS HÁ DATA DE RESCISÃO
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 19629) AND CONT_IN_USO = 1 --48840 situação 1 MAS HÁ DATA DE RESCISÃO
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 18675) AND CONT_IN_USO = 1 --47655 situação 1 MAS HÁ DATA DE RESCISÃO
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 286618) AND CONT_IN_USO = 1 --49673 situação 1 MAS HÁ DATA DE RESCISÃO

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 3687) AND CONT_IN_USO = 1 --46215 situação 2 MAS HÁ DATA DE RESCISÃO

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD = 46215


SELECT * FROM CONTRATO WHERE CONT_CD = 45651

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD = 45651

-- Demandas GCRC
-- VER CONTRATO PONTO DE CONSUMO DA OUTRA SITUAÇÃO -- CONT_CD
SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE UPPER(COEC_DS_EMAIL) LIKE '%COSTA DAS PALMEIRAS%APT 1706%' -- COEC_CD = 85355
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%EDF. COSTA DAS PALMEIRAS%APT 1706%'
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE COPC_CD = 45920
SELECT * FROM contrato WHERE cont_cd = 48821
UPDATE CONTRATO SET COSI_CD = 1, CONT_DT_ASSINATURA = TO_DATE('01/19/2024','MM/DD/YYYY'), CONT_DT_VENC_OBRIGACOES = TO_DATE('01/17/2027','MM/DD/YYYY') WHERE cont_cd = 48821
UPDATE CONTRATO SET CONT_DT_VENC_OBRIGACOES = TO_DATE('01/16/2024','MM/DD/YYYY') WHERE cont_cd = 50860
SELECT * FROM PONTO_CONSUMO WHERE pocn_cd = 313986

UPDATE PONTO_CONSUMO SET POCS_CD = 2 WHERE pocn_cd = 313986
SELECT * FROM PONTO_CONSUMO_SITUACAO

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%APR%OLINDA%' --PEGA POCN_CD = 4815 pocs_cd = 2
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252761) AND CONT_IN_USO = 1
UPDATE CONTRATO SET COSI_CD = 12 WHERE CONT_CD IN (32395)

SELECT * FROM CONTRATO_SITUACAO


-- Nota lauriston

SELECT TICO_CD_DESTINO, TICO_COPC_CD, TICO_CD_OPERACAO, TICO_CD_SITUACAO FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('LAURISTTON MENDES TEIXEIRA DE VASCONCELOS')

SELECT * FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('RAUL JOSE DE BRITO NETO')

UPDATE TI_CONTRATO SET TICO_CD_OPERACAO = 'A', TICO_CD_SITUACAO = 'NP', TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/18/2024 16:39:13', 'MM/DD/YYYY HH24:MI:SS') WHERE TICO_NM_CLIE IN
('LAURISTTON MENDES TEIXEIRA DE VASCONCELOS')

UPDATE TI_CONTRATO SET TICO_CD_SITUACAO = 'NP', TICO_DS_ERRO = '', TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/18/2024 09:46:13', 'MM/DD/YYYY HH24:MI:SS')  WHERE TICO_NM_CLIE IN
('TARCISIO NOGUEIRA DE SOUZA',
'MARIA DA CONCEIÇAO BOUDOUX SILVA')

SELECT * FROM VIEW_TI_CONTRATO_GGAS_PIR WHERE TICO_NM_CLIE IN
('LAURISTTON MENDES TEIXEIRA DE VASCONCELOS')

SELECT TICO_CD_DESTINO, TICO_COPC_CD, TICO_CD_OPERACAO, TICO_CD_SITUACAO FROM TI_CONTRATO WHERE TICO_NM_CLIE LIKE '%AURORA DO CAIS%'

-- Nota APR COMBUSTIVEIS LTDA

SELECT TICO_CD_DESTINO, TICO_COPC_CD, TICO_CD_OPERACAO, TICO_CD_SITUACAO FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('APR COMBUSTIVEIS LTDA')

SELECT * FROM TI_CONTRATO WHERE TICO_NM_CLIE IN
('APR COMBUSTIVEIS LTDA')

UPDATE TI_CONTRATO SET TICO_CD_OPERACAO = 'A', TICO_CD_SITUACAO = 'NP', TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('01/19/2024 08:47:13', 'MM/DD/YYYY HH24:MI:SS') WHERE TICO_NM_CLIE IN
('APR COMBUSTIVEIS LTDA')

SELECT * FROM VIEW_TI_CONTRATO_GGAS_PIR WHERE TICO_NM_CLIE IN
('LAURISTTON MENDES TEIXEIRA DE VASCONCELOS')

SELECT TICO_CD_DESTINO, TICO_COPC_CD, TICO_CD_OPERACAO, TICO_CD_SITUACAO FROM TI_CONTRATO WHERE TICO_NM_CLIE LIKE '%AURORA DO CAIS%'

-- VER CONTRATO PONTO DE CONSUMO DA OUTRA SITUAÇÃO -- CONT_CD
SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE UPPER(COEC_DS_EMAIL) LIKE 'MANOEL.DINIZ@' -- COEC_CD = 85355
SELECT POCN_CD FROM CONTRATO_PONTO_CONSUMO WHERE COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE UPPER(COEC_DS_EMAIL) LIKE '%RECIBOM%')

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE 'AURORA TENORIO HACKER'

SELECT * FROM CLIENTE WHERE CLIE_NM = 'AURORA TENORIO HACKER' --1157
SELECT * FROM CLIENTE_IMOVEL WHERE CLIE_CD = 1157
SELECT * FROM PONTO_CONSUMO WHERE IMOV_CD = 1157

SELE

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD IN (
257631,
257711,
257711,
257712,
291089,
314046
)

UPDATE PONTO_CONSUMO SET POCS_CD = 1 WHERE POCN_CD = 314046

SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE COPC_CD = 47974

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%VETRO%'

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 314046)

UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD = 51016



SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 256491)

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD = 50980
UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD = 50981

SELECT * FROM contrato WHERE cont_cd = 50981
UPDATE CONTRATO SET COSI_CD = 5, CONT_DT_ASSINATURA = TO_DATE('01/19/2024','MM/DD/YYYY'), CONT_DT_VENC_OBRIGACOES = TO_DATE('01/17/2027','MM/DD/YYYY') WHERE cont_cd = 48821
UPDATE CONTRATO SET CONT_DT_VENC_OBRIGACOES = TO_DATE('01/16/2024','MM/DD/YYYY') WHERE cont_cd = 50860
SELECT * FROM PONTO_CONSUMO WHERE pocn_cd = 313986

SELECT * FROM CONTRATO_SITUACAO




--22JAN

--Verificar se houve refaturamento

SELECT * FROM FATURA

SELECT * FROM rota --C07 42, O02A 111, N01B 106

SELECT count(*) FROM PONTO_CONSUMO WHERE ROTA_CD = 106

SELECT count(*) AS QUANTIDADE, POCN_CD FROM FATURA WHERE ROTA_CD = 42 AND FATU_DT_AM_REFERENCIA = 202401 GROUP BY POCN_CD ORDER BY POCN_CD -- C07 818 com FATU_CD, de um total de 1032 pontos de consumo - 43 já pagos

SELECT count(*) AS QUANTIDADE, POCN_CD FROM FATURA WHERE ROTA_CD = 111 AND FATU_DT_AM_REFERENCIA = 202401 GROUP BY POCN_CD ORDER BY POCN_CD -- O02A 802 com FATU_CD - de um total de 1026 pontos de consumo - 128 já pagos

SELECT count(*) AS QUANTIDADE, POCN_CD FROM FATURA WHERE ROTA_CD = 106 AND FATU_DT_AM_REFERENCIA = 202401 GROUP BY POCN_CD ORDER BY POCN_CD -- N01B 779 com FATU_CD - de um total de 782 pontos de consumo - 70 já pagos

--Verificar quantas faturas estão em cada situação
SELECT ENCO_CD_SITUACAO_PAGAMENTO, count(*) quantidade FROM FATURA WHERE ROTA_CD = 106 AND FATU_DT_AM_REFERENCIA = 202401 GROUP BY ENCO_CD_SITUACAO_PAGAMENTO ORDER BY ENCO_CD_SITUACAO_PAGAMENTO -- C07 818 com FATU_CD

SELECT * FROM ENTIDADE_CONTEUDO WHERE ENCO_CD IN (91,111)


-- Maria Clara

CREATE OR REPLACE VIEW VIEW_COLETOR_OBS_ACUM AS
SELECT vco.mes_ano, vco.rota, vco.ponto_consumo, vco.data_leitura, vco.anormalidade, vco.acumulado_medidor_ilegivel, mhc.MEHC_DS AS Comentario, vco.valor_leitura, vco.bloqueia_faturamento, vco.observacao_leiturista
FROM MEDICAO_HISTORICO mehi
LEFT JOIN MEDICAO_HISTORICO_COMENTARIO mhc ON mhc.MEHI_CD = mehi.MEHI_CD
INNER JOIN VIEW_COLETOR_OBSERVACAO vco ON vco.LEMO_CD = mehi.LEMO_CD

CREATE OR REPLACE VIEW VIEW_COLETOR_OBSERVACAO AS 
SELECT
	lm.LEMO_CD AS LEMO_CD,
    lm.lemo_dt_am_faturamento AS mes_ano,
    r.rota_nr AS rota,
    pc.pocn_ds AS ponto_consumo,
    lm.lemo_tm_leitura AS data_leitura,
    la.lean_ds AS anormalidade,
    COUNT(*) OVER (PARTITION BY pc.pocn_ds ORDER BY lm.lemo_tm_leitura) AS Acumulado_medidor_ilegivel,
    
    lm.lemo_md_leitura AS valor_leitura,
    CASE la.lean_in_bloqueia_faturamento 
        WHEN 0 THEN 'NÃO'
        WHEN 1 THEN 'SIM' 
    END AS bloqueia_faturamento,
    lm.lemo_ds_observacao_leitura AS OBSERVACAO_LEITURISTA
FROM
    leitura_movimento lm 
    INNER JOIN ponto_consumo pc ON lm.pocn_cd = pc.pocn_cd
    INNER JOIN rota r ON lm.rota_cd = r.rota_cd
    INNER JOIN leitura_anormalidade la ON lm.lean_cd = la.lean_cd
WHERE
    lm.lemo_in_uso = 1
    AND lm.lems_cd IN (3, 4, 5)
    AND TO_DATE(TO_CHAR(lm.lemo_tm_ultima_alteracao, 'dd/MM/yy'), 'dd/MM/yy') BETWEEN TO_DATE('01/01/23', 'dd/MM/yy') AND TO_DATE('31/12/23', 'dd/MM/yy')
ORDER BY
    lm.lemo_dt_am_faturamento,
    r.rota_nr,
    lm.lemo_nr_sequencia_leitura;
   
   SELECT * FROM VIEW_COLETOR_OBS_ACUM
   
-- Alteração de endereço de cliente
   
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 133
SELECT COUNT(*) FROM PONTO_CONSUMO WHERE ROTA_CD = 150
SELECT COUNT(*) FROM IMOVEL WHERE ROTA_CD = 150

SELECT * FROM cliente WHERE clie_nm LIKE '%UNILEVER%' --CLIE_CD = 182
SELECT * FROM CLIENTE_ENDERECO WHERE CLIE_CD = 182
SELECT * FROM CEP WHERE CEP_CD = 350122

SELECT * FROM TI_CLIENTE_ENDERECO


SELECT CHAS_CD FROM chamado_assunto WHERE UPPER(CHAS_DS) LIKE '%RELIG%'
SELECT * FROM CHAMADO_ASSUNTO_UNIDADE WHERE CHAS_CD IN (SELECT CHAS_CD FROM chamado_assunto WHERE UPPER(CHAS_DS) LIKE '%RELIG%') AND UNOR_CD = 40--UNOR_CD = 40 GADS

SELECT * FROM UNIDADE_ORGANIZACIONAL WHERE UNOR_DS LIKE '%GADS%'

-- 23JAN

-- Situação city gate

Preciso que seja inserido no cadastro do cliente POSTO IND - CAÇULINHA 4 o City Gate a ETC – GARANHUNS,
para que possamos seguir com a medição deste cliente.

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%COSTA DO RIO%' --PEGA POCN_CD = 302852 pocs_cd = 2
union
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%ARLANX%' --PEGA POCN_CD = 4815 pocs_cd = 2 --POCN_CD_SUPERVISORIO

SELECT * FROM CITY_GATE -- CIGA_CD = 15 ETC Garanhuns

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE POCN_CD = 302944

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 302944

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE pocn_cd in (SELECT pocn_cd FROM ponto_consumo WHERE rota_cd = 63) -- Todos NO CIGA_CD = 5 ED-395

SELECT * FROM cep WHERE cep_nr = '50720-590'

SELECT * FROM QUADRA_FACE

SELECT * FROM QUADRA

SELECT * FROM cep WHERE cep_nm_bairro = 'ZUMBI' -- QUAL CG atende

-- Caso do TOP recuperável da NISSIN

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%NISSIN%' --POCN_CD = 1251

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 254530) AND CONT_IN_USO = 1 --CONT_VL_VOLUME_REFERENCIA


-- Caso da alteração da planilha para atender a GDIS

SELECT * FROM CHAMADO_UNIDADE_ORGANIZACIONAL WHERE UNOR_CD = 37 ORDER BY CHUO_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM CHAMADO_HISTORICO

SELECT * FROM USUARIO_SISTEMA WHERE USSI_CD = 63

CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VIEW_CONTROLE_CHAM_MOD" ("PROTOCOLO", "Assunto Chamado", "STATUS_CHAMADO", "CLIENTE", "Data abertura", "Data resolução chamado", "CODIGO_AS", "Tipo Serviço", "STATUS_AS", "Data Execução A.S","DATA ALTERACAO", "USUARIO", "DESCRICAO_CHAMADO") AS 
  select cp.CHPR_NR_PROTOCOLO AS PROTOCOLO, ca.CHAS_DS AS "Assunto Chamado", ec.enco_ds as status_CHAMADO, cl.CLIE_NM as cliente, 
       cp.CHPR_TM_ULTIMA_ALTERACAO as "Data abertura", 
       c.CHAM_DT_RESOLUCAO as "Data resolução chamado", sa.SEAU_CD AS CODIGO_AS,  st.SRTI_DS as "Tipo Serviço", EA.ENCO_DS AS STATUS_AS, sa.SEAU_DT_EXECUCAO as "Data Execução A.S",
       chhi.CHHI_TM_ULTIMA_ALTERACAO AS DATA_ALTERACAO,
       (SELECT USSI_NM_LOGIN FROM USUARIO_SISTEMA WHERE USSI_CD = chhi.USSI_CD) AS USUARIO,
       DBMS_LOB.SUBSTR(c.CHAM_DS, 4000) as Descricao_Chamado/* Ajuste 01.09.21, mas um ajuste  */
from chamado c 
inner join chamado_protocolo cp on c.CHPR_CD = cp.CHPR_CD 
left join servico_autorizacao sa on c.CHAM_CD = sa.CHAM_CD
LEFT join ponto_consumo pc on c.POCN_CD = pc.POCN_CD
LEFT JOIN cliente cl on c.CLIE_CD = cl.CLIE_CD
inner join CHAMADO_ASSUNTO ca on c.CHAS_CD = ca.CHAS_CD
INNER JOIN CHAMADO_HISTORICO chhi ON chhi.CHAM_CD = c.CHAM_CD --Adição em 23JAN
left  join SERVICO_TIPO st on sa.SRTI_CD = st.SRTI_CD
LEFT join quadra_face qf on pc.QUFA_CD = qf.QUFA_CD
LEFT join cep on qf.CEP_CD = cep.CEP_CD
inner join entidade_conteudo ec on c.ENCO_CD_STATUS = ec.enco_cd
LEFT JOIN ENTIDADE_CONTEUDO EA ON sa.ENCO_CD_STATUS = EA.ENCO_CD
LEFT JOIN SERVICO_AUTORIZACAO_MOTIVO_ENC ME ON SA.SEME_CD = ME.SEME_CD
where cp.CHPR_IN_USO = 1 AND ca.CHTI_CD IN (300,301,302,303)
ORDER BY cp.CHPR_NR_PROTOCOLO DESC, chhi.CHHI_TM_ULTIMA_ALTERACAO DESC;



SELECT * FROM CHAMADO_HISTORICO WHERE cham_cd = 

--24JAN

-- Caso do contrato 202200880 - Estava sem endereço

SELECT * FROM CONTRATO WHERE CONT_NR = 880 AND CONT_DT_ANO = 2022 AND CONT_IN_USO = 1 -- verifica se há mais de um registro com 1
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE CONT_CD = 50645 -- POCN_CD = 5574
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 5574 -- EDF. MARIA CECILIA RODRIGUES - APT 0102

SELECT * FROM IMOVEL WHERE IMOV_CD = 5925

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%VEREDA PRINCE%'

UPDATE CONTRATO SET COSI_CD = 2 WHERE CONT_CD IN (45684)

-- Caso Terraço Laguna


SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 6258 -- EDF. MARIA CECILIA RODRIGUES - APT 0102
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 292220) AND CONT_IN_USO = 1 -- verifica se há mais de um registro com 1
SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 6258 -- POCN_CD = 5574

UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (44665)

-- Forçar integração

SELECT * FROM VIEW_TI_CONTRATO_GGAS_PIR

SELECT * FROM TI_CONTRATO WHERE TICO_CD_SITUACAO = 'NP' ORDER BY TICO_TM_ULTIMA_ALTERACAO DESC

UPDATE TI_CONTRATO SET TICO_TM_ULTIMA_ALTERACAO = TO_TIMESTAMP('24/01/2023 14:52:13', 'DD/MM/YYYY HH24:MI:SS') WHERE TICO_CD IN (13706,18005,4035)

-- Caso endereço UNILEVER

SELECT * FROM CEP WHERE CEP_NR = '53420-140' --ESTÁ USANDO CEP_CD = 350503 - ERA PARA SER 350120

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%UNILEVER%'

UPDATE PONTO_CONSUMO SET CEP_CD = 350122 WHERE POCN_CD = 133

SELECT * FROM QUADRA_FACE WHERE QUFA_CD = 

SELECT CEP_CD_ENTREGA FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 133

UPDATE 
SELECT * FROM QUADRA_FACE WHERE QUFA_NR_FACE = '55590000'
55590000

--25JAN

-- Análise problema da BENVINDA DOCERIA - ROTA C22 - PCS NULO

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%BENVINDA DOCERIA%' --21128
UNION
SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 133
UNION 
SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%BLACK ANGUS%' --1597

SELECT * FROM PONTO_CONSUMO_CITY_GATE WHERE POCN_CD = 21128 --CIGA_CD = 5

SELECT * FROM IMOVEL WHERE IMOV_CD = 4846699
UNION 
SELECT * FROM IMOVEL WHERE IMOV_CD =1693

SELECT table_name FROM all_tab_columns WHERE column_name = 'IMPE_CD' --PAVIMENTO_RUA, PADRAO_CONSTRUCAO, IMOVEL_PERFIL

SELECT * FROM MEDIDOR_INSTALACAO WHERE POCN_CD = 21128 --TEM UM CAMPO MEIN_IN_USO

SELECT * FROM LEITURA_MOVIMENTO WHERE POCN_CD = 21128 ORDER BY LEMO_TM_GERACAO DESC -- ULTIMA LEITURA 2024-01-23 08:56

SELECT * FROM MEDICAO_HISTORICO WHERE POCN_CD = 21128 ORDER BY MEHI_TM_PROCESSAMENTO DESC --MEHI_TM_PROCESSAMENTO 24-01-2024 ÀS 07:50 DATA E HORA DO PROCESSAMENTO DE LEITURA

SELECT *
FROM (
    SELECT *
    FROM MEDICAO_HISTORICO
    WHERE POCN_CD = 254410
    ORDER BY MEHI_TM_PROCESSAMENTO DESC
)
WHERE ROWNUM <= 1;

SELECT * FROM PONTO_CONSUMO WHERE POCN_CD = 254410

SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 76

SELECT * FROM MEDICAO_CITY_GATE WHERE CIGA_CD = 5 ORDER BY MECG_TM_ULTIMA_ALTERACAO DESC

SELECT * FROM CITY_GATE WHERE CIGA_CD = 5

SELECT * FROM ROTA

-- CONSULTA PARA VERIFICAR O ÚLTIMO REGISTRO DE MEHI PARA TODOS OS PONTOS DE UMA ROTA

-- 21128 ESTAVA COM MEHI_NR_VERSAO = 2

SELECT mh.*
FROM MEDICAO_HISTORICO mh
INNER JOIN PONTO_CONSUMO pc ON pc.POCN_CD = mh.POCN_CD
WHERE MEHI_DT_AM_LEITURA = 202401
AND pc.ROTA_CD = 115
AND LEIT_CD IS NULL
ORDER BY mh.POCN_CD

-- Tem um campo MEHI_IN_ANALISADA

SELECT POCN_DS
FROM PONTO_CONSUMO
WHERE POCN_CD IN
(SELECT mh.POCN_CD
FROM MEDICAO_HISTORICO mh
INNER JOIN PONTO_CONSUMO pc ON pc.POCN_CD = mh.POCN_CD
WHERE MEHI_DT_AM_LEITURA = 202401
AND pc.ROTA_CD = 76
AND LEIT_CD IS NULL)

--LEIT_CD NULL = POCN_CD 214717, 236290, 262151, 206962, 254130,255471,278463,278420,295697,298790,292147,288799


-- VIEW Cirilo

CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VIEW_CONTROLE_CONSUMO_DIARIO2" ("SEGMENTO", "RAMO_ATIVIDADE", "PONTO_CONSUMO", "LEITURA_INICIAL", "LEITURA_FINAL", "CONSUMO_DIA", "DATA_LEITURA", "CONSUMO_PTZ", "CONSUMO_FATURADO", "VENCIMENTO_OBRIGACOES") AS 
  select s.segm_ds as segmento, ra.raat_ds as ramo_atividade, pc.pocn_ds as ponto_consumo, 
  smh00.sumh_md_leitura_corrigida as leitura_inicial, smh23.sumh_md_leitura_corrigida as leitura_final,   (smh23.sumh_md_leitura_corrigida-smh00.sumh_md_leitura_corrigida) as consumo_dia,
  TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY') as data_leitura,
  ch.cohi_md_consumo_medido as consumo_ptz, ch.cohi_md_consumo_apurado as consumo_faturado,
  vcvc.CONT_DT_VENC_OBRIGACOES AS VENCIMENTO_OBRIGACOES
from ponto_consumo pc 
inner join super_medicao_horaria smh00 on pc.pocn_cd_supervisorio = smh00.sumh_cd_supervisorio and to_char(EXTRACT(HOUR FROM smh00.sumh_tm_leitura)) = '23'
inner join super_medicao_horaria smh23 on pc.pocn_cd_supervisorio = smh23.sumh_cd_supervisorio and to_char(EXTRACT(HOUR FROM smh23.sumh_tm_leitura)) = '23' 
                             and TO_CHAR(smh00.sumh_tm_leitura+1, 'DD/MM/YYYY') = TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY')
inner join ramo_atividade ra on pc.raat_cd = ra.raat_cd
inner join segmento s on ra.segm_cd = s.segm_cd
INNER JOIN VIEW_CONTRATOS_VIGENCIA_CD vcvc ON vcvc.POCN_CD = pc.POCN_CD
INNER JOIN contrato_ponto_consumo cpc ON cpc.POCN_CD = pc.POCN_CD
inner join periodicidade p on ra.peri_cd = p.peri_cd
left join super_medicao_diaria smd on pc.pocn_cd_supervisorio = smd.sumd_cd_supervisorio 
      and TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY') = TO_CHAR(smd.sumd_tm_leitura, 'DD/MM/YYYY') and smd.sumd_in_uso = 1
left join medicao_historico mh on pc.pocn_cd = mh.pocn_cd and TO_CHAR(smh00.sumh_tm_leitura, 'DD/MM/YYYY') = TO_CHAR(mh.mehi_tm_leitura_informada , 'DD/MM/YYYY') and mh.mehi_in_uso = 1
left join consumo_historico ch on pc.pocn_cd = ch.pocn_cd and mh.mehi_cd = ch.mehi_cd_atual and ch.cohi_in_uso = 1
where p.peri_ds = 'SEMANAL' AND smh00.sumh_in_uso = 1 AND smh23.sumh_in_uso = 1
and pc.rota_cd <> 153
and TO_CHAR(smh00.sumh_tm_leiturA, 'DD/MM/YYYY') >= '01/06/23' -- AND pc.pocn_ds like '%CBVP%'
order by pc.pocn_ds, TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY'); --3m 49s

SELECT * FROM VIEW_CONTROLE_CONSUMO_DIARIO2


CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VIEW_CONTRATOS_VIGENCIA_CD" ("NUMEROMATRICULA", "CLIENTE", "POCN_CD", "SEGMENTO", "RAMO_ATIVIDADE", "CONT_DT_ASSINATURA", "CONT_DT_VENC_OBRIGACOES", "ROTA") AS 
  select REPLACE((C.CONT_DT_ANO || TO_CHAR(C.CONT_NR, '00009')), ' ','' ) AS NUMEROMATRICULA, 
       cl.CLIE_NM AS CLIENTE, pc.POCN_CD AS POCN_CD,
       s.SEGM_DS as SEGMENTO, ra.RAAT_DS AS RAMO_ATIVIDADE,
       c.CONT_DT_ASSINATURA, c.CONT_DT_VENC_OBRIGACOES, r.rota_nr as Rota
from contrato c 
inner join cliente cl on  c.CLIE_CD_ASSINATURA = cl.CLIE_CD
inner join contrato_ponto_consumo cpc on c.cont_cd = cpc.CONT_CD
inner join ponto_consumo pc on cpc.POCN_CD = pc.POCN_CD
inner join SEGMENTO s on pc.SEGM_CD = s.SEGM_CD
inner join RAMO_ATIVIDADE ra on pc.RAAT_CD = ra.RAAT_CD
left join rota r on pc.rota_cd = r.rota_cd
WHERE CONT_IN_USO = 1 AND COSI_CD = 1 and pc.RAAT_CD in ('2', '3', '4', '5', '6', '7', '8', '9', '10');

SELECT * FROM contrato_ponto_consumo

SELECT table_name, column_name FROM ALL_TAB_COLS WHERE column_name LIKE '%CONT_DT_VENC_OBRIGACOES%'

SELECT * FROM VIEW_CONTRATOS_VIGENCIA

SELECT CONT_DT_VENC_OBRIGACOES FROM contrato WHERE CONT_IN_USO = 1




CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VIEW_CONTROLE_CONSUMO_DIARIO" ("SEGMENTO", "RAMO_ATIVIDADE", "PONTO_CONSUMO", "LEITURA_INICIAL", "LEITURA_FINAL", "CONSUMO_DIA", "DATA_LEITURA", "CONSUMO_PTZ", "CONSUMO_FATURADO") AS 
  select s.segm_ds as segmento, ra.raat_ds as ramo_atividade, pc.pocn_ds as ponto_consumo, 
  smh00.sumh_md_leitura_corrigida as leitura_inicial, smh23.sumh_md_leitura_corrigida as leitura_final,   (smh23.sumh_md_leitura_corrigida-smh00.sumh_md_leitura_corrigida) as consumo_dia,
  TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY') as data_leitura,
  ch.cohi_md_consumo_medido as consumo_ptz, ch.cohi_md_consumo_apurado as consumo_faturado
from ponto_consumo pc 
inner join super_medicao_horaria smh00 on pc.pocn_cd_supervisorio = smh00.sumh_cd_supervisorio and to_char(EXTRACT(HOUR FROM smh00.sumh_tm_leitura)) = '23'
inner join super_medicao_horaria smh23 on pc.pocn_cd_supervisorio = smh23.sumh_cd_supervisorio and to_char(EXTRACT(HOUR FROM smh23.sumh_tm_leitura)) = '23' 
                             and TO_CHAR(smh00.sumh_tm_leitura+1, 'DD/MM/YYYY') = TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY')
inner join ramo_atividade ra on pc.raat_cd = ra.raat_cd
inner join segmento s on ra.segm_cd = s.segm_cd 
inner join periodicidade p on ra.peri_cd = p.peri_cd
left join super_medicao_diaria smd on pc.pocn_cd_supervisorio = smd.sumd_cd_supervisorio 
      and TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY') = TO_CHAR(smd.sumd_tm_leitura, 'DD/MM/YYYY') and smd.sumd_in_uso = 1
left join medicao_historico mh on pc.pocn_cd = mh.pocn_cd and TO_CHAR(smh00.sumh_tm_leitura, 'DD/MM/YYYY') = TO_CHAR(mh.mehi_tm_leitura_informada , 'DD/MM/YYYY') and mh.mehi_in_uso = 1
left join consumo_historico ch on pc.pocn_cd = ch.pocn_cd and mh.mehi_cd = ch.mehi_cd_atual and ch.cohi_in_uso = 1
where p.peri_ds = 'SEMANAL' AND smh00.sumh_in_uso = 1 AND smh23.sumh_in_uso = 1
and pc.rota_cd <> 153
and TO_CHAR(smh00.sumh_tm_leiturA, 'DD/MM/YYYY') >= '01/06/23' -- AND pc.pocn_ds like '%CBVP%'
order by pc.pocn_ds, TO_CHAR(smh23.sumh_tm_leitura, 'DD/MM/YYYY'); --1m20

--29JAN

-- Caso dos contratos GCRC

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%A SERTANEJA%'
UPDATE PONTO_CONSUMO SET POCS_CD = 2 WHERE POCN_CD = 309325
SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 310906
SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 309325) AND CONT_IN_USO = 1 -- verifica se há mais de um registro com 1
SELECT * FROM CONTRATO_SITUACAO

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 310906)



202301239


UPDATE CONTRATO SET COSI_CD = 1 WHERE CONT_CD IN (48779)
UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (37565)

-- GRANTS

SELECT grantee, privilege
FROM dba_tab_privs
WHERE table_name = 'PONTO_CONSUMO';

-- Impossibilidade de criar chamados para contratos inativos

--201604718 2401240274 e 201604566 deve-se setar um dos contratos como "em uso"

SELECT * FROM CONTRATO WHERE CONT_NR = 4566 AND cont_in_uso= 1
UNION
SELECT * FROM CONTRATO WHERE CONT_NR = 4718 AND cont_in_uso= 1

SELECT * FROM CONTRATO_SITUACAO

UPDATE CONTRATO SET CONT_IN_USO = 1 WHERE CONT_CD = 28792
UPDATE CONTRATO SET COSI_CD = 2 WHERE CONT_CD = 50983 --COSI_CD = 2 previamente

--30JAN

-- Caso logradouro - Feita a inserção no banco, diretamente

SELECT * FROM CEP ORDER BY CEP_CD DESC

SELECT * FROM CEP WHERE CEP_NR = '53421-140' ORDER BY CEP_CD DESC --Mais novo 351241

SELECT * FROM QUADRA_FACE WHERE CEP_CD = 16606

SELECT * FROM CEP_TIPO

INSERT INTO CEP (CEP_CD,CEP_NR,CEP_SG_UF,CEP_NM_MUNICIPIO,CEP_NM_BAIRRO,CEP_NM_LOGRADOURO,CEP_DS_TIPO_LOGRADOURO,CETI_CD,CEP_NR_VERSAO,CEP_IN_USO,CEP_TM_ULTIMA_ALTERACAO,MUNI_CD) VALUES (351242,'55590-000','PE','IPOJUCA','PORTO DE GALINHAS','LOT. MEREPE I, QD. E2 LOT. 01','LOTEAMENTO',71,0,1,sysdate,80)

INSERT INTO CEP (CEP_CD,CEP_NR,CEP_SG_UF,CEP_NM_MUNICIPIO,CEP_NM_BAIRRO,CEP_NM_LOGRADOURO,CEP_DS_TIPO_LOGRADOURO,CETI_CD,CEP_NR_VERSAO,CEP_IN_USO,CEP_TM_ULTIMA_ALTERACAO,MUNI_CD) VALUES (351243,'53420-140','PE','PAULISTA','JAGUARIBE','ROD BR 101 NORTE','RODOVIA',2,0,1,sysdate,123)

SELECT * FROM CITY_GATE cg 

SELECT * FROM QUADRA

INSERT INTO QUADRA (QUAD_CD,SECO_CD,QUPE_CD,ARTI_CD,QUAD_NR_VERSAO,QUAD_IN_USO,QUAD_TM_ULTIMA_ALTERACAO,QUAD_NR_QUADRA) VALUES (351343,1,1,1,0,1,SYSDATE,'53420140')

SELECT * FROM FACE_Q

SELECT * FROM PONTO_CONSUMO WHERE POCN_DS LIKE '%FRICON%'

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT * FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 314069)

SELECT * FROM AREA_TIPO

SELECT * FROM SETOR_COMERCIAL

SELECT * FROM MUNICIPIO WHERE MUNI_CD LIKE '%PAULIS%'

SELECT * FROM QUADRA_FACE WHERE QUFA_NR_FACE = '53421140' ORDER BY QUAD_CD

SELECT * FROM QUADRA WHERE QUAD_CD IN(
350008,
350118
)

--INSERT INTO QUADRA (QUAD_CD,SECO_CD,QUPE_CD,ARTI_CD,QUAD_NR_VERSAO,QUAD_IN_USO,QUAD_TM_ULTIMA_ALTERACAO,QUAD_NR_QUADRA) VALUES (351342,1,1,1,0,1,sysdate,'55590000')

--INSERT INTO QUADRA_FACE (QUFA_CD,QUAD_CD,QUFA_NR_FACE,CEP_CD, QUFA_IN_REDE,REDS_CD,QUFA_NR_VERSAO,QUFA_IN_USO,QUFA_TM_ULTIMA_ALTERACAO) VALUES (3350306,351342,'55590000',351242,1,52,0,1,sysdate)


SELECT * FROM QUADRA WHERE QUAD_NR_QUADRA = '55590000'

SELECT * FROM CEP_TIPO

SELECT DBMS_METADATA.GET_DDL('TABLE', 'CEP') AS DDL
FROM DUAL;

SELECT * FROM CONTRATO_PONTO_CONS_EMAIL_COBR WHERE COPC_CD IN (SELECT COPC_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE pocn_ds LIKE '%OWENS%')) AND UPPER(COEC_DS_EMAIL) LIKE 'CONTATO@EV%'

SELECT DISTINCT PERI_CD FROM CONTRATO_PONTO_CONSUMO

SELECT * FROM PERIODICIDADE

SELECT * FROM segmento WHERE segm_cd in (1,2,3,4)














CREATE OR REPLACE FORCE VIEW "GGAS_ADMIN"."VW_DADOS_INADIMPLENCIA3" AS 
select
REPLACE((C.CONT_DT_ANO || TO_CHAR(C.CONT_NR, '00009')), ' ','' ) AS MATRICULA
,cl.clie_cd AS ID
,CL.CLIE_NM AS RAZAOSOCIAL
,PC.POCN_DS AS APELIDO
,(CASE CL.CLTI_CD WHEN 1 THEN CL.CLIE_NR_CPF ELSE CL.CLIE_NR_CNPJ END) AS CNPJ
,LISTAGG( email.coec_ds_email, '; ' ) WITHIN GROUP ( ORDER BY ((C.CONT_DT_ANO||LPAD(c.CONT_NR,5,0)))) AS EMAIL
,LISTAGG( '(' || fone.CLFO_CD_DDD || ') ' || fone.CLFO_NR, ', ' ) WITHIN GROUP ( ORDER BY ((C.CONT_DT_ANO||LPAD(c.CONT_NR,5,0)))) AS TELEFONE
,S.SEGM_DS SEGMENTO
,CEP_PC.CEP_DS_TIPO_LOGRADOURO || ' ' || CEP_PC.CEP_NM_LOGRADOURO AS ENDERECO
,(CASE CPC.COPC_NR_IMOVEL WHEN 'S/N' THEN '0' ELSE CPC.COPC_NR_IMOVEL END) AS NUMERO
,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CPC.COPC_DS_COMPLEMENTO_ENDERECO, 'TORRE', 'TR'),'BLOCO','BL'),' - ',' '),'  ',' '),'BLOC','BL') AS COMPLEMENTO
,CEP_PC.CEP_NM_BAIRRO AS BAIRRO
,CEP_PC.CEP_NR CEP
,CEP_PC.CEP_SG_UF ESTADO
,'Brasil' AS PAIS
,c.COSI_CD STATUSCLIENTE
,(case cpc.peri_cd when 4 then 'DIARIA' when 6 then 'DIARIA' else 'MENSAL' end) as FORMAMEDICAO

,(CASE WHEN (C.CLIE_CD_ASSINATURA <= 8000 AND C.CONT_NR < 7550)
/*CLIENTE MIGRADOS DO UNIGAS*/ THEN C.CONT_NR ELSE CL.CLIE_CD END) AS IDCLIENTEMESTRE

,CL.CLIE_NM AS APELIDOCLIENTEMESTRE
,RAAT.RAAT_DS AS PERFILFATURAMENTO
,PC.RAAT_CD AS IDPERFILFATURAMENTO
,case RAAT.RAAT_DS
    when 'COM - Geração / Climatização' then 'Gás Cogeração'
    when 'COM - Pequenos Volumes'  then 'Gás Comercial'
    WHEN 'COM - Grandes Volumes' then 'Gás Comercial'
    when 'IND - Pequenos Volumes' then 'Gás Combustível'
    when 'RES - Medição Coletiva' THEN 'Gás Residencial'
    when 'RES - Medição Individual' THEN 'Gás Residencial'
end as PRODUTO
,'N/A' AS TIPOTELEFONE

FROM CONTRATO_PONTO_CONSUMO CPC
INNER JOIN CONTRATO_PONTO_CONS_ITEM_FATUR CIF ON CPC.COPC_CD = CIF.COPC_CD
INNER JOIN CONTRATO C ON CPC.CONT_CD = C.CONT_CD
INNER JOIN PONTO_CONSUMO PC ON CPC.POCN_CD = PC.POCN_CD
INNER JOIN CLIENTE CL ON C.CLIE_CD_ASSINATURA = CL.CLIE_CD
INNER JOIN SEGMENTO S ON PC.SEGM_CD = S.SEGM_CD
INNER JOIN CEP CEP_PC ON CPC.CEP_CD_ENTREGA = CEP_PC.CEP_CD
INNER JOIN MUNICIPIO MUN_PC ON CEP_PC.MUNI_CD = MUN_PC.MUNI_CD
left JOIN CLIENTE_ENDERECO CL_END ON CL.CLIE_CD = CL_END.CLIE_CD AND CL_END.CLEN_IN_PRINCIPAL = 1
INNER JOIN CEP CEP_CL ON CL_END.CEP_CD = CEP_CL.CEP_CD
INNER JOIN MUNICIPIO MUN_CL ON CEP_CL.MUNI_CD = MUN_CL.MUNI_CD
INNER JOIN IMOVEL IMOV ON IMOV.IMOV_CD=PC.IMOV_CD
LEFT JOIN CLIENTE_FONE FONE ON CL.CLIE_CD = FONE.CLIE_CD
left join CONTRATO_PONTO_CONS_EMAIL_COBR email on cpc.COPC_CD = email.COPC_CD  AND email.COEC_DS_EMAIL not in ('tesouraria@copergas.com.br', 'geti.copergas@gmail.com')
inner join ramo_atividade raat on pc.raat_cd = raat.raat_cd
LEFT join contrato cpai on c.cont_cd_pai = cpai.cont_cd
left join contrato_ponto_consumo cpcpai on c.cont_cd_pai = cpcpai.cont_cd
left join CONTRATO_PONTO_CONS_ITEM_FATUR cifpai on cpcpai.copc_cd = cifpai.copc_cd


WHERE C.CONT_IN_USO=0
--AND C.COSI_CD IN (1, 2)
--AND CPC.PERI_CD IN (1, 2, 3)
-- ALTERADO EM 15/06/2023 POIS OS CLIENTES INDUSTRIAIS E VEICULARES NÃO ESTAVAM SENDO APRESENTADOS
--AND PC.RAAT_CD IN (1,2,3,4,5)
and pc.segm_cd in (1,2,3,4)
and ((c.COPC_CD_PRINCIPAL = CPC.COPC_CD and c.CONT_IN_AGRUPAMENTO_COBRANCA = 1) or (c.CONT_IN_AGRUPAMENTO_COBRANCA in (NULL, 0))) /*exibindo contratos principais quando agrupados e os não agrupados*/
--and FONE.foti_cd in (1) /* Celular */
group by
REPLACE((C.CONT_DT_ANO || TO_CHAR(C.CONT_NR, '00009')), ' ','' ), '', CL.CLIE_NM, PC.POCN_DS
,(CASE CL.CLTI_CD WHEN 1 THEN CL.CLIE_NR_CPF ELSE CL.CLIE_NR_CNPJ END)
,S.SEGM_DS, CEP_PC.CEP_DS_TIPO_LOGRADOURO || ' ' || CEP_PC.CEP_NM_LOGRADOURO
,(CASE CPC.COPC_NR_IMOVEL WHEN 'S/N' THEN '0' ELSE CPC.COPC_NR_IMOVEL END)
,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CPC.COPC_DS_COMPLEMENTO_ENDERECO, 'TORRE', 'TR'),'BLOCO','BL'),' - ',' '),'  ',' '),'BLOC','BL')
,CEP_PC.CEP_NM_BAIRRO,CEP_PC.CEP_NR,CEP_PC.CEP_SG_UF, '', c.COSI_CD
,(case cpc.peri_cd when 4 then 'DIARIA' when 6 then 'DIARIA' else 'MENSAL' end)
,raat.RAAT_DS
,raat.raat_cd
,PC.RAAT_CD

,(CASE WHEN (C.CLIE_CD_ASSINATURA <= 8000 AND C.CONT_NR < 7550 )
/*CLIENTE MIGRADOS DO UNIGAS*/ THEN C.CONT_NR ELSE CL.CLIE_CD END)
,cl.clie_cd;


--PROBLEMAS NA C10, C12 E S01

SELECT * FROM ponto_consumo WHERE POCN_CD = 19593

SELECT * FROM CLIENTE WHERE CLIE_CD IN (SELECT CLIE_CD FROM CONTRATO_CLIENTE WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 45)) AND CONT_IN_USO = 1 AND CONT_DT_VENC_OBRIGACOES IS NOT NULL AND COSI_CD = 1 AND CONT_DT_VENC_OBRIGACOES < SYSDATE)) --49402 situação 2

UPDATE CLIENTE SET CLSI_CD = 1 WHERE CLIE_CD IN (251526,252395)

--HAVIA DOIS COM CLSI_CD = NULL E DOIS SEM E-MAIL

SELECT * FROM CLIENTE_SITUACAO cs 

UPDATE CONTRATO SET CONT_DS = '-' WHERE CONT_CD IN (37346,38468)

SELECT pocn_cd FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 47) AND ENCO_CD_REGIME_CONSUMO IS NULL GROUP BY POCN_CD ORDER BY POCN_CD

SELECT * FROM ENTIDADE_CONTEUDO ORDER BY ENCO_CD

SELECT pocn_cd FROM PONTO_CONSUMO_CITY_GATE WHERE pocn_cd IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 47) ORDER BY pocn_cd

SELECT * FROM rota --48 S01, 45 C10, 47 c12

--31JAN

--Problemas de faturamento

SELECT * FROM CONSUMO_HISTORICO WHERE POCN_CD IN (SELECT POCN_CD FROM PONTO_CONSUMO WHERE ROTA_CD = 45) AND COHI_DT_AM_FATURAMENTO = 202401 AND COHI_NR_CICLO = 1  ORDER BY POCN_CD

select pc.pocn_cd, pc.pocn_ds, pcs.pocs_ds as situacao_ponto_consumo, cs.cosi_ds as situacao_contrato, c.cont_dt_assinatura, mh.mehi_tm_leitura_informada, mh.mehi_cd, mh.mehi_in_uso, 
ch.cohi_cd, ch.mehi_cd_atual, ch.cohi_md_consumo_apurado, ch.cohi_in_uso, ch.cohi_in_faturamento, ch.coan_cd, ca.coan_ds as anormalidade_consumo,
f.fatu_cd, f.fatu_vl_total from ponto_consumo pc
inner join medicao_historico mh on pc.pocn_cd = mh.pocn_cd
inner join ponto_consumo_situacao pcs on pc.pocs_cd = pcs.pocs_cd
left join consumo_historico ch on pc.pocn_cd = ch.pocn_cd and mh.mehi_dt_am_leitura = ch.cohi_dt_am_faturamento and mh.mehi_nr_ciclo = ch.cohi_nr_ciclo
left join consumo_anormalidade ca on ch.coan_cd = ca.coan_cd
left join fatura f on f.pocn_cd = pc.pocn_cd and mh.mehi_dt_am_leitura = f.fatu_dt_am_referencia and mh.mehi_nr_ciclo = f.fatu_nr_ciclo
inner join contrato_ponto_consumo cpc on pc.pocn_cd = cpc.pocn_cd
inner join contrato c on cpc.cont_cd = c.cont_cd
inner join contrato_situacao cs on c.cosi_cd= cs.cosi_cd
where pc.rota_cd = 45 and mh.mehi_dt_am_leitura = 202401 and c.cont_in_uso = 1 and cohi_md_consumo_apurado > 0 and ch.cohi_in_uso = 1

SELECT * FROM CONTRATO WHERE CONT_CD IN (SELECT CONT_CD FROM CONTRATO_PONTO_CONSUMO WHERE POCN_CD = 252677)

UPDATE CONTRATO SET CONT_IN_USO = 0 WHERE CONT_CD IN (
27991,
34131,
36814,
39927,
39928,
46579
)

POCN_CD IN (5507,5746,5800,6718)

