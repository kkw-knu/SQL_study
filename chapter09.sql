--insert��
create table dept_copy
as
select * from department where 0=1;

desc dept_copy;
select * from dept_copy;

insert into dept_copy
values(10,'ACCOUNTING','NEWYORK');
/*������ ������ �ʰ� �־����Ƿ� desc ������ �°� �־����*/

insert into dept_copy(dno, dname, loc)
values(20,'RESEARCH','DALLAS');
/*������ �ƴ� �ٸ������ Ȯ���Ҷ��� �������� ������ ������ ���ϰ�
�����Ͱ��� �־��ִ� ���� ����*/

/*null���� ���� �ο츦 �����Ҷ� �Ͻ�������� ����� ������ִ�.*/
/*�Ͻ��� ���*/
insert into dept_copy (dno, dname)
values (30, 'SALES') ;

/*����� ���*/
insert into dept_copy
values (40, 'OPERATIONS', NULL ) ;
/*null�� ǥ���ϴ� ����� �ϳ� ���ִ�.*/
insert into dept_copy
values (50, 'IT', '' ) ;


ROLLBACK;
/*�����͸� �߸��Է������� rollback�� �Է��ϸ� Ʈ����� ó���� ���� �ȳ����Ƿ�
insert�� �ԷµǱ� ������ �ǵ�����.*/
COMMIT;
/*
������ �Է��� �Ϸ������� commit�� �Է��ϸ� Ʈ����� ó���� ������.
DDL���� ��� ��ü�� �ϳ��� Ʈ����� ó�������� DML���� 
Ʈ������� ������ �˸��� ����̰� rollback�̳� commit���� Ʈ������� �����Ų��.
commit�� �����ϰ� ������ rollback�� ���� �ʴ´�.
Ʈ������̶� �ϳ��� �۾�����
*/

create table emp_copy
as
select eno, ename, job, hiredate, dno from employee where 0=1;
/*��¥ �����͸� �Է��ϱ� ���ؼ��� �ý��ۿ��� �䱸�ϴ� ��¥������ ����ؾ��Ѵ�
oracle�� ��쿡�� 'YYYY/MM/DD'�� ������ ������*/
insert into emp_copy
values(7000, 'CANDY', 'MANAGER', '2012/05/01',10);

/*to_date�� ����� ��¥ �Է��ϱ�*/
insert into emp_copy
values(7010,'TOM','MANAGER',to_date('2020.08.01','YYYY.MM.DD'),20);

/*���� ��¥ �ֱ�*/
insert into emp_copy
values(7010,'JERRY','SALESMAN',sysdate,30);

/*insert into ������ values�� ��� ���������� ��������ν� �ٸ� ���̺��� ������ ���簡��*/
select * from dept_copy;
delete from dept_copy;
insert into dept_copy
select * from department;




--update��
/*update���� ���̺� ����� �����͸� �����ϱ� ���� DML�̴�*/
/*where ���� Ư�� �ο츸 �����ϴ� �ڵ�*/
update dept_copy
set dname = 'PROGRAMMING'
where dno = 10;

/*where���� �����ϸ� ��� �ο찡 �ٲ��.*/
update dept_copy
set dname = 'HR';

/*Į���� �������� �ѹ��� ���������ϴ�*/
update dept_copy
set dname = 'PROGRAMMING',
    loc = 'SEOUL'
where dno = 10;

/*�ٸ� ���̺� ������� �÷� ���� �����ϱ�*/
update dept_copy
set loc = (select loc from department where dno=20)
where dno = 10;

/*�ٸ����̺� ������� ���� �÷��� �ٲٱ�*/
update dept_copy
set dname = (select dname from dept_copy where dno=30),
    loc = (select loc from dept_copy where dno=30)
where dno = 10;



--delete��
/*delete���� ����Ͽ� ������ ����� �����͸� ������ �� �ִ�.*/
/*where���� �����ϸ� ���̺� �ִ� ��� ���� ���ŵȴ�*/
delete from dept_copy
where dno = 10;

/*delete���� ���������� ����Ͽ� ���̺� �ٸ� ���̺� ��������� �ο츦 ���� �����ϴ�*/
delete from dept_copy;

select * from dept_copy;

/*
Ʈ�����(Transaction)�� ������ ó������ �������� �ϳ��� �۾�
������ �ǹ��մϴ�.
Oracle ��ɾ� �߿��� DDL�� DCL�� �ϳ��� ��ɾ �ϳ���
Ʈ������̸�, DML�� ������ ������ �ϰ����� ���� �ϳ� �̻���
DML���� �� �ϳ��� Ʈ������� �����մϴ�.
All ? OR ? Nothing : ���� ���� ��ɾ� ������ ���������� ó���Ǹ�
���� �����ϰ�, ��ɾ�� �� �ϳ��� �߸��ȴٸ� ��ü�� �����
�����ϴ�.
DML���� ����ʰ� ���ÿ� Ʈ������� ����˴ϴ�. DML �۾���
���������� ó���Ǿ��ٸ� COMMIT��, ����ؾ� �Ѵٸ� ROLLBACK
����� �����մϴ�. 
COMMIT�� Ʈ������� ó�� ������ �ݿ��Ͽ� ����� ������ ��� ����
�����մϴ�. 
ROLLBACK�� Ʈ������� ó�� ���� �� �߻��� ���� ������ ����ϴ�
��ɾ��Դϴ�. ROLLBACK�� �����ϰ� �Ǹ� �ϳ��� ���� ó����
���۵Ǳ� ���� ���·� ���ư��ϴ�. 
*/

?/*�ǽ������� ���� 3�� ���̺� �����Ͽ� ���ο� ���̺��� �����Ѵ�.*/
create table t_emp
as select * from employee where dno in (20,30);

create table t_dept
as select * from department;

create table t_salgrade
as select * from salgrade;

/*Q1.�����ȣ 7703, ����̸� JOSH, ������� SALESMAN, ����ڻ����ȣ 7566, �޿� 1400, Ŀ�̼� 0, �μ���ȣ 20�� ����� ���� �Ի��Ͽ���. ��������� ����Ͻÿ�.*/
insert into t_emp(eno, ename, job, manager, hiredate, salary, commission, dno)
values(7703,'JOSH','SALESMAN',7566,sysdate,1400,0,20);
/*Q2.�����ȣ 7401, ����̸� HOMER, �޿� 1300, �μ���ȣ 10�� ����� ���� �Ի��Ͽ���. ��������� ����Ͻÿ�.*/
insert into t_emp(eno, ename, salary, dno)
values(7401,'HOMER',1300,10);
/*Q3.�����ȣ 7323, ����̸� BRANDA, �μ���ȣ 30, �����ȣ 7499�� ������ �޿��� �޴� ����� ���� �Ի��Ͽ���. ��������� ����Ͻÿ�.*/
insert into t_emp(eno, ename, dno, salary)
values(7323,'BRANDA',30,(select salary from t_emp where eno=7499));
/*Q4.���(employee) ���̺��� �μ���ȣ�� 10�� �����͸� t_emp ���̺� �Է��Ͻÿ�.*/
insert into t_emp
select * from employee where dno=10;
/*Q5.�����ȣ 7369�� ��������� ANALYST�� �ٲٽÿ�.*/
update t_emp
set job='ANALYST'
where eno=7369;
/*Q6.�μ���ȣ 20�� �������� �޿��� 100 �谨�Ͻÿ�.*/
update t_emp
set salary=salary-100
where dno=20;
/*Q7.��� ����� �޿��� 200 �λ��Ͻÿ�.*/
update t_emp
set salary=salary+200;
/*Q8.�����ȣ 7902�� ����ڻ����ȣ�� 7654, �μ���ȣ�� 30���� �ٲٽÿ�.*/
update t_emp
set manager=7654,
    dno=30
where eno=7902;
/*Q9.������ DALLAS�� ������� �޿��� 10 �谨�Ͻÿ�.*/
update t_emp
set salary=salary-10
where dno in (select e.dno
            from t_emp e,t_dept d
            where e.dno=d.dno and d.loc='DALLAS');
/*Q10. �޿������ 2�� ������� �޿��� 20 �谨�Ͻÿ�.*/
update t_emp
set salary=salary-20
where salary in (select e.salary
                from t_emp e, t_salgrade s
                where e.salary between s.losal and s.hisal and s.grade=2);
/*Q11. �����ȣ 7499�� ����Ͽ���. ��������� �����Ͻÿ�. */
delete from t_emp
where eno=7499;
/*Q12. �μ������� �μ���ȣ 50, �μ��̸� 'PLANNING', ���� 'MIAMI'�� �߰��Ͻÿ�.*/
insert into t_dept(dno,dname,loc)
values(50,'PLANNING','MIAMI');
/*Q13. �μ���ȣ�� 40�� �μ��� 60���� ����Ǿ���.*/
update t_dept
set dno=60
where dno=40;
/*Q14. �μ���ȣ�� 30�� �μ��� ���Ǿ���.*/
delete from t_dept
where dno=30;
/*Q15. t_dept ���̺� ���� �μ���ȣ�� ���� �ִ� ������� �μ���ȣ�� 99�� �����Ͻÿ�.*/
update t_emp
set dno=99
where dno not in (select dno from t_dept);
/*Q16. t_emp���� �μ��� 99�� ������ �����Ͻÿ�.*/
delete from t_emp
where dno=99;
/*Q17. ����ڻ����ȣ�� ���� ����� �޿��� 100 �λ��Ͻÿ�.*/
update t_emp
set salary=salary+100
where manager is null;
/*Q18. JONES, JOSH, CLARK�� 30�� �μ��� �����Ͻÿ�.*/
update t_emp
set dno=30
where ename in ('JONES','JOSH','CLARK');
/*Q19. Ŀ�̼��� NULL�� �����͸� 0���� �����Ͻÿ�.*/
update t_emp
set commission=0
where commission is null;
/*Q20. t_emp, t_dept, t_salgrade ���̺��� �����͸� �����Ͻÿ�.*/
delete from t_emp;
delete from t_dept;
delete from t_salgrade;
/*�ǽ������� ������ 3�� ���̺� �����Ͻÿ�.*/
drop table t_emp;
drop table t_dept;
drop table t_salgrade;