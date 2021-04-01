/*
시퀀스와 인덱스
시퀀스는 자동번호 발생
인덱스는 조회의 성능을 향상(유일한 숫자)
*/

--시퀀스 만드는방법
create sequence sample_seq
increment by 10
start with 10;

/*
시퀀스 관련 데이터 딕셔너리
sequence_name은 시퀀스 객체의 이름
min_value는 최소값, max_value는 최대값
increment_by는 증가치에 대한 정보
cycle_flag는 cycle옵션을 사용하는지, 하지않는지에 대한 정보
*/
select * from user_sequences;

/*
currval : 시퀀스의 현재 값을 알아내는 함수
nextval : 시퀀스의 다음 값을 알아내는 함수
currval에 새로운 값이 할당되기 위해서는 nextval로 새로운 값을 생성해야 한다.
즉 nextval로 새로운 값을 생성한 다음에 이 값을 currval에 대체하게 된다.
*/
select sample_seq.nextval from dual;
select sample_seq.currval from dual;

/*
사용할수 있는 경우
서브쿼리가 아닌 select문
insert문의 select절
insert 문의 value절
update문의 set절
사용할수 없는 경우
view의 select절
distinct 키워드가 있는 select문
group by, having, order by절이 있는 select문
select, delete, update의 서브쿼리
create table, alter table 멸영의 default값
*/

create sequence dno_seq
increment by 10
start with 10;

delete from dept_second;
select * from dept_second;

insert into dept_second
values(dno_seq.nextval, 'ACCOUNTING','NEW YORK');
/*시퀀스를 변경하려면 alter sequence문을 사용해야 한다.*/
alter sequence dno_seq
maxvalue 50;

/*시퀀스 제거하기*/
drop sequence dno_seq;

/*
조회시 성승 향상을 위한 인덱스
인덱스 객체에 대한 정보는 USER_COLUMNS와
USER_IND_COLUMNS 데이터 사전을 통해서 살펴볼 수 있습니다.
기본 키나 유일 키는 인덱스가 자동으로 생성됩니다
*/
--index만들기
create index idx_employee_ename
on employee(ename);

--index 확인하기
select index_name, table_name, column_name
from user_ind_columns
where table_name in('EMPLOYEE');

--index 삭제하기
drop index user_ind_columns;

/*
인덱스를 사용할 때
테이블에 행의 수가 많을 때
where문에 해당 컬럼이 많이 사용될 때
검색 결과가 전체 데이터의 2%~4%정도 일때
join에 자주 사용되는 컬럼이나 null을 포함하는 컬럼이 많은 경우

인덱스를 사용하지 말아야 할 때
테이블에 행의 수가 적을 때
where문에 해당 칼럼이 자주 사용되지 않을 때
검색 결과가 전체 데이터의 10~15%이상일 때
테이블에 DML작업이 많은 경우 즉, 입력 수정 삭제등이 자주 일어날때


유일한 값을 갖는지 여부에 따른
고유 인덱스(Unique Index) /비 고유 인덱스(NonUnique Index)
인덱스를 구성하는 칼럼의 개수에 따라
단일 인덱스(Single Index)/결합 인덱스(Composite Index)
함수에 인덱스를 지정하는
함수 기반 인덱스(Function Based Index)
*/

alter index idx_employee_ename rebuild;

/*혼자해보기*/
create sequence emp_seq
start with 1
increment by 1
maxvalue 100000;

create table emp01(
empon number(10) primary key,
ename varchar2(10),
hiredate date
);
    
--사원번호 형식 : 년도 4자리 + 일련번호 6자리
--20210000002

insert into emp01
values(to_char(sysdate,'YYYY')||lpad(emp_seq.nextval,6,0),'jalia',sysdate);

select * from emp01;

--이름 칼럼을 인덱스로 지정하기
create index idx_emp01_ename
on emp01(ename);