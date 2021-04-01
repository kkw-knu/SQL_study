--테이블 생성
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

--부서가 20인 사람들만 별도로 넣고싶을때
create table dept20
as 
select eno, ename, salary*12 annsal
from employee
where dno=20;
--이러면 오류나는데 연산식으로 한거는 칼럼명에 별칭을 써줘야함

desc dept20;

select * from dept20;

--부서 테이블 구조만 만들기
create table dept_third
as
select dno, dname
from dept_second
--여기까지는 전부가져옴
where 0=1;--이게 내용출력안되는 조건문

desc dept_third;

select * from dept_third;

create table  employee_backup_20210304
as
select * from employee;

--아까만든 dept20 테이블에 새로운 칼럼을 넣는과정
alter table dept
add(birth DATE);

desc dept;

select * from dept20;

--애초에 ename의 유형은 varchar2(10)이였다.
alter table dept
      modify dname varchar2(30);
      
alter table dept
drop column birth;
            
alter table dept20
      drop column ename;
      
alter table dept
set unused (dno);
--desc/select으로 보면 보이지 않는다.

alter table dept
drop unused columns;
--unused된 컬럼들을 삭제한다.

rename dept to emp;

desc emp;

--테이블의 구조를 제거  기본키나 고유키를 다른 테이블에서 참조하고 이쓴ㄴ경우
--삭제가 불가능하기 때문에 그럴 경우 참조중인 자식테이블을 먼저 제거해야 한다.
drop table emp;
--부서테이블이 부모//사원테이블이 자식
--부모를 삭제하려고 하면 사원테이블이 부서테이블을 참조하고 있기때문에
--삭제가 불가능하다 그래서 사원테이블에 있는 참조칼럼을 지워야
--부서테이블을 삭제할수있다.

select * from emp20;
--삭제되서 안보인다.
select * from dept_second;

truncate table dept_second;
--칼럼명만 남게되고(테이블의 구조만남고) 모든 데이터(로우)가 지워진다
--인덱스, 뷰 등은 그대로 유지가 된다.

--user 데이터 사전
select table_name from user_tables;
select table_name from user_indexes;

--all 데이터 사전
 SELECT owner, table_name FROM all_tables ;
 
--dba 데이터사전
SELECT owner, table_name FROM dba_tables ;
--시스템 권한이 없는 아이디라 접근 불가능하다 system계정으로 접속해야 한다.
create table t_emp as select * from employee;
alter table t_emp add(gender char(1));
alter table t_emp modify gender varchar2(10);
alter table t_emp drop column gender;
truncate table t_emp;
drop table t_emp;
select * from t_emp;