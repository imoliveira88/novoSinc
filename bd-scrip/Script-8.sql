-- Select para analisar integração

SELECT * FROM DEFINICAO_INTEGRACAO WHERE id IN (102,103,104,105,106,107,108,109, 110, 111);

-- Desativar integração
UPDATE DEFINICAO_INTEGRACAO SET ATIVO = 0 WHERE id IN (102,103,104,105,106,107,108,109, 110, 111);

-- Ativar integração
UPDATE DEFINICAO_INTEGRACAO SET ATIVO = 1 WHERE id IN (102,103,104,105,106,107,108,109, 110, 111);

SELECT * FROM REGISTRO ORDER BY DATA_INTEGRACAO DESC

SELECT * FROM DEFINICAO_INTEGRACAO

SELECT * FROM REGISTRO ORDER BY DATA_REGISTRO DESC

SELECT * FROM REGISTRO WHERE ID_ORIGEM = 206 ORDER BY DATA_INTEGRACAO DESC