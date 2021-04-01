/*
뷰는 보안목적/편의성 목적으로 많이사용하는 기능이다.
일반 사용자에게 해당 뷰만 접근권을 부여하고 중요한 데이터가 외부에 공개되는것을 방지한다.

뷰는 한마디로 물리적인 테이블을 근거한 논리적인 가상 테이블이라고 정의한다.
디스크 저장 공간이 할당되지 않는다.
사용방법은 테이블에서 파생된 객체테이블과 유사하다.

t_로 시작하는건 테이블 v_로 시작하는건 뷰
형식-------------------------------------------------
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name
[(alias, alias, alias, ...)]
AS subquery
[WITH READ ONLY];
? OR REPLACE 
  ? 이미 존재하는 뷰에 대해서 그 내용을 새롭게 변경하여 재 생성
? FORCE
  ? 기본 테이블(서브쿼리)의 존재 여부에 상관없이 뷰 생성
? NOFORCE
  ? 반드시 기존 테이블(서브쿼리)이 존재할 경우에만 뷰 생성

뷰의 종류
? 뷰는 뷰를 정의하기 위해서 사용되는 기본 테이블(서브쿼리)의 수에 따라
 단순 뷰(Simple View)와 복합 뷰(Complex View)로 나뉩니다.
? 단순 뷰(simple view)는 하나의 기본 테이블로 생성한 뷰이며 DML 명령문을 실행할 수 있습니다.
  DML 명령문의 처리 결과는기본 테이블에 반영됩니다. 
? 복합 뷰(complex view)는 두개 이상의 기본 테이블로 생성한 뷰입니다. (조회밖에 안됨Read전용)

뷰의 처리방법
뷰는 데이터를 저장하고 있지 않은 가상 테이블이므로 실체가
없습니다. 뷰가 테이블처럼 사용될 수 있는 이유는 뷰를 정의할 때
CREATE VIEW 명령어 다음의 AS 절에 기술한 쿼리 문장 자체를
저장하고 있다가 이를 실행하기 때문입니다. 
? USER_VIEW 데이터 사전에서 뷰에 대한 정의를 조회합니다.
? 기본 테이블에 대한 뷰의 접근 권한을 살핍니다.
? 뷰에 대한 질의를 기본 테이블에 대한 질의로 변환합니다.
? 기본 테이블에 대한 질의를 통해 데이터를 검색합니다.
? 검색된 결과를 출력합니다. 

뷰가 더이상 필요 없을 때는 DROP VIEW 문을 이용하여 제거한다
뷰는 실체가 없는 가상테이블이기 때문에 뷰를 삭제하는 것은 USER_VIEWS 데이터 딕셔너리에
저장되어 있는 뷰의 정의를 삭제하는 것을 의미한다.
따라서 뷰를 삭제해도 뷰를 정의한 기본 테이블의 구조나 데이터에는 영향을 끼치지 않는다.


뷰의 옵션 with check option을 사용하면, 해당 뷰를 통해서 볼수있는
범위까지 update 또는 insert가 가능하다.

with read only를 사용하면 해당 뷰를 통해서는 select만 가능하다.
*/

desc emp_second;
desc dept_second;

drop table emp_second;
drop table dept_second;

create table emp_second
as select * from employee;

create table dept_second
as select * from department;

/*단순 뷰 만들기*/
create view v_emp_job(사번, 사원이름, 부서번호, 담당업무)--칼럼명을 생략하면 기본테이블의 칼럼명을 상속받는다
as
select eno, ename, dno, job
from emp_second
where job like 'SALESMAN';

desc v_emp_job;

select * from v_emp_job;

insert into v_emp_job
values(7955, 'TEST',30,'SALESMAN');--단순뷰는 그냥 행 추가 가능

/*복합 뷰 만들기*/
create view v_emp_complex
as
select e.eno, e.ename, e.job, e.salary, e.dno, d.dname, d.loc
from emp_second e, dept_second d
where e.dno = d.dno;

select eno,loc from v_emp_complex; --계속 조인할 필요없이 단순 검색만으로 사용가능하다.

create or replace view v_emp_complex
as
select e.eno, e.ename, e.job, e.dno, d.dname, d.loc
from emp_second e, dept_second d
where e.dno = d.dno;

/*user_views 데이터 사전 살피기*/
select view_name, text
from user_views;

/*뷰에 그룹함수를 사용할땐 항상 칼럼 별칭을 사용해줘야 한다.
별칭 미사용시 오류가 발생한다.*/
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
create or replace view v_emp_job(사번, 사원이름, 부서번호, 담당업무)
as
select eno, ename, dno, job
from emp_second
where job like 'SALESMAN'
with check option;--이렇게 만들면 범위 내에서만 update 및 insert 가능

create or replace view v_emp_job_chk
as
select eno, ename, dno, job
from emp_second
where job = 'MANAGER'
with check option;

insert into v_emp_job_chk
values(9000,'거누', 30,'coding');

select * from v_emp_job_chk;
select * from emp_second;

/*with read only*/
create or replace view v_emp_jop_readonly
as
select eno, ename, dno, job
from emp_second
where job = 'MANAGER'
with read only; -- 이 구문을 사용하면 추가 안됨