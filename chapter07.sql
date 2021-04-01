select ename, dno
from employee
where dno = (select dno
            from employee
            where ename='SCOTT');

select e.ename, e.dno
from employee e, employee m
where e.dno=m.dno and m.ename='SCOTT';

--�ּұ޿��� �޴� ����� �̸�, ������, �޿�
select ename ����̸�,job ������, salary �޿�
from employee
where salary = (select min(salary) from employee);

--�ִ�޿��� �޴� ����� �̸�, ������, �޿�
select ename ����̸�,job ������, salary �޿�
from employee
where salary = (select max(salary) from employee);

--30�μ��� �ּұ޿����� �ּ� �޿��� ū �μ� ���
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