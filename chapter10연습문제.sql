/*?/*Q1. ���(employee) ���̺�� ���� ������ t_emp ���̺��� �����Ͻÿ�
(eno�� primary key, dno�� �ܷ�Ű(department), salary�� NOT NULL ������������ �Ѵ�).*/
create table t_emp
as select * from employee;
alter table t_emp
    add constraint t_emp_eno_pk primary key(eno);
alter table t_emp
    add constraint t_emp_dno_fk foreign key(dno) references department (dno);
alter table t_emp
    modify salary constraint t_emp_salary_nn not null;
/*Q2. t_emp ���̺� ���� ���������� �˻��Ͻÿ�.*/
SELECT table_name, constraint_name
FROM user_constraints
WHERE table_name IN ('t_emp');
/*Q3. t_emp ���̺� �ܷ� Ű ���������� ��Ȱ��ȭ ��Ű�ÿ�. */
alter table t_emp
    disable constraint t_emp_dno_fk;
/*Q4. t_emp ���̺� �ܷ� Ű ���������� �ٽ� Ȱ��ȭ ��Ű�ÿ�. */
alter table t_emp
    enable constraint t_emp_dno_fk;
/*Q5. t_emp ���̺� �ܷ� Ű ���������� �����Ͻÿ�. */
alter table t_emp
    drop constraint t_emp_dno_fk;
/*Q6. t_emp ���̺��� �����Ͻÿ�. */
drop table t_emp;