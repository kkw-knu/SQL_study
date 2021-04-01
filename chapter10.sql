desc dept_second;
desc dept_third;
drop table dept_third;

create table dept_second(
    dno     number(2)    constraint pk_dept_second primary key,
    dname   varchar2(14),
    loc     varchar2(13)
);
/*칼럼 레벨*/
/*테이블 레벨*/
/*칼럼레벨로는 멀티로 프라이머리키를 줄 수 없기때문에 테이블 레벨을 쓰는 것이다.*/
create table dept_third(
    dno     number(2),
    dname   varchar2(14),
    loc     varchar2(13),
    constraint pk_dept_third primary key(dno)
);

/*not null은 칼럼레벨로만 지정 가능하다*/
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
values('abcde','0000','거누','010-1234-1234','SEOUL');
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
values('abcde','0000','거누','010-1234-1234','SEOUL');
insert into customer
values('abcde','0001','거누1','010-1234-1234','SEOUL');
/*값이 중복이 안되는거지 null은 계속 들어감*/

/*제약조건의 이름 지정하기*/
create table customer(
    id      varchar2(20) constraint customer_id_uk unique,
    pwd     varchar2(20) constraint customer_pwd_nn not null,
    name    varchar2(20) constraint customer_name_nn not null,
    phone   varchar2(30),
    address varchar2(100)) ;
    
desc customer;
/*제약조건 확인하기*/
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
/*primary key는 unique + nou null이다*/

desc emp_second;

create table emp_second(
    eno     number(4) constraint emp_second_eno_pk primary key,
    ename   varchar2(10),
    job     varchar2(9),
    dno     number(2) constraint emp_secnod_dno_fk references department);

insert into emp_second
values(1234,'asd','거누1',50);
/*
eno는 프라이머리키라 중복이안되고 dno는 department를 참조하기때문에 
거기에 있는 값이 아니면 입력이 되지 않는다.
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
    /*제약조건 eno칼럼에 primary key*/
alter table dept_copy
    add constraint dept_copy_eno_pk primary key(dno);
    
alter table emp_copy
    add constraint emp_copy_dno_fk foreign key(dno) references department(dno);
    /*foreign key 제약조건*/

alter table emp_copy
    modify ename constraint emp_copy_ename_nn not null;
    /*not null 제약조건*/
    
alter table emp_copy
    drop primary key;
    /*primary key 제거*/
    
alter table dept_copy
    drop primary key;
    /*제거가 안된다 왜냐? 이 primary key를 참조하는 foreign key가 있기 때문*/
    
alter table emp_copy
    drop constraint emp_copy_dno_fk;
    /*foreign key는 그냥 제거가 안된다.*/
    
alter table emp_copy
    drop constraint emp_copy_ename_nn;
    /*not null 제약조건 제거*/
    
alter table emp_copy
    disable constraint emp_copy_eno_pk;
    /*제약조건 비활성화*/
    
alter table emp_copy
    enable constraint emp_copy_eno_pk;
    /*제약조건 활성화*/