select 'Oracle mania',
UPPER('Oracle mania'),
LOWER('Oracle mania'),
INITCAP('Oracle mania')
from dual;

select * from employee
order by salary desc, ename asc;

select concat('Oracle',' mania')
from dual;

select substr('Oracle mania',3,4)
from dual;

select INSTR('Oracle mania', 'a',1,3)
from dual;

select * 
from employee
where substr(hiredate,3,2) = '81';

select RPAD(salary,10,'*')
from employee;

select * from employee where instr(ename,'A',3,1) =3;

select trim ('O' from 'OOOracle mania')
from dual;

select 98.7654, round(98.7654), round(98.7654,2),
round(98.7654,-1) from dual;

select 98.7654, trunc(98.7654), trunc(98.7654,2),
trunc(98.7654,-1) from dual;

select mod(2,3) from dual;

select sysdate
from dual;

select sysdate-1 ����,
       sysdate   ����,
       sysdate+1 ����
from dual;

select trunc(MONTHS_BETWEEN(sysdate, hiredate) )
from employee;

select sysdate, round(sysdate,'yyyy'),round(to_date('2021/08/09'),'yyyy')
from dual;

select sysdate - hiredate �ٹ��ϼ�
from employee;

select ename, hiredate, ADD_MONTHS(hiredate, 6) "+6����"
from employee;

select sysdate, NEXT_DAY(sysdate,'�����') ù�����
from dual;
select sysdate, LAST_DAY(sysdate) ��������
from dual;

select ename, hiredate,
        to_char(hiredate, 'YY-MM') ���,
        to_char(hiredate, 'YYYY-MM-DD DAY') ����Ͽ���,
        to_char(hiredate, 'YYYY-MM-DD DY') ����Ͽ���_1,
        to_char(hiredate, 'YYYY-MM-DD HH:MI:SS') ����Ͻð�
from employee;

select ename, salary, to_char(salary, 'L000,000'),
                      to_char(salary, 'L999,999')
from employee;

select ename, salary,
            to_char(last_day(sysdate),'dd') "���ϼ�",
            round(salary/to_char(last_day(sysdate),'dd')) "�ϴ�",
            to_char(sysdate,'dd')-to_char(trunc(sysdate,'MONTH'),'DD') +1 "�ٹ��ϼ�",
            round(salary/to_char(last_day(sysdate),'dd'))
            * to_char(sysdate,'dd')-to_char(trunc(sysdate,'MONTH'),'DD') +1 "�޿����Ұ��"
from employee;

select ename, hiredate
from employee
where hiredate = to_date('19810220','YYYYMMDD');

select ename, hiredate
from employee
where hiredate = '19810220';

select TO_NUMBER('100,000','999,999') - TO_NUMBER('50,000', '99,999')
from dual;

select eno, ename, salary, commission,
        salary * 12 +nvl(commission,0) ����
from employee
order by ���� desc;

select eno, ename, salary, commission,
        salary * 12 +nvl2(commission,salary*12 +commission,salary*12) ����
from employee
order by ���� desc;

select nullif('A', 'A'), nullif('A','B')
from dual;

select ename, dno,
        decode(dno, 10, 'ACCOUTING',
                    20, 'RESEARCH',
                    30, 'SALES',
                    40, 'OPERATIONS',
                    'DEFAULT') AS DNAME
from employee
order by dno;

select ename, dno,
        CASE dno WHEN 10 THEN 'ACCOUTING'
                 WHEN 20 THEN 'RESEARCH'
                 WHEN 30 THEN 'SALES'
                 WHEN 40 THEN 'OPERATIONS'
                 ELSE 'DEFAULT'
        END AS DNAME
from employee
order by dno;