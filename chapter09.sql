--insert문
create table dept_copy
as
select * from department where 0=1;

desc dept_copy;
select * from dept_copy;

insert into dept_copy
values(10,'ACCOUNTING','NEWYORK');
/*순서를 정하지 않고 넣었으므로 desc 순서에 맞게 넣어야함*/

insert into dept_copy(dno, dname, loc)
values(20,'RESEARCH','DALLAS');
/*본인이 아닌 다른사람이 확인할때도 가독성이 좋도록 순서를 정하고
데이터값을 넣어주는 것이 좋다*/

/*null값을 갖는 로우를 삽입할때 암시적방법과 명시적 방법이있다.*/
/*암시적 방법*/
insert into dept_copy (dno, dname)
values (30, 'SALES') ;

/*명시적 방법*/
insert into dept_copy
values (40, 'OPERATIONS', NULL ) ;
/*null을 표시하는 방법이 하나 더있다.*/
insert into dept_copy
values (50, 'IT', '' ) ;


ROLLBACK;
/*데이터를 잘못입력했을때 rollback을 입력하면 트랜잭션 처리가 끝이 안났으므로
insert가 입력되기 전으로 되돌린다.*/
COMMIT;
/*
데이터 입력을 완료했을때 commit을 입력하면 트랜잭션 처리가 끝난다.
DDL언어는 언어 자체가 하나의 트랜잭션 처리언어였지만 DML언어는 
트랜잭션의 시작을 알리는 언어이고 rollback이나 commit으로 트랜잭션을 종료시킨다.
commit을 수행하고 나서는 rollback이 되지 않는다.
트랜잭션이란 하나의 작업단위
*/

create table emp_copy
as
select eno, ename, job, hiredate, dno from employee where 0=1;
/*날짜 데이터를 입력하기 위해서는 시스템에서 요구하는 날짜형식을 사용해야한다
oracle의 경우에는 'YYYY/MM/DD'의 형식을 따른다*/
insert into emp_copy
values(7000, 'CANDY', 'MANAGER', '2012/05/01',10);

/*to_date를 사용한 날짜 입력하기*/
insert into emp_copy
values(7010,'TOM','MANAGER',to_date('2020.08.01','YYYY.MM.DD'),20);

/*오늘 날짜 넣기*/
insert into emp_copy
values(7010,'JERRY','SALESMAN',sysdate,30);

/*insert into 다음에 values절 대신 서브쿼리를 사용함으로써 다른 테이블의 데이터 복사가능*/
select * from dept_copy;
delete from dept_copy;
insert into dept_copy
select * from department;




--update문
/*update문은 테이블에 저장된 데이터를 수정하기 위한 DML이다*/
/*where 절로 특정 로우만 수정하는 코드*/
update dept_copy
set dname = 'PROGRAMMING'
where dno = 10;

/*where절을 생략하면 모든 로우가 바뀐다.*/
update dept_copy
set dname = 'HR';

/*칼럼값 여러개를 한번에 수정가능하다*/
update dept_copy
set dname = 'PROGRAMMING',
    loc = 'SEOUL'
where dno = 10;

/*다른 테이블 기반으로 컬럼 값을 변경하기*/
update dept_copy
set loc = (select loc from department where dno=20)
where dno = 10;

/*다른테이블 기반으로 여러 컬럼값 바꾸기*/
update dept_copy
set dname = (select dname from dept_copy where dno=30),
    loc = (select loc from dept_copy where dno=30)
where dno = 10;



--delete문
/*delete문을 사용하여 기존에 저장된 데이터를 삭제할 수 있다.*/
/*where절을 생략하면 테이블에 있는 모든 행이 제거된다*/
delete from dept_copy
where dno = 10;

/*delete문에 서브쿼리를 사용하여 테이블에 다른 테이블 값기반으로 로우를 삭제 가능하다*/
delete from dept_copy;

select * from dept_copy;

/*
트랜잭션(Transaction)은 데이터 처리에서 논리적으로 하나의 작업
단위를 의미합니다.
Oracle 명령어 중에서 DDL과 DCL은 하나의 명령어가 하나의
트랙잭션이며, DML은 데이터 변동의 일관성을 위해 하나 이상의
DML문이 모여 하나의 트랙잭션을 구성합니다.
All ? OR ? Nothing : 여러 개의 명령어 집합이 정상적으로 처리되면
정상 종료하고, 명령어들 중 하나라도 잘못된다면 전체를 취소해
버립니다.
DML문은 실행됨과 동시에 트랙잭션이 진행됩니다. DML 작업이
성공적으로 처리되었다면 COMMIT을, 취소해야 한다면 ROLLBACK
명령을 실행합니다. 
COMMIT은 트랜잭션의 처리 과정을 반영하여 변경된 내용을 모두 영구
저장합니다. 
ROLLBACK은 트랜잭션의 처리 과정 중 발생한 변경 사항을 취소하는
명령어입니다. ROLLBACK을 실행하게 되면 하나의 묶음 처리가
시작되기 이전 상태로 돌아갑니다. 
*/

?/*실습과제를 위해 3개 테이블 복사하여 새로운 테이블을 생성한다.*/
create table t_emp
as select * from employee where dno in (20,30);

create table t_dept
as select * from department;

create table t_salgrade
as select * from salgrade;

/*Q1.사원번호 7703, 사원이름 JOSH, 사원직무 SALESMAN, 상급자사원번호 7566, 급여 1400, 커미션 0, 부서번호 20인 사원이 오늘 입사하였다. 사원정보를 등록하시오.*/
insert into t_emp(eno, ename, job, manager, hiredate, salary, commission, dno)
values(7703,'JOSH','SALESMAN',7566,sysdate,1400,0,20);
/*Q2.사원번호 7401, 사원이름 HOMER, 급여 1300, 부서번호 10인 사원이 오늘 입사하였다. 사원정보를 등록하시오.*/
insert into t_emp(eno, ename, salary, dno)
values(7401,'HOMER',1300,10);
/*Q3.사원번호 7323, 사원이름 BRANDA, 부서번호 30, 사원번호 7499와 동일한 급여를 받는 사원이 오늘 입사하였다. 사원정보를 등록하시오.*/
insert into t_emp(eno, ename, dno, salary)
values(7323,'BRANDA',30,(select salary from t_emp where eno=7499));
/*Q4.사원(employee) 테이블에서 부서번호가 10인 데이터를 t_emp 테이블에 입력하시오.*/
insert into t_emp
select * from employee where dno=10;
/*Q5.사원번호 7369의 사원직무를 ANALYST로 바꾸시오.*/
update t_emp
set job='ANALYST'
where eno=7369;
/*Q6.부서번호 20인 직원들의 급여를 100 삭감하시오.*/
update t_emp
set salary=salary-100
where dno=20;
/*Q7.모든 사원의 급여를 200 인상하시오.*/
update t_emp
set salary=salary+200;
/*Q8.사원번호 7902의 상급자사원번호를 7654, 부서번호를 30으로 바꾸시오.*/
update t_emp
set manager=7654,
    dno=30
where eno=7902;
/*Q9.지역이 DALLAS인 사원들의 급여를 10 삭감하시오.*/
update t_emp
set salary=salary-10
where dno in (select e.dno
            from t_emp e,t_dept d
            where e.dno=d.dno and d.loc='DALLAS');
/*Q10. 급여등급이 2인 사원들의 급여를 20 삭감하시오.*/
update t_emp
set salary=salary-20
where salary in (select e.salary
                from t_emp e, t_salgrade s
                where e.salary between s.losal and s.hisal and s.grade=2);
/*Q11. 사원번호 7499가 퇴사하였다. 사원정보를 삭제하시오. */
delete from t_emp
where eno=7499;
/*Q12. 부서정보에 부서번호 50, 부서이름 'PLANNING', 지역 'MIAMI'를 추가하시오.*/
insert into t_dept(dno,dname,loc)
values(50,'PLANNING','MIAMI');
/*Q13. 부서번호가 40인 부서가 60으로 변경되었다.*/
update t_dept
set dno=60
where dno=40;
/*Q14. 부서번호가 30인 부서가 폐쇄되었다.*/
delete from t_dept
where dno=30;
/*Q15. t_dept 테이블에 없는 부서번호을 갖고 있는 사원들의 부서번호를 99로 변경하시오.*/
update t_emp
set dno=99
where dno not in (select dno from t_dept);
/*Q16. t_emp에서 부서가 99인 정보를 삭제하시오.*/
delete from t_emp
where dno=99;
/*Q17. 상급자사원번호가 없는 사원의 급여를 100 인상하시오.*/
update t_emp
set salary=salary+100
where manager is null;
/*Q18. JONES, JOSH, CLARK를 30번 부서로 변경하시오.*/
update t_emp
set dno=30
where ename in ('JONES','JOSH','CLARK');
/*Q19. 커미션이 NULL인 데이터를 0으로 변경하시오.*/
update t_emp
set commission=0
where commission is null;
/*Q20. t_emp, t_dept, t_salgrade 테이블의 데이터를 삭제하시오.*/
delete from t_emp;
delete from t_dept;
delete from t_salgrade;
/*실습과제가 끝나면 3개 테이블 삭제하시오.*/
drop table t_emp;
drop table t_dept;
drop table t_salgrade;