grant select on hr.employee to kun; -- usertest01���̵𿡰� ���̺� select���Ѻο�

revoke select on hr.employee from kun;

grant select on hr.employee to usertest02 with grant option;--02���� ���ٱ��Ѱ� ���Ѻο���� �ο�

grant select on hr.department to public; -- ������ڿ��� ���� �ο�

select * from sampletbl; --��� �Ұ���
select * from system.sampletbl; -- system���Լ� �޾ұ⋚��

create synonym priv_sampletbl for system.sampletbl;--������ �̸��� �ٲٰڴٴ� ��

select * from priv_sampletbl; --�� �̸����� ��ȸ ���� �������� ��� ����� ���� �ڱ⸸�� ���Ǿ ����
--�׷��� �ý��ۿ��� ���뵿�Ǿ ������־����

select * from pub_sampletbl; --���뵿�Ǿ�� ��ȸ�� �ٷ� �����ϴ�.

drop synonym priv_sampletbl; --drop���� ���Ǿ� ������ �����ϴ�


--Ʈ���� �ǽ�
create table dept_original
as
select * from department where 0=1;

create table dept_copy
as
select * from department where 0=1;


create or replace trigger triger_sample1--�巡���ؼ� �����ؾ���
after insert
on dept_original
for each row
begin
if inserting then 
DBMS_OUTPUT.PUT_LINE ('Insert Trigger �߻�');
insert into dept_copy
values(:new.dno, :new.dname, :new.loc);
end if;
end;
/

insert into dept_original
values(10, 'ACCOUNTING', 'NEW YORK'); --Ʈ���� ������ �����غ���

select * from dept_original;

select * from dept_copy;

/
--delete Ʈ����
create or replace trigger triger_sample2
after delete
on dept_original
for each row
begin
DBMS_OUTPUT.PUT_LINE('Delete Trigger �߻�');
delete from dept_copy
where dept_copy.dno = :old.dno;
end;
/

delete from dept_original where dno=10;

select * from dept_original;

select * from dept_copy;
drop table ��ǰ���̺�;

drop table �԰����̺�;
--�ǽ��ϱ� 2
--��ǰ���̺� ����
CREATE TABLE ��ǰ���̺�(
��ǰ�ڵ� CHAR(6) PRIMARY KEY,
��ǰ�� VARCHAR2(12) NOT NULL,
������ VARCHAR(12),
�Һ��ڰ��� NUMBER(8),
������ NUMBER DEFAULT 0);

--�԰����̺� ����
CREATE TABLE �԰����̺�(
�԰��ȣ NUMBER(6) PRIMARY KEY,
��ǰ�ڵ� CHAR(6) REFERENCES ��ǰ���̺�(��ǰ�ڵ�),
�԰����� DATE DEFAULT SYSDATE,
�԰���� NUMBER(6),
�԰�ܰ� NUMBER(8),
�԰�ݾ� NUMBER(8));

--���� �ֱ�
INSERT INTO ��ǰ���̺�(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00001', '��Ź��', 'LG', 500);
INSERT INTO ��ǰ���̺�(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00002', '��ǻ��', 'LG', 700);
INSERT INTO ��ǰ���̺�(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00003', '�����', '�Ｚ', 600);

select * from ��ǰ���̺�;

-- �԰� Ʈ����
CREATE OR REPLACE TRIGGER TRG_03
AFTER INSERT ON �԰����̺�
FOR EACH ROW
BEGIN
UPDATE ��ǰ���̺�
SET ������ = ������ + :NEW.�԰����
WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
/

INSERT INTO �԰����̺�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES(1, 'A00001', 5, 320, 1600);
SELECT * FROM �԰����̺�;
SELECT * FROM ��ǰ���̺�;

INSERT INTO �԰����̺�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES(2, 'A00002', 10, 680, 6800);
SELECT * FROM �԰�;
SELECT * FROM ��ǰ;

INSERT INTO �԰����̺�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES(3, 'A00003', 5, 220, 1100);
INSERT INTO �԰����̺�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES(4, 'A00003', 5, 220, 1100);

-- ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_04
AFTER UPDATE ON �԰����̺�
FOR EACH ROW
BEGIN
UPDATE ��ǰ���̺�
SET ������ = ������ + (-:old.�԰����+:new.�԰����) 
WHERE ��ǰ�ڵ� = :new.��ǰ�ڵ�;
END;
/

UPDATE �԰����̺� SET �԰����=10, �԰�ݾ�=2200
WHERE �԰��ȣ=3;
SELECT * FROM �԰����̺� ORDER BY �԰��ȣ;
SELECT * FROM ��ǰ���̺�;

--����Ʈ����
CREATE OR REPLACE TRIGGER TRG_05
AFTER DELETE ON �԰����̺�
FOR EACH ROW
BEGIN
UPDATE ��ǰ���̺�
SET ������ = ������ - :old.�԰����
WHERE ��ǰ�ڵ� = :old.��ǰ�ڵ�;
END;
/

DELETE �԰����̺� WHERE �԰��ȣ=3;
SELECT * FROM �԰����̺� ORDER BY �԰��ȣ;
SELECT * FROM ��ǰ���̺�;

