
VIEW_ANALISE_TESTE
(select t.status, t.cliente, c.nome as Nome_cliente, p.cod_cgc_cpf, T.TITULO, t.nosso_numero, t.cod_referencia, t.emissao, t.vencimento, t.dat_competencia, t.valor, c.fone_cob, E."ID",
       c.endereco_cob, c.end_numero_cob as num_cliente, c.dsc_complemento_cob, c.bairro_cob, c.cod_cob as cep_cliente, ci.dsc_municipio as cidade_cliente, ci.cod_uf as uf_cliente
from titulo_rec t
inner join clientes c on t.cliente = c.codigo
inner join pessoa p on c.codigo = p.codigo
inner join pir_municipio ci on c.cod_municipio_cob = ci.cod_municipio
left outer join copergas.VW_EMAILS_CLIENTE@DBL_PIR_UNG E on t.cliente=E.ID
where t.status in ('A','P'))

 --nesse caso, tem dblink. Sim... essas três fazem uso de dblink

GRANT SELECT ON "PIRAMIDE"."TI_DOC_REC_INTEG_NOSUMERO_DUP" TO "USUARIOPIRAMIDE";

VIEW_ANALISE_INADIMPLENCIA_APP


GRANT SELECT ON "PIRAMIDE"."piramide.VIEW_ANALISE_INADIMPLENCIA_APP" TO "USUARIOPIRAMIDE";

--Como estamos com o usuário piramide, talvez ele não possa conceder o acesso. Vou refazer a conexão com o sys

exclui essa VIEW tb, pelo q vi lá NO erro, só tem essas duas

beleza. Um min

SELECT text FROM all_views WHERE view_name = 'VIEW_ANALISE_TESTE'

--ok

--essas views são de acesso ao dblink naõ?

só vendo o SQL das views... tem views de views... então só expandindo até a raiz para ver...

mas o dblink vcs usam na base teste? Sim. E ainda que não utilizássemos na base de teste, utilizamos em Produção... e vamos atualizar em produção em seguida...

desativar o dblink então

cria novamente AS views

e vamos desabilitar o dblink e depois habilitar quando terminar

nesse caso, não tenho permissão para fazer isso nesse momento. Os dblinks são utilizados em produção também e estamos em pleno fim de mês... não posso desabilitar sem avisar com muita antecedência


não, é em teste não é em produção



sim, entendi. Mas é utilizado também em produção. Terei que ver como desativar apenas em testes... nunca vi o procedimento





SELECT db_link FROM ALL_DB_LINKS;

deve se esse ai

o GGAS e o UNG


select * from pir_conf_integracao WHERE IND_INTEGRACAO_ATIVA = 'N'

UPDATE PIR_CONF_INTEGRACAO SET IND_INTEGRACAO_ATIVA = 'S' WHERE COD_CONFIGURACAO = '00000065' OR COD_CONFIGURACAO = '00000094'

select * from pir_migracao_conf_integra WHERE IND_ATIVA = 'S'


GRANT CREATE job TO piramide
SELECT * FROM PIRAMIDE.PIR_MIGRACAO_CONF_INTEGRA WHERE ind_ativa = 'S';--00000065, 00000094

UPDATE piramide.PIR_MIGRACAO_CONF_INTEGRA SET ind_ativa = 'N'; COMMIT;

-- Olha uma coisa na declaração da view... o pessoal tentou dar os grant no corpo da declaração, após o select

vamos CREATE OR REPLACE novamente, sem os GRANT... talvez o migrador esteja lendo toda a declaração salva
DROP VIEW 

- veja que o erro foi em outra VIEW

-- essa integração UNG não está funcionando aqui

-- pelo que o pessoal falou aqui, tem algum mal funcionamento dos dblink em testes

teria que rever esse dblink ai

-- beleza


-- de qualquer forma, veja que o que impactou não rodar o migrador no caso da última, foi a declaração de grants no corpo da view (após select). Talvez no caso dessa nova view, seja coisa similar... o migrador, a princípio não rodaria nada para tester os dblink, correto?

--ele só está parando pq não consegue compilar a view e dar o privilegio pra ela
-- sim... pode não ter privilégio para dar possíveis grants, como no caso da última, não acha?


SELECT * FROM view_cliente@DBL_PIR_UNG;
CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" ("COD_CLIENTE", "SEGMENTO", "CLIENTE", "UNIDADE_CONSUMIDORA") AS 
  SELECT p.CODIGO AS COD_CLIENTE,
(CASE u."Segmento"
  WHEN 'ABRASIVOS' THEN 'INDUSTRIAL'
  WHEN 'ALIMENTOS' THEN 'INDUSTRIAL'
  WHEN 'ARTEFATOS DE CONCRETO' THEN 'INDUSTRIAL'
  WHEN 'BEBIDAS' THEN 'INDUSTRIAL'
  WHEN 'CERÂMICA BRANCA' THEN 'INDUSTRIAL'
  WHEN 'COGERAÇÃO' THEN 'INDUSTRIAL'
  WHEN 'DIST ENERGIA ELÉTRICA' THEN 'INDUSTRIAL'
  WHEN 'GNC - GÁS NATURAL COMPRIMIDO' THEN 'INDUSTRIAL'
  WHEN 'METALÚRGICO' THEN 'INDUSTRIAL'
  WHEN 'MINERAIS NÃO METÁLICOS' THEN 'INDUSTRIAL'
  WHEN 'OUTROS' THEN 'INDUSTRIAL'
  WHEN 'PAPEL E CELULOSE' THEN 'INDUSTRIAL'
  WHEN 'QUIMICO / PETROQUIMICO' THEN 'INDUSTRIAL'
  WHEN 'SIDERÚRGICO' THEN 'INDUSTRIAL'
  WHEN 'TÊXTIL' THEN 'INDUSTRIAL'
  WHEN 'VIDRO' THEN 'INDUSTRIAL'
  WHEN 'AUTOMOBILISTICO' THEN 'INDUSTRIAL'
  WHEN 'COMERCIAL' THEN 'COMERCIAL'
  WHEN 'VEICULAR' THEN 'GNV'
  WHEN 'RESIDENCIAL' THEN 'RESIDENCIAL'
  WHEN 'MATERIA PRIMA' THEN 'INDUSTRIAL'
  WHEN 'AUTOPRODUTOR' THEN 'AUTOPRODUTOR'
  WHEN 'TERMOELETRICA' THEN 'TERMOELETRICA'
END) AS SEGMENTO, 
u."RazaoSocial" AS CLIENTE, u."Apelido" AS UNIDADE_CONSUMIDORA
FROM CLIENTES p
INNER JOIN dbo.view_cliente@DBL_PIR_UNG u
ON CAST(p.CODIGO AS NCHAR(100)) = CAST(u."Id" AS NCHAR(100))
 ;



CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_INTEGR_UNG_TI_CLIENTE" ("COD_CLIENTE_ORIGEM", "COD_OPERACAO_REGISTRO", "NOM_FANTASIA_CLIENTE", "COD_STATUS_REGISTRO", "DSC_ERRO_REGISTRO") AS 
  SELECT cod_cliente_origem, cod_operacao_registro, nom_fantasia_cliente, 
cod_status_registro, dsc_erro_registro FROM TI_CLIENTE@dbl_pir_ung 
WHERE COD_STATUS_REGISTRO in ('ER', 'NP') 
GROUP BY cod_cliente_origem, cod_operacao_registro, nom_fantasia_cliente, 
cod_status_registro, dsc_erro_registro
ORDER BY DSC_ERRO_REGISTRO
 ;

--recriei a declaração da view sem o grant
-- ele fica sempre parando em views que tem, em sua declaração, grants... no entanto o migrador deve acessar a base com um usuário sem privilégios para dar grant... nesse caso, o correto seria redeclarar as views sem grants e depois dar os grants (caso necessário) com o usuário sys

--sim, as views que eu vejo sendo criadas aqui não lembro de terem grants nela

-- pois é... isso tem cara de algum erro de alguém que foi mexer e não avisou aos demais...

-- o que você acha, para você não perder tempo com isso, de eu ir tentando rodar o migrador e redeclarar as views (talvez sejam muitas...) e eu faço contato com você em caso de erros?

--pode ser assim,

--  você ajudou muito

-- tu que resolveu o misterio kkk

-- kkkk trabalho em equipe. O cara é vc

--somos nozes kkk bom trabalho ai

manda noticia

valeu, man
p vc tb!


CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_INTEGR_UNG_TI_CLI_EMPR" ("COD_CLIENTE_ORIGEM", "COD_OPERACAO_REGISTRO", "COD_STATUS_REGISTRO", "DSC_ERRO_REGISTRO") AS 
  SELECT cod_cliente_origem, cod_operacao_registro, cod_status_registro, 
dsc_erro_registro FROM TI_CLIENTE_EMPRESA@dbl_pir_ung 
WHERE COD_STATUS_REGISTRO in ('ER', 'NP') 
GROUP BY cod_cliente_origem, cod_operacao_registro, cod_status_registro, 
dsc_erro_registro
ORDER BY DSC_ERRO_REGISTRO
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_INTEGR_UNG_TI_NF_SAIDA" ("DAT_EMISSAO", "COD_NF_ORIGEM", "COD_OPERACAO_REGISTRO", "COD_PRODUTO_ORIGEM", "COD_DEPOSITO_ORIGEM", "COD_CFOP", "COD_STATUS_REGISTRO", "DSC_ERRO_REGISTRO") AS 
  SELECT s.dat_emissao, s.cod_nf_origem, s.cod_operacao_registro, 
i.cod_produto_origem, i.cod_deposito_origem, i.cod_cfop, s.cod_status_registro, 
s.dsc_erro_registro FROM TI_NF_SAIDA@dbl_pir_ung s 
inner join ti_itens_nf_saida@dbl_pir_ung i on s.cod_nf_origem = i.cod_nf_origem
WHERE s.COD_STATUS_REGISTRO in ('ER', 'NP')
GROUP BY s.dat_emissao, s.cod_nf_origem, s.cod_operacao_registro, 
i.cod_produto_origem, i.cod_deposito_origem, i.cod_cfop, s.cod_status_registro, 
s.dsc_erro_registro
ORDER BY s.DAT_EMISSAO, s.DSC_ERRO_REGISTRO
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_INTEGR_UNG_DOCUMENTO_REC" ("DAT_EMISSAO", "COD_DOCUMENTO_ORIGEM", "COD_OPERACAO_REGISTRO", "COD_STATUS_REGISTRO", "DSC_ERRO_REGISTRO") AS 
  SELECT dat_emissao, cod_documento_origem, cod_operacao_registro,
cod_status_registro, dsc_erro_registro FROM TI_DOCUMENTO_REC@dbl_pir_ung
WHERE COD_STATUS_REGISTRO in ('ER', 'NP')
GROUP BY dat_emissao, cod_documento_origem, cod_operacao_registro,
cod_status_registro, dsc_erro_registro
ORDER BY DAT_EMISSAO, DSC_ERRO_REGISTRO
 ;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_INTEGR_UNG_TI_NF_ENTRADA" ("DAT_EMISSAO", "COD_NOTA_FISCAL", "COD_OPERACAO_REGISTRO", "COD_STATUS_REGISTRO", "DSC_ERRO_REGISTRO") AS 
  SELECT dat_emissao,  cod_nota_fiscal, cod_operacao_registro,
cod_status_registro, dsc_erro_registro
FROM TI_NOTA_FISCAL_ENTRADA_UNIGAS@dbl_pir_ung
WHERE COD_STATUS_REGISTRO in ('ER', 'NP')
GROUP BY dat_emissao,  cod_nota_fiscal, cod_operacao_registro,
cod_status_registro, dsc_erro_registro
ORDER BY DAT_EMISSAO,  COD_NOTA_FISCAL
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_CLIENTES_DEB_AUTO_P_ALTERAR" ("Id", "COD_CONTRATO", "NOME", "MODALIDADE_PIR", "MODALIDADE_UNG", "FANTASIA", "ENDERECO_FAT", "COD_BANCO_DEBITO", "COD_AGENCIA_DEBITO", "COD_CCORRENTE_DEBITO") AS 
  (
SELECT CUNG."Id", CPIR.COD_CONTRATO, CPIR.NOME, CPIR.COD_MODALIDADE AS MODALIDADE_PIR, 
CUNG."tipoModalidadePagamento" AS MODALIDADE_UNG,  
CPIR.FANTASIA, CPIR.ENDERECO_FAT, CPIR.COD_BANCO_DEBITO, 
CPIR.COD_AGENCIA_DEBITO, CPIR.COD_CCORRENTE_DEBITO 
FROM CLIENTES CPIR
INNER JOIN Cliente@DBL_PIR_UNG CUNG ON CPIR.COD_CONTRATO = CUNG."NumeroMatricula"
WHERE 
CUNG."FormaMedicao" <> 'MENSAL' AND 
(((CPIR.COD_MODALIDADE = 'DA001' OR CPIR.COD_MODALIDADE IS NULL) AND CUNG."tipoModalidadePagamento" <> 'DBC')
OR 
((CPIR.COD_MODALIDADE <> 'DA001' OR CPIR.COD_MODALIDADE IS NULL) AND CUNG."tipoModalidadePagamento" = 'DBC')
)
)
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_CLIENT_DEB_AUTO_P_ALTERAR" ("COD_CONTRATO", "NOME", "MODALIDADE_PIR", "MODALIDADE_UNG", "FANTASIA", "ENDERECO_FAT", "COD_BANCO_DEBITO", "COD_AGENCIA_DEBITO", "COD_CCORRENTE_DEBITO") AS 
  (SELECT CPIR.COD_CONTRATO, CPIR.NOME, CPIR.COD_MODALIDADE AS MODALIDADE_PIR, 
CUNG."tipoModalidadePagamento" AS MODALIDADE_UNG,  
CPIR.FANTASIA, CPIR.ENDERECO_FAT, CPIR.COD_BANCO_DEBITO, 
CPIR.COD_AGENCIA_DEBITO, CPIR.COD_CCORRENTE_DEBITO FROM CLIENTES CPIR
INNER JOIN Cliente@DBL_PIR_UNG CUNG ON CPIR.COD_CONTRATO = CUNG."NumeroMatricula"
WHERE (CPIR.COD_MODALIDADE = 'DA001' AND CUNG."tipoModalidadePagamento" <> 'DBC')
OR (CPIR.COD_MODALIDADE <> 'DA001' AND CUNG."tipoModalidadePagamento" = 'DBC'))
 ;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_COMPARA_STAT_NFS_PIR_UNG" ("Apelido", "Numero", "statusNFE", "IdSerie", "DAT_EMISSAO", "Total", "COD_NF", "COD_STATUS", "COD_SERIE") AS 
  SELECT df."Apelido", df."Numero", df."statusNFE", df."IdSerie", ps.DAT_EMISSAO, df."Total",
ps.COD_NF, ps.COD_STATUS, ps.COD_SERIE 
FROM PIR_SAIDAS ps
INNER JOIN procenge.view_DocumentoFaturaParaDBL@DBL_PIR_UNG df ON ps.COD_NF = df."Numero"
WHERE ps.COD_SERIE = '01' AND df."IdSerie" = 7 AND ps.DAT_EMISSAO >= '01/01/2020'
AND( 
  (ps.COD_STATUS = 'C' AND (df."statusNFE" <> 'CANC' and df."statusNFE" <> 'DENE'))
  OR
  (ps.COD_STATUS <> 'C' AND (df."statusNFE" = 'CANC' or df."statusNFE" = 'DENE'))
  )
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_COMPARA_STAT_TITS_PIR_UNG" ("TITULO", "NOME", "FANTASIA", "VENCIMENTO", "VALOR_PIR", "VALOR_UNG", "STATUS_PIR", "STATUS_UNG") AS 
  SELECT p.TITULO, cl.NOME, cl.FANTASIA, p.VENCIMENTO, p.VALOR AS VALOR_PIR, 
un."TotalBloquete" + (un."ParteFracionariaDoTotal"/100) as VALOR_UNG,
p.STATUS as STATUS_PIR, un."Status" AS STATUS_UNG  FROM TITULO_REC p
INNER JOIN procenge.view_BloqueteCPG@DBL_PIR_UNG un ON
un."NumeroDocumento" = p.TITULO AND p.VENCIMENTO = un."DataVencimento"
LEFT JOIN Clientes cl ON cl.CODIGO = p.CLIENTE
 ;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_TI_HIST_REC_RET_PIR_GGAS" ("TITB_CD_ORIGEM", "TITR_CD", "TITP_CD_TIPO_BAIXA", "TITB_NR_SEQUENCIAL", "TITB_VL_BAIXA", "TITB_DT_BAIXA", "TITB_VL_PRINCIPAL", "TITB_VL_JUROS_MULTA", "TITB_VL_DESCONTOS", "TITB_CD_BANCO", "TITB_CD_AGENCIA", "TITB_CD_CONTA_BANCARIA", "TITB_CD_OPERACAO", "TITB_CD_SITUACAO", "TITB_DS_ERRO", "TITB_CD_SISTEMA_ORIGEM", "TITB_CD_SISTEMA_DESTINO", "TITB_IN_USO", "TITB_NR_VERSAO", "TITB_TM_ULTIMA_ALTERACAO", "DATAMODIFICACAO", "OPERACAO") AS 
  SELECT 
REGEXP_REPLACE(THR.COD_DOCUMENTO_REC,'[A-Záàâãéèêíïóôõöúçñ!@#$%^&*()?/\.,]', '') AS TITB_CD_ORIGEM, 
TR.TITR_CD AS TITR_CD,
(SELECT DECODE(VALOR,'<','P','T') FROM TIPO_DE_PAG WHERE CODIGO = THR.COD_TIPO_BAIXA_ORIGEM) AS TITP_CD_TIPO_BAIXA,
CAST(THR.NUM_SEQ_DOCUMENTO AS NUMBER) AS TITB_NR_SEQUENCIAL,
CAST(THR.VAL_RECEBIMENTO_PRINCIPAL AS NUMBER) AS TITB_VL_BAIXA,
CAST(THR.DAT_RECEBIMENTO AS TIMESTAMP) AS TITB_DT_BAIXA,
CAST(TDR.VAL_DOCUMENTO AS NUMBER) AS TITB_VL_PRINCIPAL,
CAST(THR.VAL_RECEBIMENTO_MULTA AS NUMBER) AS TITB_VL_JUROS_MULTA,
CAST(THR.VAL_RECEBIMENTO_DESCONTO AS NUMBER) AS TITB_VL_DESCONTOS,
THR.COD_BANCO_REC_ORIGEM AS TITB_CD_BANCO,
THR.COD_AGENCIA_REC_ORIGEM AS TITB_CD_AGENCIA,
THR.COD_CCORRENTE_REC_ORIGEM AS TITB_CD_CONTA_BANCARIA,
THR.COD_OPERACAO_REGISTRO AS TITB_CD_OPERACAO,
'NP' AS TITB_CD_SITUACAO,
THR.DSC_ERRO_REGISTRO AS TITB_DS_ERRO,
'PIR' AS TITB_CD_SISTEMA_ORIGEM,
'GAS' AS TITB_CD_SISTEMA_DESTINO,
1 AS TITB_IN_USO,
0 AS TITB_NR_VERSAO,
DECODE(THR.DAT_PROCESSAMENTO_REGISTRO, NULL, THR.DAT_INCLUSAO_REGISTRO, THR.DAT_PROCESSAMENTO_REGISTRO) AS TITB_TM_ULTIMA_ALTERACAO,
DECODE(THR.DAT_PROCESSAMENTO_REGISTRO, NULL, THR.DAT_INCLUSAO_REGISTRO, THR.DAT_PROCESSAMENTO_REGISTRO) AS DATAMODIFICACAO,
DECODE (THR.COD_OPERACAO_REGISTRO, 'I', 'INSERT', 'UPDATE') AS OPERACAO
FROM TI_HISTORICO_REC THR
INNER JOIN TI_DOCUMENTO_REC TDR ON TDR.NUM_SEQ_DOCUMENTO = THR.NUM_SEQ_DOCUMENTO
INNER JOIN TI_TITULO_RECEBER@DBL_PIR_GGAS TR ON TR.TITR_CD_DESTINO = TDR.NUM_SEQ_DOCUMENTO
WHERE TDR.COD_SISTEMA_ORIGEM = 'GAS' 
AND TDR.COD_STATUS_REGISTRO = 'P'
AND ((TDR.COD_DOCUMENTO_ORIGEM LIKE '%.GAS') OR (TDR.COD_DOCUMENTO_ORIGEM LIKE 'TOP %')) and tdr.dat_emissao >= '01/01/21'
--COMENTADO EM 22/06/23 PARA TRATAR ERRO DE NUMERO INVALIDO PARA OS TITULOS DE TOP, VISTO QUE AO INVES DO ".GAS" POSSUEM UM "TOP " E NAO POSSUEM RELAÇÃO DIRETA COM O ID DA FATURA
--AND ((TR.TITR_CD_FATURA = RTRIM(TDR.COD_DOCUMENTO_ORIGEM,'.GAS')) OR (TR.TITR_CD_FATURA = LTRIM(TDR.COD_DOCUMENTO_ORIGEM,'TOP ')))
GROUP BY TR.TITR_CD,THR.NUM_SEQ_DOCUMENTO,THR.NUM_SEQ_DOCUMENTO,THR.COD_TIPO_BAIXA_ORIGEM, THR.VAL_RECEBIMENTO_PRINCIPAL, THR.DAT_RECEBIMENTO,
TDR.VAL_DOCUMENTO, THR.VAL_RECEBIMENTO_MULTA, THR.VAL_RECEBIMENTO_DESCONTO, THR.COD_BANCO_REC_ORIGEM, THR.COD_AGENCIA_REC_ORIGEM,
THR.COD_CCORRENTE_REC_ORIGEM, TDR.COD_STATUS_REGISTRO, THR.DSC_ERRO_REGISTRO, THR.DAT_INCLUSAO_REGISTRO, THR.COD_OPERACAO_REGISTRO,THR.COD_DOCUMENTO_REC,
THR.DAT_PROCESSAMENTO_REGISTRO;


CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_TI_TITULO_REC_PIR_GGAS" ("TITR_CD", "TITR_CD_SITUACAO", "TITR_DS_ERRO", "TITR_NR_NOSSO_NUMERO", "TITR_TM_ULTIMA_ALTERACAO", "DATAMODIFICACAO", "OPERACAO") AS 
  SELECT
TR.TITR_CD AS TITR_CD,
TDR.COD_STATUS_REGISTRO AS TITR_CD_SITUACAO,
TDR.DSC_ERRO_REGISTRO AS TITR_DS_ERRO,
CAST(SUBSTR(TDR.COD_NOSSO_NUMERO,9)AS NUMBER) AS TITR_NR_NOSSO_NUMERO,
DECODE(TDR.DAT_PROCESSAMENTO_REGISTRO, NULL, TDR.DAT_INCLUSAO_REGISTRO, TDR.DAT_PROCESSAMENTO_REGISTRO) AS TITR_TM_ULTIMA_ALTERACAO,
DECODE(TDR.DAT_PROCESSAMENTO_REGISTRO, NULL, TDR.DAT_INCLUSAO_REGISTRO, TDR.DAT_PROCESSAMENTO_REGISTRO) AS DATAMODIFICACAO,
'UPDATE' AS OPERACAO
FROM TI_DOCUMENTO_REC TDR
INNER JOIN TI_TITULO_RECEBER@DBL_PIR_GGAS TR ON TR.TITR_CD_DESTINO = TDR.NUM_SEQ_DOCUMENTO
WHERE TDR.COD_SISTEMA_ORIGEM = 'GAS' AND (TDR.COD_STATUS_REGISTRO = 'P' OR TDR.COD_STATUS_REGISTRO = 'ER') AND TR.TITR_CD_DESTINO IS NOT NULL
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_ANALISE_INADIMPUNG_SEMAN" ("CODDOC", "STATUS", "CLIENTE", "NOME_CLIENTE", "COD_CGC_CPF", "TITULO", "NOSSO_NUMERO", "COD_REFERENCIA", "EMISSAO", "VENCIMENTO", "DAT_COMPETENCIA", "VALOR", "RAZAOSOCIAL", "APELIDO", "EMAIL", "TELEFONE", "TIPOTELEFONE", "SEGMENTO", "ENDERECO", "NUMERO", "COMPLEMENTO", "BAIRRO", "CEP", "ESTADO", "PAIS", "STATUSCLIENTE", "FormaMedicao") AS 
  SELECT 
t.coddoc,
t.status, 
t.cliente, 
c.nome AS Nome_cliente, 
p.cod_cgc_cpf, 
T.TITULO, 
t.nosso_numero, 
t.cod_referencia, 
t.emissao, 
t.vencimento, 
t.dat_competencia, 
t.valor,
--imp."MATRICULA", 
--imp."ID",
imp."RAZAOSOCIAL",
imp."APELIDO",
--imp."CNPJ",
imp."EMAIL",
imp."TELEFONE",
imp."TIPOTELEFONE", 
--imp."PRODUTO",
--imp."PERFILFATURAMENTO", 
--imp."IDPERFILFATURAMENTO", 
imp."SEGMENTO",
imp."ENDERECO", 
imp."NUMERO", 
imp."COMPLEMENTO",
imp."BAIRRO",
imp."CEP",
imp."ESTADO",
imp."PAIS",
imp."STATUSCLIENTE", 
--imp."IDCLIENTEMESTRE", 
--imp."APELIDOCLIENTEMESTRE",
--ci.dsc_municipio AS cidade_cliente, 
--ci.cod_uf AS uf_cliente,
imp."FormaMedicao"
FROM titulo_rec t
INNER JOIN clientes c ON t.cliente = c.codigo
INNER JOIN pessoa p ON c.codigo = p.codigo
--INNER JOIN pir_municipio ci ON c.cod_municipio_cob = ci.cod_municipio
INNER JOIN copergas.VW_DADOS_INADIMPLENCIA@DBL_PIR_UNG imp ON 
  TO_CHAR(imp.ID)=TO_CHAR(t.cliente) AND 
  imp.cnpj=p.cod_cgc_cpf
WHERE t.status IN ('A','P') and imp."FormaMedicao" = 'Diaria'
 ;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_UNG" ("CODDOC", "STATUS", "CLIENTE", "NOME_CLIENTE", "COD_CGC_CPF", "TITULO", "NOSSO_NUMERO", "COD_REFERENCIA", "EMISSAO", "VENCIMENTO", "DAT_COMPETENCIA", "VALOR", "MATRICULA", "ID", "RAZAOSOCIAL", "APELIDO", "CNPJ", "EMAIL", "TELEFONE", "TIPOTELEFONE", "PRODUTO", "PERFILFATURAMENTO", "IDPERFILFATURAMENTO", "SEGMENTO", "ENDERECO", "NUMERO", "COMPLEMENTO", "BAIRRO", "CEP", "ESTADO", "PAIS", "STATUSCLIENTE", "IDCLIENTEMESTRE", "APELIDOCLIENTEMESTRE", "CIDADE_CLIENTE", "UF_CLIENTE", "FormaMedicao") AS 
  SELECT 
t.coddoc,
t.status, 
t.cliente, 
c.nome AS Nome_cliente, 
p.cod_cgc_cpf, 
T.TITULO, 
t.nosso_numero, 
t.cod_referencia, 
t.emissao, 
t.vencimento, 
t.dat_competencia, 
t.valor,
imp."MATRICULA", 
imp."ID",
imp."RAZAOSOCIAL",
imp."APELIDO",
imp."CNPJ",
imp."EMAIL",
imp."TELEFONE",
imp."TIPOTELEFONE", 
imp."PRODUTO",
imp."PERFILFATURAMENTO", 
imp."IDPERFILFATURAMENTO", 
imp."SEGMENTO",
imp."ENDERECO", 
imp."NUMERO", 
imp."COMPLEMENTO",
imp."BAIRRO",
imp."CEP",
imp."ESTADO",
imp."PAIS",
imp."STATUSCLIENTE", 
imp."IDCLIENTEMESTRE", 
imp."APELIDOCLIENTEMESTRE",
ci.dsc_municipio AS cidade_cliente, 
ci.cod_uf AS uf_cliente,
imp."FormaMedicao"
from titulo_rec t
inner join clientes c on t.cliente = c.codigo
inner join pessoa p on c.codigo = p.codigo
inner join pir_municipio ci on c.cod_municipio_cob = ci.cod_municipio
left join copergas.VW_DADOS_INADIMPLENCIA@DBL_PIR_UNG imp ON TO_CHAR(imp.ID)=TO_CHAR(t.cliente) AND imp.cnpj=p.cod_cgc_cpf
where t.status in ('A','P') and imp."FormaMedicao" = 'Diaria'
 ;






CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_GGAS" ("CODDOC", "STATUS", "CLIENTE", "NOME_CLIENTE", "COD_CGC_CPF", "TITULO", "NOSSO_NUMERO", "COD_REFERENCIA", "EMISSAO", "VENCIMENTO", "DAT_COMPETENCIA", "VALOR", "MATRICULA", "ID", "RAZAOSOCIAL", "APELIDO", "CNPJ", "EMAIL", "TELEFONE", "TIPOTELEFONE", "PRODUTO", "PERFILFATURAMENTO", "IDPERFILFATURAMENTO", "SEGMENTO", "ENDERECO", "NUMERO", "COMPLEMENTO", "BAIRRO", "CEP", "ESTADO", "PAIS", "STATUSCLIENTE", "IDCLIENTEMESTRE", "APELIDOCLIENTEMESTRE", "CIDADE_CLIENTE", "UF_CLIENTE", "FORMAMEDICAO") AS 
  SELECT
t.coddoc,
t.status,
t.cliente,
c.nome AS Nome_cliente,
p.cod_cgc_cpf,
T.TITULO,
t.nosso_numero,
t.cod_referencia,
t.emissao,
t.vencimento,
t.dat_competencia,
t.valor,
(CASE WHEN (c.COD_CONTRATO IS NULL) THEN (SELECT COD_CONTRATO_ORIGEM FROM PIRAMIDE.TI_CLIENTE ticli
										WHERE ticli.COD_CLIENTE_DESTINO = t.CLIENTE
										AND COD_CONTRATO_ORIGEM IS NOT NULL
										AND rownum = 1)
 ELSE C.COD_CONTRATO END) AS MATRICULA,
--imp."MATRICULA",
imp."ID",
imp."RAZAOSOCIAL",
imp."APELIDO",
c.CGC AS CNPJ,
(CASE WHEN (imp."EMAIL" IS NULL) THEN (c.EMAIL)
 ELSE imp."EMAIL" END) AS EMAIL,
imp."TELEFONE",
imp."TIPOTELEFONE",
imp."PRODUTO",
imp."PERFILFATURAMENTO",
imp."IDPERFILFATURAMENTO",
imp."SEGMENTO",
imp."ENDERECO",
imp."NUMERO",
imp."COMPLEMENTO",
imp."BAIRRO",
imp."CEP",
imp."ESTADO",
imp."PAIS",
imp."STATUSCLIENTE",
imp."IDCLIENTEMESTRE",
imp."APELIDOCLIENTEMESTRE",
ci.dsc_municipio AS cidade_cliente,
ci.cod_uf AS uf_cliente,
imp."FORMAMEDICAO"
from titulo_rec t
inner join piramide.clientes c on t.cliente = c.codigo
inner join piramide.pessoa p on c.codigo = p.codigo
inner join pir_municipio ci on c.cod_municipio_cob = ci.cod_municipio
left join VW_DADOS_INADIMPLENCIA2@DBL_PIR_GGAS imp ON TO_CHAR(imp."MATRICULA")=TO_CHAR(c.COD_CONTRATO) AND imp.cnpj=p.cod_cgc_cpf
where
t.status in ('A','P');

GRANT SELECT ON "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_GGAS" TO "SINC_INADIPLENTES";
GRANT SELECT ON "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_GGAS" TO "USUARIOPIRAMIDE";



CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_CHECK_MODALID_DIF_PIR_GGAS" ("COD_CONTRATO", "COD_CLIENTE", "NOME", "POCN_DS", "MODALIDADE_PIR", "IS_DEB_AUTO_GGAS", "SIT_CONTR_GGAS", "DAT_INCLUSAO_OPCAO_DEBITO", "COD_BANCO_DEBITO", "COD_AGENCIA_DEBITO", "COD_CCORRENTE_DEBITO", "BANCO_GGAS", "AGENCIA_GGAS", "CONTA_GGAS", "ROTA_GGAS", "DT_ASS_CONTR_GGAS") AS 
  SELECT clpir.COD_CONTRATO, clpir.CODIGO AS COD_CLIENTE, clpir.NOME,
ggas.POCN_DS, clpir.COD_MODALIDADE AS MODALIDADE_PIR,
ggas.arcc_cd_ind_debito_automatico AS IS_DEB_AUTO_GGAS,
ggas.cosi_cd as SIT_CONTR_GGAS,
clpir.DAT_INCLUSAO_OPCAO_DEBITO, clpir.COD_BANCO_DEBITO, 
clpir.COD_AGENCIA_DEBITO, clpir.COD_CCORRENTE_DEBITO,
ggas.banc_cd as banco_ggas, ggas.cont_nr_agencia as agencia_ggas, 
ggas.CONT_NR_CONTA_CORRENTE as conta_ggas,
ggas.rota_nr as rota_ggas, ggas.cont_dt_assinatura as dt_ass_contr_ggas
FROM CLIENTES clpir
LEFT JOIN (
  select REPLACE((C.CONT_DT_ANO || TO_CHAR(C.CONT_NR, '00009')), ' ','' ) AS NUMEROMATRICULA, 
    cl.clie_nm,
    pc.pocn_cd, pc.pocn_ds, pc.rota_cd, r.rota_nr
    ,c.cosi_cd
    ,cpc.COPC_IN_EMISSAO_NFE, cpc.COPC_IN_EMITIR_FAT_NFE
    ,c.cont_cd_principal
    ,c.CONT_IN_AGRUPAMENTO_CONTA, c.CONT_IN_AGRUPAMENTO_COBRANCA, c.ENCO_CD_TIPO_AGRUPAMENTO
    ,c.arcc_cd_ind_debito_automatico, c.arcc_cd_debito_automatico/*11*/, 
    c.ENCO_CD_TIPO_CONVENIO/*578*/, c.banc_cd/*1*/, c.cont_nr_agencia, c.CONT_NR_CONTA_CORRENTE
    , c.cont_dt_assinatura
    from contrato_ponto_consumo@DBL_PIR_GGAS cpc
    inner join contrato@DBL_PIR_GGAS c on cpc.cont_cd = c.cont_cd
    inner join ponto_consumo@DBL_PIR_GGAS pc on cpc.pocn_cd = pc.pocn_cd
    inner join rota@DBL_PIR_GGAS r on pc.rota_cd = r.rota_cd
    inner join cliente@DBL_PIR_GGAS cl on c.clie_cd_assinatura = cl.clie_cd
    where c.cosi_cd in (1, 2, 12)
    and c.cont_in_uso = 1
) ggas ON ggas.NUMEROMATRICULA = clpir.COD_CONTRATO
INNER JOIN CLIENTE_EMPRESA CE ON CE.CLIENTE = clpir.CODIGO
WHERE CE.ATIVO = 'S' AND
((clpir.COD_MODALIDADE = 'BOL' AND (ggas.arcc_cd_ind_debito_automatico <> 0 AND ggas.arcc_cd_ind_debito_automatico IS NOT NULL)) -- NOT IN (0,NULL))
OR (clpir.COD_MODALIDADE = 'DA001' AND ggas.arcc_cd_ind_debito_automatico <> 1))
 ;
 

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_SINC_EMAILS_TODOS_SISTEMAS" ("CPFCNPJ", "NOME", "CONTRATO", "CLI_EMAILS") AS 
  SELECT
cl_pir.CGC AS CPFCNPJ,
cl_pir.NOME AS NOME,
cl_pir.COD_CONTRATO AS CONTRATO,
cl_gg.EMAIL || ',' || cl_gg.EMAIL_CONTR || ',' || cl_un."email" || '||' AS CLI_EMAILS
FROM CLIENTES cl_pir
INNER JOIN PIRAMIDE.CLIENTE_EMPRESA ce_pir ON ce_pir.CLIENTE = cl_pir.CODIGO
LEFT JOIN VW_AGVIR_CLIENTES_CONTRATO@DBL_PIR_GGAS cl_gg ON cl_gg.NUMEROMATRICULA = cl_pir.COD_CONTRATO
LEFT JOIN VW_AGVIR_CLIENTES_CONTRATO@DBL_PIR_UNG cl_un ON cl_un."numeromatricula" = cl_pir.COD_CONTRATO
WHERE ce_pir.ATIVO = 'S'
 ;
 

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_NEGATIV_SERASA_LEGADO" ("EMISSAO", "STATUS", "VENCIMENTO", "COD_CONTRATO", "CODIGO", "NOME", "CPF_CNPJ", "MAILS_CONT", "ENDERECO", "NUMERO", "COMPLEMENTO", "BAIRRO", "MUNICIPIO", "CEP", "TITULO", "VALOR") AS 
  SELECT tr.EMISSAO, tr.STATUS, tr.VENCIMENTO, cl.COD_CONTRATO,
cl.CODIGO, cl.NOME, cl.CGC AS CPF_CNPJ, vwggas."MAILS_CONT",
vwggas2."ENDERECO", vwggas2."NUMERO", vwggas2."COMPLEMENTO", vwggas2."BAIRRO",
vwggas2."MUNICIPIO", vwggas2."CEP", tr.TITULO, tr.VALOR
FROM TITULO_REC tr
LEFT JOIN CLIENTES cl ON cl.CODIGO = tr.CLIENTE
LEFT JOIN VIEW_EMAILS_CONTRATO@DBL_PIR_GGAS vwggas ON vwggas."CONT_CODIGO_ANO_NR" = cl.COD_CONTRATO
LEFT JOIN VIEW_LISTA_CLIENTES@DBL_PIR_GGAS vwggas2 ON vwggas2."NUMEROMATRICULA" = cl.COD_CONTRATO
WHERE tr.EMISSAO <= TO_DATE('31/03/2021', 'DD/MM/YY') AND tr.STATUS <> 'L' and tr.STATUS <> 'C' 
AND tr.VENCIMENTO < (SYSDATE-30) -- vencido há mais de 30 dias
AND tr.VENCIMENTO > SYSDATE - 1796 -- vencimento dentro dos últimos 4 anos e 11 meses.
--AND cl.COD_CONTRATO is null
--)
 ;
 
CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_CLIENTES_PIR_UNG_GGAS" ("CODIGO", "COD_CONTRATO", "NOME", "FANTASIA", "CPF_CNPJ", "CONTA_CONTABIL", "CONTA_AUXILIAR", "PERFIL_FATURAMENTO_UNIGAS", "ATIVADO_UNIGAS", "SEGMENTO_GGAS", "CONTRATO_SITUACAO_GGAS") AS 
  select c.CODIGO, c.COD_CONTRATO, c.NOME, c.FANTASIA, C.CGC AS CPF_CNPJ, pcc.cod_conta as conta_contabil, pcc.cod_cnt_aux as conta_auxiliar, CU."Perfil de Faturamento" AS PERFIL_FATURAMENTO_UNIGAS, CU."Ativado" as ATIVADO_UNIGAS,
      CASE WHEN tcg.COD_SEGMENTO_MERCADO_ORIGEM = 2 THEN 'Comercial'
      WHEN tcg.COD_SEGMENTO_MERCADO_ORIGEM = 4  THEN 'Residencial'  
      WHEN tcg.COD_SEGMENTO_MERCADO_ORIGEM = 1  THEN 'Industrial'
      WHEN tcg.COD_SEGMENTO_MERCADO_ORIGEM = 3  THEN 'Veicular' END as SEGMENTO_GGAS, CSGA.COSI_DS CONTRATO_SITUACAO_GGAS
from clientes c LEFT join ti_cliente tcu on c.codigo = tcu.cod_cliente_destino and tcu.cod_sistema_origem = 'UNG' AND TCU.COD_STATUS_REGISTRO = 'P'
                LEFT JOIN COPERGAS.view_CLIENTES_comInativos@DBL_PIR_UNG CU ON tcu.cod_cliente_origem = TO_CHAR(CU."Id")
                left join ti_cliente tcg on c.codigo = tcg.cod_cliente_destino and tcG.cod_sistema_origem = 'GAS' AND TCG.COD_STATUS_REGISTRO = 'P'
                left join ti_contrato@DBL_PIR_GGAS TCGA ON TCG.COD_CLIENTE_ORIGEM = TCGA.TICO_COPC_CD AND TCGA.TICO_CD_SITUACAO = 'P'
                LEFT JOIN CONTRATO@DBL_PIR_GGAS CGA ON TCGA.TICO_CD_ORIGEM = CGA.CONT_CD AND CGA.CONT_IN_USO = 1
                LEFT JOIN CONTRATO_SITUACAO@DBL_PIR_GGAS CSGA ON CGA.COSI_CD = CSGA.COSI_CD 
                left join pir_cliente_contas pcc on c.codigo = pcc.cod_cliente and pcc.cod_empresa = '001' and pcc.cod_versao = 3       
order by nome
 ;
 

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_CHECK_MOD_DIF_PIR_GGAS_UPDT" ("COD_CONTRATO", "COD_CLIENTE", "NOME_PIR", "POCN_DS", "MODALIDADE_PIR", "IS_DEB_AUTO_GGAS", "SIT_CONTR_GGAS", "DAT_INCLUSAO_OPCAO_DEBITO", "COD_BANCO_DEBITO", "COD_AGENCIA_DEBITO", "COD_CCORRENTE_DEBITO", "BANCO_GGAS", "AGENCIA_GGAS", "CONTA_GGAS", "ROTA_GGAS", "DT_ASS_CONTR_GGAS", "CONT_CD_GGAS", "CLIE_NM_GGAS", "QTDE_PIR_CONTR_ATIV") AS 
  SELECT clpir.COD_CONTRATO, clpir.CODIGO AS COD_CLIENTE, TRIM(clpir.NOME) AS NOME_PIR,
ggas.POCN_DS, clpir.COD_MODALIDADE AS MODALIDADE_PIR,
ggas.arcc_cd_ind_debito_automatico AS IS_DEB_AUTO_GGAS,
ggas.cosi_cd as SIT_CONTR_GGAS,
clpir.DAT_INCLUSAO_OPCAO_DEBITO, clpir.COD_BANCO_DEBITO, 
clpir.COD_AGENCIA_DEBITO, clpir.COD_CCORRENTE_DEBITO,
ggas.banc_cd as banco_ggas, ggas.cont_nr_agencia as agencia_ggas, 
ggas.CONT_NR_CONTA_CORRENTE as conta_ggas,
ggas.rota_nr as rota_ggas, ggas.cont_dt_assinatura as dt_ass_contr_ggas
, ggas.CONT_CD AS CONT_CD_GGAS, TRIM(clie_nm) AS CLIE_NM_GGAS
, (SELECT COUNT(CL.COD_CONTRATO) FROM CLIENTES CL LEFT JOIN CLIENTE_EMPRESA CE ON CE.CLIENTE = CL.CODIGO WHERE CL.COD_CONTRATO = clpir.COD_CONTRATO AND CE.ATIVO = 'S') AS QTDE_PIR_CONTR_ATIV
FROM CLIENTES clpir
LEFT JOIN (
  select REPLACE((C.CONT_DT_ANO || TO_CHAR(C.CONT_NR, '00009')), ' ','' ) AS NUMEROMATRICULA, 
    cl.clie_nm,
    pc.pocn_cd, pc.pocn_ds, pc.rota_cd, r.rota_nr
    ,c.cosi_cd
    ,cpc.COPC_IN_EMISSAO_NFE, cpc.COPC_IN_EMITIR_FAT_NFE
    ,c.cont_cd_principal
    ,c.CONT_IN_AGRUPAMENTO_CONTA, c.CONT_IN_AGRUPAMENTO_COBRANCA, c.ENCO_CD_TIPO_AGRUPAMENTO
    ,c.arcc_cd_ind_debito_automatico, c.arcc_cd_debito_automatico/*11*/, 
    c.ENCO_CD_TIPO_CONVENIO/*578*/, c.banc_cd/*1*/, c.cont_nr_agencia, c.CONT_NR_CONTA_CORRENTE
    , c.cont_dt_assinatura
    , c.CONT_CD
    from contrato_ponto_consumo@DBL_PIR_GGAS cpc
    inner join contrato@DBL_PIR_GGAS c on cpc.cont_cd = c.cont_cd
    inner join ponto_consumo@DBL_PIR_GGAS pc on cpc.pocn_cd = pc.pocn_cd
    inner join rota@DBL_PIR_GGAS r on pc.rota_cd = r.rota_cd
    inner join cliente@DBL_PIR_GGAS cl on c.clie_cd_assinatura = cl.clie_cd
    where c.cosi_cd in (1, 2, 12)
    and c.cont_in_uso = 1
) ggas ON ggas.NUMEROMATRICULA = clpir.COD_CONTRATO
INNER JOIN CLIENTE_EMPRESA CE ON CE.CLIENTE = clpir.CODIGO
WHERE CE.ATIVO = 'S' AND
((clpir.COD_MODALIDADE = 'BOL' AND (ggas.arcc_cd_ind_debito_automatico <> 0 AND ggas.arcc_cd_ind_debito_automatico IS NOT NULL)) -- NOT IN (0,NULL))
OR (clpir.COD_MODALIDADE = 'DA001' AND ggas.arcc_cd_ind_debito_automatico <> 1)) AND (SELECT COUNT(CL.COD_CONTRATO) FROM CLIENTES CL LEFT JOIN CLIENTE_EMPRESA CE ON CE.CLIENTE = CL.CODIGO WHERE CL.COD_CONTRATO = clpir.COD_CONTRATO AND CE.ATIVO = 'S') = 1
 ;
 


CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VW_SINC_INADIMP_APP_UNG" ("CODDOC", "STATUS", "CLIENTE", "NOME_CLIENTE", "COD_CGC_CPF", "TITULO", "NOSSO_NUMERO", "COD_REFERENCIA", "EMISSAO", "VENCIMENTO", "DAT_COMPETENCIA", "VALOR", "MATRICULA", "ID", "RAZAOSOCIAL", "APELIDO", "CNPJ", "EMAIL", "TELEFONE", "TIPOTELEFONE", "PRODUTO", "PERFILFATURAMENTO", "IDPERFILFATURAMENTO", "SEGMENTO", "ENDERECO", "NUMERO", "COMPLEMENTO", "BAIRRO", "CEP", "ESTADO", "PAIS", "STATUSCLIENTE", "IDCLIENTEMESTRE", "APELIDOCLIENTEMESTRE", "CIDADE_CLIENTE", "UF_CLIENTE", "FormaMedicao") AS 
  SELECT
t.coddoc,
t.status,
t.cliente,
c.nome AS Nome_cliente,
p.cod_cgc_cpf,
T.TITULO,
t.nosso_numero,
t.cod_referencia,
t.emissao,
t.vencimento,
t.dat_competencia,
t.valor,
imp."MATRICULA",
imp."ID",
imp."RAZAOSOCIAL",
imp."APELIDO",
imp."CNPJ",
imp."EMAIL",
imp."TELEFONE",
imp."TIPOTELEFONE",
imp."PRODUTO",
imp."PERFILFATURAMENTO",
imp."IDPERFILFATURAMENTO",
imp."SEGMENTO",
imp."ENDERECO",
imp."NUMERO",
imp."COMPLEMENTO",
imp."BAIRRO",
imp."CEP",
imp."ESTADO",
imp."PAIS",
imp."STATUSCLIENTE",
imp."IDCLIENTEMESTRE",
imp."APELIDOCLIENTEMESTRE",
ci.dsc_municipio AS cidade_cliente,
ci.cod_uf AS uf_cliente,
imp."FormaMedicao"
from titulo_rec t
inner join clientes c on t.cliente = c.codigo
inner join pessoa p on c.codigo = p.codigo
inner join pir_municipio ci on c.cod_municipio_cob = ci.cod_municipio
left join copergas.VW_SINC_DADOS_INADIMPLENCIA@DBL_PIR_UNG imp ON TO_CHAR(imp.ID)=TO_CHAR(t.cliente) AND imp.cnpj=p.cod_cgc_cpf
where t.status in ('A','P') and imp."FormaMedicao" = 'Diaria';

CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIRAMIDE"."VIEW_NEGATIVACAO_LOTE_SERASA" ("LINHA_ARQUIVO") AS 
  SELECT

'1'|| --fixo
'I'|| -- I INCLUSAO / E EXCLUSAO
'000181'|| -- CNPJ COPERGAS
To_Char(tr.VENCIMENTO, 'yyyymmdd')||
To_Char(tr.VENCIMENTO, 'yyyymmdd')||
RPad('FG',3, ' ')||
'    '||
Decode ( Length(cl.CGC), 14, 'J', 'F')||
Decode ( Length(cl.CGC), 14, '1', '2')||
LPad(cl.CGC, 15, '0')||
LPad(' ', 57, ' ')||
RPad(cl.NOME, 70, ' ')||
'00000000'||
RPad(' ', 70, ' ')||
RPad(' ', 70, ' ')||
RPad(vwggas2."ENDERECO" ||' ' || vwggas2."NUMERO" || ' ' || vwggas2."COMPLEMENTO", 45 , ' ')||
RPad(vwggas2."BAIRRO", 20, ' ')||
RPad(vwggas2."MUNICIPIO",25 , ' ')||
'PE'||
vwggas2."CEP"||
--REPLACE(tr.valor, CHR(13), ' ')LPad(TRIM(TO_CHAR(tr.valor, '999999990D99')), 15, '0') VALOR,
REPLACE (LPad(TRIM(TO_CHAR(tr.valor, '999999990D99')), 16, '0'),',','')||  
RPad(tr.TITULO, 16 ,' ')||
RPad(' ', 139, ' ')||
LPad(ROWNUM + 1, 7 , '0') AS LINHA_ARQUIVO



FROM TITULO_REC tr

LEFT JOIN CLIENTES cl ON cl.CODIGO = tr.CLIENTE
LEFT JOIN VIEW_EMAILS_CONTRATO@DBL_PIR_GGAS vwggas ON vwggas."CONT_CODIGO_ANO_NR" = cl.COD_CONTRATO
LEFT JOIN VIEW_LISTA_CLIENTES@DBL_PIR_GGAS vwggas2 ON vwggas2."NUMEROMATRICULA" = cl.COD_CONTRATO

WHERE tr.EMISSAO <= TO_DATE('31/03/2023', 'DD/MM/YY')
AND tr.STATUS <> 'L'
AND tr.STATUS <> 'C'
AND tr.VENCIMENTO < (SYSDATE-30) -- vencido há mais de 30 dias
AND tr.VENCIMENTO > SYSDATE - 1796 -- vencimento dentro dos últimos 4 anos e 11 meses.
--AND tr.titulo = '602026.GAS'     

--AND cl.COD_CONTRATO is null
;

GRANT SELECT ON VIEW PIRAMIDE.VIEW_NEGATIVACAO_LOTE_SERASA TO USUARIOPIRAMIDE;
GRANT SELECT ON VIEW PIRAMIDE.TI_DOC_REC_INTEG_NOSUMERO_DUP TO USUARIOPIRAMIDE;
GRANT SELECT ON VIEW PIRAMIDE.VIEW_ANALISE_TESTE TO USUARIOPIRAMIDE;
GRANT SELECT ON "PIRAMIDE"."VW_SINC_INADIMP_APP_UNG" TO "USUARIOPIRAMIDE";

SELECT * FROM USER_ERRORS WHERE NAME = 'VW_SINC_INADIMP_APP_UNG';
SELECT * FROM DBA_OBJECTS WHERE STATUS = 'INVALID';

GRANT SELECT ON "PIRAMIDE"."VW_CHECK_MOD_DIF_PIR_GGAS_UPDT" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_CLIENTES_PIR_UNG_GGAS" TO "PIRAMIDE_CONSULTANTE";
GRANT SELECT ON "PIRAMIDE"."VIEW_CLIENTES_PIR_UNG_GGAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_CLIENTES_PIR_UNG_GGAS" TO "PIRAMIDE_CONSULTANTE";
GRANT SELECT ON "PIRAMIDE"."VIEW_CLIENTES_PIR_UNG_GGAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_NEGATIV_SERASA_LEGADO" TO "PIRAMIDE_CONSULTANTE";
GRANT SELECT ON "PIRAMIDE"."VW_NEGATIV_SERASA_LEGADO" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_SINC_EMAILS_TODOS_SISTEMAS" TO "PIRAMIDE_CONSULTANTE";
GRANT SELECT ON "PIRAMIDE"."VW_SINC_EMAILS_TODOS_SISTEMAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_CHECK_MODALID_DIF_PIR_GGAS" TO "PIR_GGAS_CONSULTA";
GRANT SELECT ON "PIRAMIDE"."VW_CHECK_MODALID_DIF_PIR_GGAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_GGAS" TO "SINC_INADIPLENTES";
GRANT SELECT ON "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_GGAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_ANALISE_INADIMP_APP_UNG" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_ANALISE_INADIMPUNG_SEMAN" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_CLIENT_DEB_AUTO_P_ALTERAR" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_INTEGR_UNG_TI_NF_ENTRADA" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_CLIENTES_DEB_AUTO_P_ALTERAR" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_TI_TITULO_REC_PIR_GGAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_TI_HIST_REC_RET_PIR_GGAS" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_COMPARA_STAT_TITS_PIR_UNG" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VIEW_COMPARA_STAT_NFS_PIR_UNG" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_INTEGR_UNG_TI_CLI_EMPR" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_INTEGR_UNG_TI_NF_SAIDA" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_INTEGR_UNG_TI_NF_ENTRADA" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_INTEGR_UNG_DOCUMENTO_REC" TO "USUARIOPIRAMIDE";
GRANT DELETE ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT INSERT ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT SELECT ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT UPDATE ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT REFERENCES ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT ON COMMIT REFRESH ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT QUERY REWRITE ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT DEBUG ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT FLASHBACK ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT MERGE VIEW ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "AVANTICONSULTA";
GRANT SELECT ON "PIRAMIDE"."VW_CLIENTES_PARA_INADIMPLENCIA" TO "USUARIOPIRAMIDE";
GRANT SELECT ON "PIRAMIDE"."VW_INTEGR_UNG_TI_CLIENTE" TO "USUARIOPIRAMIDE";
