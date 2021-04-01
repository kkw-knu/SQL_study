
/*
system���������� ��밡���ϴ�.
������ ���� �������¾��� ��뵵������ ����
�������� �ý��� ���Ѱ� ��ü�������� ������.
�ý��۱����� ������� ������ ���� �ڿ������� �ִ�.
*/

--�ý��۱��Ѻο�
create user kun
identified by 1234;
--�̷����ϸ� ���̵𸸸�������� �ȿ��� �Ҽ��ִ°��� ����

grant create session to kun;
--����ڿ��� �ý��� ������ �ο��ϴ� ���̴�. session���� �����ͺ��̽��� ������ �� �ִ� ������ �ο��ߴ�.

/*���̺� �����̽�(Tablespace)�� ��ũ ������ �Һ��ϴ�
���̺�� ��, �׸��� �� ���� �ٸ� �����ͺ��̽� ��ü���� ����Ǵ�
����Դϴ�. ���� ������ user���� QUOTA���� ����� ���̺�
�����̽��� ������ �Ҵ��մϴ�. 
*/

grant create table to kun;--���̺�������� ������ �Ҵ�� ���̺����̽�������

alter user kun quota 2m on users;--���̺����̽� �Ҵ�

grant resource to kun;--���ҽ����ѱ��� ��� ���̺��������

select username, default_tablespace
from dba_users
where username in 'kun'; --���̺����̽� ����ϴ� ���� Ȯ���� �� �ִ�.

/*
��ü������ ���̺��̳� �䳪 �������� �Լ�������� ��ü���� DML���� ����� �� �ִ� ������ �����ϴ� ��
on�������� ��ü
Ư�� ��ü�� ���� ������ �� ��ü�� ���� ����ڿ��Ը� �⺻������ �־�����
�츮�� ���ݱ��� ����ߴ� employee���̺��� hr������� �������̺��̴�
hr����ڷ� �α����� usertest01����ڿ��� ���̺� ��ü employee�� ��ȸ�� �� �ֵ��� ���Ѻο�
*/

revoke create session from usertest01; --���ӱ����� ���ش�

--����ڿ��� with grant option�� �ο��ϸ� ����ڴ� �� ��ü�� ������ ������ �ο������鼭
--�� ������ �ٸ�����̰� �ο� �� �� �ִ� ���ѵ� �Բ� �ο� �޴´�

create user usertest02 identified by pass2;
grant create session, create table, create view to usertest02;

-- ���� ����Ŭ �����ͺ��̽��� ��ġ�ϸ� �⺻������ �����Ǵ� ���� ���ǵ� �Ѱ� ����ڰ� ������ �ѷ� ���еȴ�.

create user usertest04 identified by pass4;
grant connect to usertest04 ;
grant resource to usertest04 ;

/*���� �� �����
CREATE ROLE role_name [NOT IDENTIFIED | IDENTIFIED <-identified ���ý� ��ȣ���ʿ��� 
{BY password | EXTERNALLY} ];
GRANT privilege_name(�ο��� ���� �̸�) TO role_name(�� �̸�);
*/
create role roletest01; --�Ѹ����

grant create session, create table, create view 
to roletest01;--�ѳ���ä���

grant roletest01 to kun;--�������ϱ�

select *
from role_sys_privs
where role like '%TEST%';

drop role roletest01;--�� �����

--��ü���� �ѿ� �ο��ϱ�
create role roletest02;--�Ѹ����

grant select on employee to roletest02;--��ü���Ѻο��ϱ�

grant roletest02 to usertest01; -- �� �ο��ϱ�

/*
����
REATE [PUBLIC] SYNONYM synonym_name
FOR user_name.object_name;
���Ǿ�� �ٸ� �����ͺ��̽� ��ü�� ���� ��Ī�̴�.

���� ���Ǿ� - ��ü�� ���� ���� ������ �ο����� ����ڰ� ������ ���Ǿ�� �ش� ����ڸ� ����� �� �ִ�.
���� ���Ǿ� - ������ �ִ� ����ڰ� ������ ���Ǿ�� ������ ����� �� �ִ�.
*/

create table sampletbl (--�ǽ��� ���� ���̺����
    memo varchar2(50)
);

insert into sampletbl values('�����ٶ�');
insert into sampletbl values('���ٻ��');

select * from sampletbl; -- ������� �ƹ��� ��� �Ұ����� system�� ��� ����

grant select on sampletbl to hr; --���̺� ��ȸ ���� �ο�

create public synonym pub_sampletbl for system.sampletbl; --���뵿�Ǿ� �����ϱ�
