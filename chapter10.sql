desc dept_second;
desc dept_third;
drop table dept_third;

create table dept_second(
    dno     number(2)    constraint pk_dept_second primary key,
    dname   varchar2(14),
    loc     varchar2(13)
);
/*Į�� ����*/
/*���̺� ����*/
/*Į�������δ� ��Ƽ�� �����̸Ӹ�Ű�� �� �� ���⶧���� ���̺� ������ ���� ���̴�.*/
create table dept_third(
    dno     number(2),
    dname   varchar2(14),
    loc     varchar2(13),
    constraint pk_dept_third primary key(dno)
);

/*not null�� Į�������θ� ���� �����ϴ�*/
create table customer(
    id      varchar2(20) not null,
    pwd     varchar2(20) not null,
    name    varchar2(20) not null,
    phone   varchar2(30),
    address varchar2(100)) ;

desc customer;
insert into customer
values(null,null,null,'010-1234-1234','SEOUL');
insert into customer
values('abcde','0000','�Ŵ�','010-1234-1234','SEOUL');
select * from customer;

drop table customer;
/*UNIQUE*/
create table customer(
    id      varchar2(20) unique,
    pwd     varchar2(20) not null,
    name    varchar2(20) not null,
    phone   varchar2(30),
    address varchar2(100)) ;
    
insert into customer
values('abcde','0000','�Ŵ�','010-1234-1234','SEOUL');
insert into customer
values('abcde','0001','�Ŵ�1','010-1234-1234','SEOUL');
/*���� �ߺ��� �ȵǴ°��� null�� ��� ��*/

/*���������� �̸� �����ϱ�*/
create table customer(
    id      varchar2(20) constraint customer_id_uk unique,
    pwd     varchar2(20) constraint customer_pwd_nn not null,
    name    varchar2(20) constraint customer_name_nn not null,
    phone   varchar2(30),
    address varchar2(100)) ;
    
desc customer;
/*�������� Ȯ���ϱ�*/
SELECT *
FROM user_constraints
WHERE table_name IN ('CUSTOMER');

drop table customer;

create table customer(
    id      varchar2(20) ,
    pwd     varchar2(20) constraint customer_pwd_nn not null,
    name    varchar2(20) constraint customer_name_nn not null,
    phone   varchar2(30),
    address varchar2(100),
    constraint customer_id_pk primary key(id)
);
/*primary key�� unique + nou null�̴�*/

desc emp_second;

create table emp_second(
    eno     number(4) constraint emp_second_eno_pk primary key,
    ename   varchar2(10),
    job     varchar2(9),
    dno     number(2) constraint emp_secnod_dno_fk references department);

insert into emp_second
values(1234,'asd','�Ŵ�1',50);
/*
eno�� �����̸Ӹ�Ű�� �ߺ��̾ȵǰ� dno�� department�� �����ϱ⶧���� 
�ű⿡ �ִ� ���� �ƴϸ� �Է��� ���� �ʴ´�.
*/
select * from department;
drop table emp_second;

create table emp_second(
    eno     number(4) constraint emp_second_eno_pk primary key,
    ename   varchar2(10),
    salary     number(7,2) constraint emp_secnod_salary_check check (salary>0));
    
insert into emp_second(eno,ename,salary)
values(1234,'asd',-100);
drop table emp_second;

create table emp_second(
    eno     number(4) constraint emp_second_eno_pk primary key,
    ename   varchar2(10),
    salary     number(7,2) default 0);
    
insert into emp_second(eno,ename)
values(1234,'asd');

select * from emp_second;

create table emp_copy
as select * from employee;
create table dept_copy
as select * from department;

select * from dept_copy;

alter table emp_copy
    add constraint emp_copy_eno_pk primary key(eno);
    /*�������� enoĮ���� primary key*/
alter table dept_copy
    add constraint dept_copy_eno_pk primary key(dno);
    
alter table emp_copy
    add constraint emp_copy_dno_fk foreign key(dno) references department(dno);
    /*foreign key ��������*/

alter table emp_copy
    modify ename constraint emp_copy_ename_nn not null;
    /*not null ��������*/
    
alter table emp_copy
    drop primary key;
    /*primary key ����*/
    
alter table dept_copy
    drop primary key;
    /*���Ű� �ȵȴ� �ֳ�? �� primary key�� �����ϴ� foreign key�� �ֱ� ����*/
    
alter table emp_copy
    drop constraint emp_copy_dno_fk;
    /*foreign key�� �׳� ���Ű� �ȵȴ�.*/
    
alter table emp_copy
    drop constraint emp_copy_ename_nn;
    /*not null �������� ����*/
    
alter table emp_copy
    disable constraint emp_copy_eno_pk;
    /*�������� ��Ȱ��ȭ*/
    
alter table emp_copy
    enable constraint emp_copy_eno_pk;
    /*�������� Ȱ��ȭ*/