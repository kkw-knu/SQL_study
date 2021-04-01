/*
��� ���ȸ���/���Ǽ� �������� ���̻���ϴ� ����̴�.
�Ϲ� ����ڿ��� �ش� �丸 ���ٱ��� �ο��ϰ� �߿��� �����Ͱ� �ܺο� �����Ǵ°��� �����Ѵ�.

��� �Ѹ���� �������� ���̺��� �ٰ��� ������ ���� ���̺��̶�� �����Ѵ�.
��ũ ���� ������ �Ҵ���� �ʴ´�.
������� ���̺��� �Ļ��� ��ü���̺�� �����ϴ�.

t_�� �����ϴ°� ���̺� v_�� �����ϴ°� ��
����-------------------------------------------------
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name
[(alias, alias, alias, ...)]
AS subquery
[WITH READ ONLY];
? OR REPLACE 
  ? �̹� �����ϴ� �信 ���ؼ� �� ������ ���Ӱ� �����Ͽ� �� ����
? FORCE
  ? �⺻ ���̺�(��������)�� ���� ���ο� ������� �� ����
? NOFORCE
  ? �ݵ�� ���� ���̺�(��������)�� ������ ��쿡�� �� ����

���� ����
? ��� �並 �����ϱ� ���ؼ� ���Ǵ� �⺻ ���̺�(��������)�� ���� ����
 �ܼ� ��(Simple View)�� ���� ��(Complex View)�� �����ϴ�.
? �ܼ� ��(simple view)�� �ϳ��� �⺻ ���̺�� ������ ���̸� DML ��ɹ��� ������ �� �ֽ��ϴ�.
  DML ��ɹ��� ó�� ����±⺻ ���̺� �ݿ��˴ϴ�. 
? ���� ��(complex view)�� �ΰ� �̻��� �⺻ ���̺�� ������ ���Դϴ�. (��ȸ�ۿ� �ȵ�Read����)

���� ó�����
��� �����͸� �����ϰ� ���� ���� ���� ���̺��̹Ƿ� ��ü��
�����ϴ�. �䰡 ���̺�ó�� ���� �� �ִ� ������ �並 ������ ��
CREATE VIEW ��ɾ� ������ AS ���� ����� ���� ���� ��ü��
�����ϰ� �ִٰ� �̸� �����ϱ� �����Դϴ�. 
? USER_VIEW ������ �������� �信 ���� ���Ǹ� ��ȸ�մϴ�.
? �⺻ ���̺� ���� ���� ���� ������ ���̴ϴ�.
? �信 ���� ���Ǹ� �⺻ ���̺� ���� ���Ƿ� ��ȯ�մϴ�.
? �⺻ ���̺� ���� ���Ǹ� ���� �����͸� �˻��մϴ�.
? �˻��� ����� ����մϴ�. 

�䰡 ���̻� �ʿ� ���� ���� DROP VIEW ���� �̿��Ͽ� �����Ѵ�
��� ��ü�� ���� �������̺��̱� ������ �並 �����ϴ� ���� USER_VIEWS ������ ��ųʸ���
����Ǿ� �ִ� ���� ���Ǹ� �����ϴ� ���� �ǹ��Ѵ�.
���� �並 �����ص� �並 ������ �⺻ ���̺��� ������ �����Ϳ��� ������ ��ġ�� �ʴ´�.


���� �ɼ� with check option�� ����ϸ�, �ش� �並 ���ؼ� �����ִ�
�������� update �Ǵ� insert�� �����ϴ�.

with read only�� ����ϸ� �ش� �並 ���ؼ��� select�� �����ϴ�.
*/

desc emp_second;
desc dept_second;

drop table emp_second;
drop table dept_second;

create table emp_second
as select * from employee;

create table dept_second
as select * from department;

/*�ܼ� �� �����*/
create view v_emp_job(���, ����̸�, �μ���ȣ, ������)--Į������ �����ϸ� �⺻���̺��� Į������ ��ӹ޴´�
as
select eno, ename, dno, job
from emp_second
where job like 'SALESMAN';

desc v_emp_job;

select * from v_emp_job;

insert into v_emp_job
values(7955, 'TEST',30,'SALESMAN');--�ܼ���� �׳� �� �߰� ����

/*���� �� �����*/
create view v_emp_complex
as
select e.eno, e.ename, e.job, e.salary, e.dno, d.dname, d.loc
from emp_second e, dept_second d
where e.dno = d.dno;

select eno,loc from v_emp_complex; --��� ������ �ʿ���� �ܼ� �˻������� ��밡���ϴ�.

create or replace view v_emp_complex
as
select e.eno, e.ename, e.job, e.dno, d.dname, d.loc
from emp_second e, dept_second d
where e.dno = d.dno;

/*user_views ������ ���� ���Ǳ�*/
select view_name, text
from user_views;

/*�信 �׷��Լ��� ����Ҷ� �׻� Į�� ��Ī�� �������� �Ѵ�.
��Ī �̻��� ������ �߻��Ѵ�.*/
create or replace view v_emp_salary
as
select dno, sum(salary) as "sal_sum", avg(salary) as "sal_avg"
from emp_second
group by dno;

select * from v_emp_salary;

drop view v_emp_salary;
drop view v_emp_complex;
drop view v_emp_job;

create or replace view v_emp_job
as
select eno, ename, dno, job, salary
from emp_second
where job = 'SALESMAN';

insert into v_emp_job
values(7955, 'TEST', 30, 'abcd');

select * from v_emp_job;

/*with check option*/
create or replace view v_emp_job(���, ����̸�, �μ���ȣ, ������)
as
select eno, ename, dno, job
from emp_second
where job like 'SALESMAN'
with check option;--�̷��� ����� ���� �������� update �� insert ����

create or replace view v_emp_job_chk
as
select eno, ename, dno, job
from emp_second
where job = 'MANAGER'
with check option;

insert into v_emp_job_chk
values(9000,'�Ŵ�', 30,'coding');

select * from v_emp_job_chk;
select * from emp_second;

/*with read only*/
create or replace view v_emp_jop_readonly
as
select eno, ename, dno, job
from emp_second
where job = 'MANAGER'
with read only; -- �� ������ ����ϸ� �߰� �ȵ�