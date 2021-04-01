/* Q1. FORD 사원과 같은 부서에 근무하는 사원의 정보를 검색하라. */
select *
from employee 
where dno = (select dno
             from employee
             where ename='FORD');
/* Q2. CHICAGO 지역에 위치하는 부서에 근무하는 사원의 정보를 검색하라. */
select *
from employee
where dno in (select e.dno
            from employee e, department d
            where e.dno=d.dno and d.loc='CHICAGO');
/* Q3. FORD 사원과 같은 급여를 받는 사원의 사원번호와 사원이름을 검색하라. */
select eno 사원번호, ename 사원이름
from employee
where salary = (select salary
                from employee
                where ename = 'FORD')
and ename <> 'FORD';
/* Q4. SCOTT 사원보다 많은 급여를 받는 사원 정보를 검색하라. */
select *
from employee
where salary > (select salary
                from employee
                where ename='SCOTT');
/* Q5. ALLEN 사원보다 적은 급여를 받는 사원 정보를 검색하라. */
select *
from employee
where salary < (select salary
                from employee
                where ename='ALLEN');
/* Q6. 20번 부서 사원의 사원직무와 같은 사원직무인 다른 부서의 사원 정보를 검색하라. */
select *
from employee
where job in (select job
             from employee
             where dno=20)
and dno <> 20;
/* Q7. 전체 사원의 평균 급여보다 급여가 많은 사원 정보를 검색하라. */
select *
from employee
where salary > (select round(avg(salary))
                from employee);
/* Q8. 급여가 모든 부서들의 평균 급여보다 많은 사원 정보를 검색하라 */
select *
from employee
where salary > all(select round(avg(salary))
                    from employee
                    group by dno);
/* Q9. 30번 부서의 최대 급여보다 최대 급여가 큰 부서의 번호와 최대 급여를 검색하라. */
select dno, max(salary)
from employee
group by dno
having max(salary) > (select max(salary)
                      from employee
                      where dno=30);