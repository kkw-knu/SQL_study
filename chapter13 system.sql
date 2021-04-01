
/*
system계정에서만 사용가능하다.
실제로 많이 사용되지는않음 어떤용도인지만 알자
사용권한은 시스템 권한과 객체권한으로 나뉜다.
시스템권한은 사용자의 생성과 제거 자원관리가 있다.
*/

--시스템권한부여
create user kun
identified by 1234;
--이렇게하면 아이디만만들어지고 안에서 할수있는것이 없다

grant create session to kun;
--사용자에게 시스템 권한을 부여하는 법이다. session으로 데이터베이스에 연결할 수 있는 권한을 부여했다.

/*테이블 스페이스(Tablespace)는 디스크 공간을 소비하는
테이블과 뷰, 그리고 그 밖의 다른 데이터베이스 객체들이 저장되는
장소입니다. 새로 생성된 user에게 QUOTA절로 사용할 테이블
스페이스의 영역을 할당합니다. 
*/

grant create table to kun;--테이블생성권한 하지만 할당된 테이블스페이스가없다

alter user kun quota 2m on users;--테이블스페이스 할당

grant resource to kun;--리소스권한까지 줘야 테이블생성가능

select username, default_tablespace
from dba_users
where username in 'kun'; --테이블스페이스 사용하는 것을 확인할 수 있다.

/*
객체권한은 테이블이나 뷰나 시퀀스나 함수등과같은 객체별로 DML문을 사용할 수 있는 권한을 설정하는 것
on절다음에 객체
특정 객체에 대한 권한은 그 객체를 만든 사용자에게만 기본적으로 주어진다
우리가 지금까지 사용했던 employee테이블은 hr사용자의 소유테이블이다
hr사용자로 로그인해 usertest01사용자에게 테이블 객체 employee를 조회할 수 있도록 권한부여
*/

revoke create session from usertest01; --접속권한을 없앤다

--사용자에게 with grant option을 부여하면 사용자는 그 객체를 접근할 권한을 부여받으면서
--그 권한을 다른사람이게 부여 할 수 있는 권한도 함께 부여 받는다

create user usertest02 identified by pass2;
grant create session, create table, create view to usertest02;

-- 롤은 오라클 데이터베이스를 설치하면 기본적으로 제공되는 사전 정의된 롤과 사용자가 정의한 롤로 구분된다.

create user usertest04 identified by pass4;
grant connect to usertest04 ;
grant resource to usertest04 ;

/*직접 롤 만들기
CREATE ROLE role_name [NOT IDENTIFIED | IDENTIFIED <-identified 선택시 암호가필요함 
{BY password | EXTERNALLY} ];
GRANT privilege_name(부여할 권한 이름) TO role_name(롤 이름);
*/
create role roletest01; --롤만들기

grant create session, create table, create view 
to roletest01;--롤내용채우기

grant roletest01 to kun;--롤적용하기

select *
from role_sys_privs
where role like '%TEST%';

drop role roletest01;--롤 지우기

--객체권한 롤에 부여하기
create role roletest02;--롤만들기

grant select on employee to roletest02;--객체권한부여하기

grant roletest02 to usertest01; -- 롤 부여하기

/*
형식
REATE [PUBLIC] SYNONYM synonym_name
FOR user_name.object_name;
동의어는 다른 데이터베이스 객체에 대한 별칭이다.

전용 동의어 - 객체에 대한 접근 권한을 부여받은 사용자가 정의한 동의어로 해당 사용자만 사용할 수 있다.
공용 동의어 - 권한을 주는 사용자가 정의한 동의어로 누구나 사용할 수 있다.
*/

create table sampletbl (--실습을 위한 테이블생성
    memo varchar2(50)
);

insert into sampletbl values('가나다라');
insert into sampletbl values('마바사아');

select * from sampletbl; -- 현재까진 아무도 사용 불가능함 system만 사용 가능

grant select on sampletbl to hr; --테이블 조회 권한 부여

create public synonym pub_sampletbl for system.sampletbl; --공용동의어 정의하기
