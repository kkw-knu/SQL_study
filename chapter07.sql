select ename, dno
from employee
where dno = (select dno
            from employee
            where ename='SCOTT');

select e.ename, e.dno
from employee e, employee m
where e.dno=m.dno and m.ename='SCOTT';

--최소급여를 받는 사원의 이름, 담당업무, 급여
select ename 사원이름,job 담당업무, salary 급여
from employee
where salary = (select min(salary) from employee);

--최대급여를 받는 사원의 이름, 담당업무, 급여
select ename 사원이름,job 담당업무, salary 급여
from employee
where salary = (select max(salary) from employee);

--30부서의 최소급여보다 최소 급여가 큰 부서 출력
select dno, min(salary)
from employee
group by dno
having min(salary)>(select min(salary)
                    from employee
                    where dno=30);
                    
select eno, ename, dno, salary
from employee
where salary in ( select min(salary)
                    from employee
                    group by dno);
/*any*/                   
select eno, ename, job, salary
from employee
where salary > any ( select salary
                    from employee
                    where job='SALESMAN')
and job <> 'SALESMAN';

select eno, ename, job, salary
from employee;

select eno, ename, job, salary
from employee
where job='SALESMAN';

select eno, ename, job, salary
from employee
where salary < all ( select salary
                    from employee
                    where job='SALESMAN')
and job <> 'SALESMAN';