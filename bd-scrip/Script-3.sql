--Logado como SYS

grant select on V_$VERSION to SOFTEX;
grant select on V_$PARAMETER to SOFTEX;
grant select on V_$INSTANCE to SOFTEX;

ALTER SYSTEM SET OPEN_CURSORS=5000 SCOPE=BOTH