select *
from employee, department;

select employee.eno, employee.ename,
department.dname, employee.dno
from employee, department
where employee.dno = department.dno
and employee.eno=7788;

select e.eno, e.ename, d.dname, e.dno
from employee e, department d
where e.dno = d.dno
and e.eno=7788;

/*natural join*/
select e.eno, e.ename, d.dname, dno/*���εǴ� �÷��� ��Ī ���̸� �ȵ�*/
from employee e natural join department d
where e.eno=7788;

/*using join*/
select e.eno, e.ename, d.dname, dno
from employee e join department d
using(dno)
where e.eno=7788;

/*on join*/
select e.eno, e.ename, d.dname, e.dno
from employee e join department d
on e.dno = d.dno
where e.eno=7788;

select * from salgrade;

/*non-equi join*/
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between s.losal and s.hisal;/*���������� �߸��Ǹ� ������ ��������*/

/*3���� ���̺� ����*/
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and e.salary between s.losal and s.hisal;


/*������̺�*/
select e.eno, e.ename, e.manager
from employee e;

/*�Ŵ������̺�*/
select m.eno, m.ename
from employee m;

/*self join*/
select e.eno �����ȣ, e.ename �����, m.eno �����ȣ, m.ename ����̸�
from employee e, employee m
where e.manager = m.eno(+);

select e.ename || '�� ���� ����� ' || m.ename
from employee e, employee m
where e.manager = m.eno(+); 

select * from department;
select * from employee;

select d.dno, d.dname, e.eno, e.ename
from department d, employee e
where d.dno = e.dno
order by d.dno;

select count(*)
from employee;