/*?/*Q1. 사원(employee) 테이블과 같은 구조의 t_emp 테이블을 생성하시오
(eno는 primary key, dno는 외래키(department), salary는 NOT NULL 제약조건으로 한다).*/
create table t_emp
as select * from employee;
alter table t_emp
    add constraint t_emp_eno_pk primary key(eno);
alter table t_emp
    add constraint t_emp_dno_fk foreign key(dno) references department (dno);
alter table t_emp
    modify salary constraint t_emp_salary_nn not null;
/*Q2. t_emp 테이블에 대한 제약조건을 검색하시오.*/
SELECT table_name, constraint_name
FROM user_constraints
WHERE table_name IN ('t_emp');
/*Q3. t_emp 테이블에 외래 키 제약조건을 비활성화 시키시오. */
alter table t_emp
    disable constraint t_emp_dno_fk;
/*Q4. t_emp 테이블에 외래 키 제약조건을 다시 활성화 시키시오. */
alter table t_emp
    enable constraint t_emp_dno_fk;
/*Q5. t_emp 테이블에 외래 키 제약조건을 삭제하시오. */
alter table t_emp
    drop constraint t_emp_dno_fk;
/*Q6. t_emp 테이블을 삭제하시오. */
drop table t_emp;