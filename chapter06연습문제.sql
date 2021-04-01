/*Q1. 사원번호, 사원이름, 부서이름을 검색하라.*/
select e.eno 사원번호, e.ename 사원이름, d.dname 부서이름
from department d, employee e
where d.dno=e.dno;
/*Q2. 지역이 NEW YORK인 사원이름을 검색하라.*/
select e.ename 사원이름, d.loc 지역
from department d, employee e
where d.dno=e.dno and d.loc='NEW YORK';
/*Q3. ADAMS 사원이 근무 중인 부서이름과 지역을 검색하라.*/
select e.ename 사원이름, d.dname 근무부서, d.loc 근무지역
from department d, employee e
where d.dno=e.dno and e.ename = 'ADAMS';
/*Q4. 급여가 2000 이상인 사원들의 사원명과 지역, 급여를 검색하라.*/
select e.ename 사원명, d.loc 지역, e.salary 급여
from department d, employee e
where d.dno=e.dno and e.salary>=2000;
/*Q5. 급여가 1000 이상 2000 이하인 사원들의 사원번호, 사원이름, 부서이름을 사원번호 순으로 검색하라.*/
select e.eno 사원번호, e.ename 사원이름, d.dname 부서이름
from department d, employee e
where d.dno=e.dno and e.salary between 1000 and 2000
order by e.eno;
/*Q6. 사원직무가 SALESMAN이면서 CHICAGO 지역에 근무 중인 사원명과 지역을 검색하라.*/
select e.ename 사원명, d.loc 지역
from department d, employee e
where d.dno=e.dno and e.job='SALESMAN' and d.loc='CHICAGO';
/*Q7. NEW YORK이나 DALLAS 지역에 근무하는 사원들의 사원번호와 사원이름, 지역을 사원번호 순으로 검색하라.*/
select e.eno 사원번호, e.ename 사원이름, d.loc 지역
from department d, employee e
where d.dno=e.dno and d.loc in('NEW YORK','DALLAS')
order by e.eno;
/*Q8. 부서이름이 ACCOUNTING이거나, 지역이 CHICAGO인 사원의 사원번호와 사원이름, 부서명, 지역을 검색하라.*/
select e.eno 사원번호, e.ename 사원이름, d.dname 부서명, d.loc 지역
from department d, employee e
where d.dno=e.dno and (d.dname='ACCOUNTING' or d.loc='CHICAGO');
/*Q9. 사원번호, 사원이름, 급여, 급여등급을 급여등급별 급여가 많은 순으로 검색하라.*/
select e.eno 사원번호, e.ename 사원이름, e.salary 급여, s.grade 급여등급
from salgrade s, employee e
where salary between losal and hisal
order by s.grade, e.salary desc;
/*Q10. 사원번호, 사원이름, 상급자사원번호, 상급자이름을 검색하라.*/
select e.eno 사원번호, e.ename 사원이름, e.manager 상급자사원번호, m.ename 상급자이름
from employee e, employee m
where e.manager = m.eno;
/*Q11. BLAKE 사원보다 많은 급여를 받는 사원이름을 검색하라.*/
select ename 사원이름, salary 급여
from employee
where salary > (select salary from employee where ename='BLAKE');