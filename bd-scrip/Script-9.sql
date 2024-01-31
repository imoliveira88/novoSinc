select id, ano_mes_faturamento, observacao from leitura_movimento where data_leitura between TO_DATE('01-10-2020','DD-MM-YYYY') and current_date order by ID desc -- observacao, ID equivalente ao LEMO_CD da tabela analoga, numero_serie_medidor (o mesmo para a tabela equivalente no GGASP)
select * from ANORMALIDADE_LEITURA 242272
--IP do srvcoper035 192.168.1.227

select * from leitura_movimento where  order by ID desc

select * from medicao where leitura_id = 242272 --campo observacao