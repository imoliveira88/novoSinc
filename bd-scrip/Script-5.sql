--08NOV

SELECT * FROM PIR_ITEM_SOLICITACAO_VIAGEM WHERE NUM_SOLICITACAO = 1301

DELETE FROM PIR_ITEM_SOLICITACAO_VIAGEM WHERE NUM_SOLICITACAO = 1301 AND NUM_ITEM = 3 -- violação em PIRAMIDE.FK_ITSOLVIA_ITSOLCPR

SELECT * FROM PIR_ITEM_SOLIC_VIAGEM_RAT_ORC WHERE NUM_SOLICITACAO = 1301

SELECT * FROM ITEM_SOLICITACAO WHERE NUM_SOLICITACAO_VIAGEM = 1301

DELETE FROM ITEM_SOLICITACAO WHERE NUM_SOLICITACAO_VIAGEM = 1301  -- violação em PIRAMIDE.FK_ITSOL_ITSOLVG

SELECT * FROM ITENS_PED_COMPRA

SELECT * FROM PIR_ITEM_SOL_CMP_RAT_ORC

--FK_ITSOLVIA_ITSOLCPR
PIRAMIDE.FK_ITSOLVIA_ITSOLCPR

SELECT a.table_name, a.column_name, a.constraint_name, c.owner, c.r_owner, c_pk.table_name r_table_name, c_pk.constraint_name r_pk
FROM all_cons_columns a
JOIN all_constraints c ON a.owner = c.owner AND a.constraint_name = c.constraint_name
JOIN all_constraints c_pk ON c.r_owner = c_pk.owner AND c.r_constraint_name = c_pk.constraint_name
WHERE c.constraint_type = 'R' AND a.table_name = 'ITEM_SOLICITACAO'


SELECT a.table_name, a.column_name, a.constraint_name, c.owner, 
       c.r_owner, c_pk.table_name r_table_name, c_pk.constraint_name r_pk
  FROM all_cons_columns a
  JOIN all_constraints c ON a.owner = c.owner
                        AND a.constraint_name = c.constraint_name
  JOIN all_constraints c_pk ON c.r_owner = c_pk.owner
                           AND c.r_constraint_name = c_pk.constraint_name
 WHERE c.constraint_type = 'R'
   AND a.table_name = 'ITEM_SOLICITACAO'