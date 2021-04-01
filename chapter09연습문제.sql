/*실습과제를 위해 3개 테이블 복사하여 새로운 테이블을 생성한다.*/
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