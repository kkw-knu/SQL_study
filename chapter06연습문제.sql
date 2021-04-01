/*Q1. �����ȣ, ����̸�, �μ��̸��� �˻��϶�.*/
select e.eno �����ȣ, e.ename ����̸�, d.dname �μ��̸�
from department d, employee e
where d.dno=e.dno;
/*Q2. ������ NEW YORK�� ����̸��� �˻��϶�.*/
select e.ename ����̸�, d.loc ����
from department d, employee e
where d.dno=e.dno and d.loc='NEW YORK';
/*Q3. ADAMS ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�.*/
select e.ename ����̸�, d.dname �ٹ��μ�, d.loc �ٹ�����
from department d, employee e
where d.dno=e.dno and e.ename = 'ADAMS';
/*Q4. �޿��� 2000 �̻��� ������� ������ ����, �޿��� �˻��϶�.*/
select e.ename �����, d.loc ����, e.salary �޿�
from department d, employee e
where d.dno=e.dno and e.salary>=2000;
/*Q5. �޿��� 1000 �̻� 2000 ������ ������� �����ȣ, ����̸�, �μ��̸��� �����ȣ ������ �˻��϶�.*/
select e.eno �����ȣ, e.ename ����̸�, d.dname �μ��̸�
from department d, employee e
where d.dno=e.dno and e.salary between 1000 and 2000
order by e.eno;
/*Q6. ��������� SALESMAN�̸鼭 CHICAGO ������ �ٹ� ���� ������ ������ �˻��϶�.*/
select e.ename �����, d.loc ����
from department d, employee e
where d.dno=e.dno and e.job='SALESMAN' and d.loc='CHICAGO';
/*Q7. NEW YORK�̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ�� ����̸�, ������ �����ȣ ������ �˻��϶�.*/
select e.eno �����ȣ, e.ename ����̸�, d.loc ����
from department d, employee e
where d.dno=e.dno and d.loc in('NEW YORK','DALLAS')
order by e.eno;
/*Q8. �μ��̸��� ACCOUNTING�̰ų�, ������ CHICAGO�� ����� �����ȣ�� ����̸�, �μ���, ������ �˻��϶�.*/
select e.eno �����ȣ, e.ename ����̸�, d.dname �μ���, d.loc ����
from department d, employee e
where d.dno=e.dno and (d.dname='ACCOUNTING' or d.loc='CHICAGO');
/*Q9. �����ȣ, ����̸�, �޿�, �޿������ �޿���޺� �޿��� ���� ������ �˻��϶�.*/
select e.eno �����ȣ, e.ename ����̸�, e.salary �޿�, s.grade �޿����
from salgrade s, employee e
where salary between losal and hisal
order by s.grade, e.salary desc;
/*Q10. �����ȣ, ����̸�, ����ڻ����ȣ, ������̸��� �˻��϶�.*/
select e.eno �����ȣ, e.ename ����̸�, e.manager ����ڻ����ȣ, m.ename ������̸�
from employee e, employee m
where e.manager = m.eno;
/*Q11. BLAKE ������� ���� �޿��� �޴� ����̸��� �˻��϶�.*/
select ename ����̸�, salary �޿�
from employee
where salary > (select salary from employee where ename='BLAKE');