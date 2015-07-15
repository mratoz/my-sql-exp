set feedback off
set define off
prompt Dropping T_TST_ROWTOCOL...
drop table T_TST_ROWTOCOL cascade constraints;
prompt Creating T_TST_ROWTOCOL...
CREATE TABLE t_tst_rowtocol
(
  ID   VARCHAR2(2),
  val  NUMBER(10)
)
;

prompt Loading T_TST_ROWTOCOL...
insert into T_TST_ROWTOCOL (val, ID)
values (1, '1');
insert into T_TST_ROWTOCOL (val, ID)
values (2, '2');
insert into T_TST_ROWTOCOL (val, ID)
values (3, '3');
insert into T_TST_ROWTOCOL (val, ID)
values (4, '4');
insert into T_TST_ROWTOCOL (val, ID)
values (5, '5');
insert into T_TST_ROWTOCOL (val, ID)
values (6, '6');
insert into T_TST_ROWTOCOL (val, ID)
values (7, '7');
commit;
prompt 7 records loaded
set feedback on
set define on
prompt Done.

-- Solution
SELECT SUM(DECODE(T.ID, 1, T.VAL, 0)) AS JAN,
       SUM(DECODE(T.ID, 2, T.VAL, 0)) AS FEB,
       SUM(DECODE(T.ID, 3, T.VAL, 0)) AS MAR,
       SUM(DECODE(T.ID, 4, T.VAL, 0)) AS APR,
       SUM(DECODE(T.ID, 5, T.VAL, 0)) AS MAY,
       SUM(DECODE(T.ID, 6, T.VAL, 0)) AS JUN,
       SUM(DECODE(T.ID, 7, T.VAL, 0)) AS JUL,
       SUM(DECODE(T.ID, 8, T.VAL, 0)) AS AUG,
       SUM(DECODE(T.ID, 9, T.VAL, 0)) AS SEP,
       SUM(DECODE(T.ID, 10, T.VAL, 0)) AS OCT,
       SUM(DECODE(T.ID, 11, T.VAL, 0)) AS NOV,
       SUM(DECODE(T.ID, 12, T.VAL, 0)) AS DEC
  FROM T_TST_ROWTOCOL T;
-- Another solution
SELECT SUM(CASE WHEN T.ID = 1 THEN T.VAL ELSE 0 END) AS JAN,
       SUM(CASE WHEN T.ID = 2 THEN T.VAL ELSE 0 END) AS FEB,
       SUM(CASE WHEN T.ID = 3 THEN T.VAL ELSE 0 END) AS MAR,
       SUM(CASE WHEN T.ID = 4 THEN T.VAL ELSE 0 END) AS APR,
       SUM(CASE WHEN T.ID = 5 THEN T.VAL ELSE 0 END) AS MAY,
       SUM(CASE WHEN T.ID = 6 THEN T.VAL ELSE 0 END) AS JUN,
       SUM(CASE WHEN T.ID = 7 THEN T.VAL ELSE 0 END) AS JUL,
       SUM(CASE WHEN T.ID = 8 THEN T.VAL ELSE 0 END) AS AUG,
       SUM(CASE WHEN T.ID = 9 THEN T.VAL ELSE 0 END) AS SEP,
       SUM(CASE WHEN T.ID = 10 THEN T.VAL ELSE 0 END) AS OCT,
       SUM(CASE WHEN T.ID = 11 THEN T.VAL ELSE 0 END) AS NOV,
       SUM(CASE WHEN T.ID = 12 THEN T.VAL ELSE 0 END) AS DEC
  FROM T_TST_ROWToCOL T;  