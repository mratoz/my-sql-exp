set feedback off
set define off
prompt Dropping T_TST_ROWTOCOL...
drop table T_TST_ROWTOCOL cascade constraints;
prompt Creating T_TST_ROWTOCOL...
create table T_TST_ROWTOCOL
(
  id  NUMBER(2),
  val VARCHAR2(20)
)
;

prompt Loading T_TST_ROWTOCOL...
insert into T_TST_ROWTOCOL (id, val)
values (1, '11');
insert into T_TST_ROWTOCOL (id, val)
values (2, '12');
insert into T_TST_ROWTOCOL (id, val)
values (3, '13');
insert into T_TST_ROWTOCOL (id, val)
values (4, '14');
insert into T_TST_ROWTOCOL (id, val)
values (5, '15');
insert into T_TST_ROWTOCOL (id, val)
values (6, '16');
insert into T_TST_ROWTOCOL (id, val)
values (7, '17');
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
  FROM T_TST_ROWTOCOL T