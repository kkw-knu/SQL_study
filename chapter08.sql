--���̺� ����
CREATE TABLE dept (
        dno     number(2),
        dname   varchar2(14),
        loc     varchar2(13)
    ) ;
        
desc dept;

select * from dept;

create table dept_second
as select * from department;

desc dept_second;

select * from dept_second;

--�μ��� 20�� ����鸸 ������ �ְ������
create table dept20
as 
select eno, ename, salary*12 annsal
from employee
where dno=20;
--�̷��� �������µ� ��������� �ѰŴ� Į���� ��Ī�� �������

desc dept20;

select * from dept20;

--�μ� ���̺� ������ �����
create table dept_third
as
select dno, dname
from dept_second
--��������� ���ΰ�����
where 0=1;--�̰� ������¾ȵǴ� ���ǹ�

desc dept_third;

select * from dept_third;

create table  employee_backup_20210304
as
select * from employee;

--�Ʊ�� dept20 ���̺� ���ο� Į���� �ִ°���
alter table dept
add(birth DATE);

desc dept;

select * from dept20;

--���ʿ� ename�� ������ varchar2(10)�̿���.
alter table dept
      modify dname varchar2(30);
      
alter table dept
drop column birth;
            
alter table dept20
      drop column ename;
      
alter table dept
set unused (dno);
--desc/select���� ���� ������ �ʴ´�.

alter table dept
drop unused columns;
--unused�� �÷����� �����Ѵ�.

rename dept to emp;

desc emp;

--���̺��� ������ ����  �⺻Ű�� ����Ű�� �ٸ� ���̺��� �����ϰ� �̾������
--������ �Ұ����ϱ� ������ �׷� ��� �������� �ڽ����̺��� ���� �����ؾ� �Ѵ�.
drop table emp;
--�μ����̺��� �θ�//������̺��� �ڽ�
--�θ� �����Ϸ��� �ϸ� ������̺��� �μ����̺��� �����ϰ� �ֱ⶧����
--������ �Ұ����ϴ� �׷��� ������̺� �ִ� ����Į���� ������
--�μ����̺��� �����Ҽ��ִ�.

select * from emp20;
--�����Ǽ� �Ⱥ��δ�.
select * from dept_second;

truncate table dept_second;
--Į���� ���Եǰ�(���̺��� ����������) ��� ������(�ο�)�� ��������
--�ε���, �� ���� �״�� ������ �ȴ�.

--user ������ ����
select table_name from user_tables;
select table_name from user_indexes;

--all ������ ����
 SELECT owner, table_name FROM all_tables ;
 
--dba �����ͻ���
SELECT owner, table_name FROM dba_tables ;
--�ý��� ������ ���� ���̵�� ���� �Ұ����ϴ� system�������� �����ؾ� �Ѵ�.
create table t_emp as select * from employee;
alter table t_emp add(gender char(1));
alter table t_emp modify gender varchar2(10);
alter table t_emp drop column gender;
truncate table t_emp;
drop table t_emp;
select * from t_emp;