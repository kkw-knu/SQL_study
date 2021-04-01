grant select on hr.employee to kun; -- usertest01아이디에게 테이블 select권한부여

revoke select on hr.employee from kun;

grant select on hr.employee to usertest02 with grant option;--02에게 접근권한과 권한부여기능 부여

grant select on hr.department to public; -- 모든사용자에게 권한 부여

select * from sampletbl; --사용 불가능
select * from system.sampletbl; -- system에게서 받았기떄문

create synonym priv_sampletbl for system.sampletbl;--앞으로 이름을 바꾸겠다는 뜻

select * from priv_sampletbl; --이 이름으로 조회 가능 문제점은 모든 사람이 각자 자기만의 동의어를 만듬
--그래서 시스템에서 공용동의어를 만들어주어야함

select * from pub_sampletbl; --공용동의어는 조회가 바로 가능하다.

drop synonym priv_sampletbl; --drop으로 동의어 삭제가 가능하다


--트리거 실습
create table dept_original
as
select * from department where 0=1;

create table dept_copy
as
select * from department where 0=1;


create or replace trigger triger_sample1--드래그해서 실행해야함
after insert
on dept_original
for each row
begin
if inserting then 
DBMS_OUTPUT.PUT_LINE ('Insert Trigger 발생');
insert into dept_copy
values(:new.dno, :new.dname, :new.loc);
end if;
end;
/

insert into dept_original
values(10, 'ACCOUNTING', 'NEW YORK'); --트리거 실행후 실행해보기

select * from dept_original;

select * from dept_copy;

/
--delete 트리거
create or replace trigger triger_sample2
after delete
on dept_original
for each row
begin
DBMS_OUTPUT.PUT_LINE('Delete Trigger 발생');
delete from dept_copy
where dept_copy.dno = :old.dno;
end;
/

delete from dept_original where dno=10;

select * from dept_original;

select * from dept_copy;
drop table 상품테이블;

drop table 입고테이블;
--실습하기 2
--상품테이블 생성
CREATE TABLE 상품테이블(
상품코드 CHAR(6) PRIMARY KEY,
상품명 VARCHAR2(12) NOT NULL,
제조사 VARCHAR(12),
소비자가격 NUMBER(8),
재고수량 NUMBER DEFAULT 0);

--입고테이블 생성
CREATE TABLE 입고테이블(
입고번호 NUMBER(6) PRIMARY KEY,
상품코드 CHAR(6) REFERENCES 상품테이블(상품코드),
입고일자 DATE DEFAULT SYSDATE,
입고수량 NUMBER(6),
입고단가 NUMBER(8),
입고금액 NUMBER(8));

--물건 넣기
INSERT INTO 상품테이블(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00001', '세탁기', 'LG', 500);
INSERT INTO 상품테이블(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00002', '컴퓨터', 'LG', 700);
INSERT INTO 상품테이블(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00003', '냉장고', '삼성', 600);

select * from 상품테이블;

-- 입고 트리거
CREATE OR REPLACE TRIGGER TRG_03
AFTER INSERT ON 입고테이블
FOR EACH ROW
BEGIN
UPDATE 상품테이블
SET 재고수량 = 재고수량 + :NEW.입고수량
WHERE 상품코드 = :NEW.상품코드;
END;
/

INSERT INTO 입고테이블(입고번호, 상품코드, 입고수량, 입고단가, 입고금액) 
VALUES(1, 'A00001', 5, 320, 1600);
SELECT * FROM 입고테이블;
SELECT * FROM 상품테이블;

INSERT INTO 입고테이블(입고번호, 상품코드, 입고수량, 입고단가, 입고금액) 
VALUES(2, 'A00002', 10, 680, 6800);
SELECT * FROM 입고;
SELECT * FROM 상품;

INSERT INTO 입고테이블(입고번호, 상품코드, 입고수량, 입고단가, 입고금액) 
VALUES(3, 'A00003', 5, 220, 1100);
INSERT INTO 입고테이블(입고번호, 상품코드, 입고수량, 입고단가, 입고금액) 
VALUES(4, 'A00003', 5, 220, 1100);

-- 갱신 트리거
CREATE OR REPLACE TRIGGER TRG_04
AFTER UPDATE ON 입고테이블
FOR EACH ROW
BEGIN
UPDATE 상품테이블
SET 재고수량 = 재고수량 + (-:old.입고수량+:new.입고수량) 
WHERE 상품코드 = :new.상품코드;
END;
/

UPDATE 입고테이블 SET 입고수량=10, 입고금액=2200
WHERE 입고번호=3;
SELECT * FROM 입고테이블 ORDER BY 입고번호;
SELECT * FROM 상품테이블;

--삭제트리거
CREATE OR REPLACE TRIGGER TRG_05
AFTER DELETE ON 입고테이블
FOR EACH ROW
BEGIN
UPDATE 상품테이블
SET 재고수량 = 재고수량 - :old.입고수량
WHERE 상품코드 = :old.상품코드;
END;
/

DELETE 입고테이블 WHERE 입고번호=3;
SELECT * FROM 입고테이블 ORDER BY 입고번호;
SELECT * FROM 상품테이블;

