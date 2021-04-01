/*
�������� �ε���
�������� �ڵ���ȣ �߻�
�ε����� ��ȸ�� ������ ���(������ ����)
*/

--������ ����¹��
create sequence sample_seq
increment by 10
start with 10;

/*
������ ���� ������ ��ųʸ�
sequence_name�� ������ ��ü�� �̸�
min_value�� �ּҰ�, max_value�� �ִ밪
increment_by�� ����ġ�� ���� ����
cycle_flag�� cycle�ɼ��� ����ϴ���, �����ʴ����� ���� ����
*/
select * from user_sequences;

/*
currval : �������� ���� ���� �˾Ƴ��� �Լ�
nextval : �������� ���� ���� �˾Ƴ��� �Լ�
currval�� ���ο� ���� �Ҵ�Ǳ� ���ؼ��� nextval�� ���ο� ���� �����ؾ� �Ѵ�.
�� nextval�� ���ο� ���� ������ ������ �� ���� currval�� ��ü�ϰ� �ȴ�.
*/
select sample_seq.nextval from dual;
select sample_seq.currval from dual;

/*
����Ҽ� �ִ� ���
���������� �ƴ� select��
insert���� select��
insert ���� value��
update���� set��
����Ҽ� ���� ���
view�� select��
distinct Ű���尡 �ִ� select��
group by, having, order by���� �ִ� select��
select, delete, update�� ��������
create table, alter table �꿵�� default��
*/

create sequence dno_seq
increment by 10
start with 10;

delete from dept_second;
select * from dept_second;

insert into dept_second
values(dno_seq.nextval, 'ACCOUNTING','NEW YORK');
/*�������� �����Ϸ��� alter sequence���� ����ؾ� �Ѵ�.*/
alter sequence dno_seq
maxvalue 50;

/*������ �����ϱ�*/
drop sequence dno_seq;

/*
��ȸ�� ���� ����� ���� �ε���
�ε��� ��ü�� ���� ������ USER_COLUMNS��
USER_IND_COLUMNS ������ ������ ���ؼ� ���캼 �� �ֽ��ϴ�.
�⺻ Ű�� ���� Ű�� �ε����� �ڵ����� �����˴ϴ�
*/
--index�����
create index idx_employee_ename
on employee(ename);

--index Ȯ���ϱ�
select index_name, table_name, column_name
from user_ind_columns
where table_name in('EMPLOYEE');

--index �����ϱ�
drop index user_ind_columns;

/*
�ε����� ����� ��
���̺� ���� ���� ���� ��
where���� �ش� �÷��� ���� ���� ��
�˻� ����� ��ü �������� 2%~4%���� �϶�
join�� ���� ���Ǵ� �÷��̳� null�� �����ϴ� �÷��� ���� ���

�ε����� ������� ���ƾ� �� ��
���̺� ���� ���� ���� ��
where���� �ش� Į���� ���� ������ ���� ��
�˻� ����� ��ü �������� 10~15%�̻��� ��
���̺� DML�۾��� ���� ��� ��, �Է� ���� �������� ���� �Ͼ��


������ ���� ������ ���ο� ����
���� �ε���(Unique Index) /�� ���� �ε���(NonUnique Index)
�ε����� �����ϴ� Į���� ������ ����
���� �ε���(Single Index)/���� �ε���(Composite Index)
�Լ��� �ε����� �����ϴ�
�Լ� ��� �ε���(Function Based Index)
*/

alter index idx_employee_ename rebuild;

/*ȥ���غ���*/
create sequence emp_seq
start with 1
increment by 1
maxvalue 100000;

create table emp01(
empon number(10) primary key,
ename varchar2(10),
hiredate date
);
    
--�����ȣ ���� : �⵵ 4�ڸ� + �Ϸù�ȣ 6�ڸ�
--20210000002

insert into emp01
values(to_char(sysdate,'YYYY')||lpad(emp_seq.nextval,6,0),'jalia',sysdate);

select * from emp01;

--�̸� Į���� �ε����� �����ϱ�
create index idx_emp01_ename
on emp01(ename);