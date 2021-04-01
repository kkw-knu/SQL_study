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

select sysdate-1 어제,
       sysdate   오늘,
       sysdate+1 내일
from dual;

select trunc(MONTHS_BETWEEN(sysdate, hiredate) )
from employee;

select sysdate, round(sysdate,'yyyy'),round(to_date('2021/08/09'),'yyyy')
from dual;

select sysdate - hiredate 근무일수
from employee;

select ename, hiredate, ADD_MONTHS(hiredate, 6) "+6개월"
from employee;

select sysdate, NEXT_DAY(sysdate,'토요일') 첫토요일
from dual;
select sysdate, LAST_DAY(sysdate) 마지막날
from dual;

select ename, hiredate,
        to_char(hiredate, 'YY-MM') 년월,
        to_char(hiredate, 'YYYY-MM-DD DAY') 년월일요일,
        to_char(hiredate, 'YYYY-MM-DD DY') 년월일요일_1,
        to_char(hiredate, 'YYYY-MM-DD HH:MI:SS') 년월일시간
from employee;

select ename, salary, to_char(salary, 'L000,000'),
                      to_char(salary, 'L999,999')
from employee;

select ename, salary,
            to_char(last_day(sysdate),'dd') "월일수",
            round(salary/to_char(last_day(sysdate),'dd')) "일당",
            to_char(sysdate,'dd')-to_char(trunc(sysdate,'MONTH'),'DD') +1 "근무일수",
            round(salary/to_char(last_day(sysdate),'dd'))
            * to_char(sysdate,'dd')-to_char(trunc(sysdate,'MONTH'),'DD') +1 "급여일할계산"
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
        salary * 12 +nvl(commission,0) 연봉
from employee
order by 연봉 desc;

select eno, ename, salary, commission,
        salary * 12 +nvl2(commission,salary*12 +commission,salary*12) 연봉
from employee
order by 연봉 desc;

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