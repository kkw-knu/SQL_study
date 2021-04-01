/* Q1. ��ü ����� �Ի��� �� ���� �Ի��ϰ� �ֱ� �Ի����� �˻��϶�. */
select min(hiredate) as "�����Ի���", max(hiredate) as "�ֱ��Ի���"
from employee;
/* Q2. ��� ���̺��� �ο�(��)�� ���� �˻��϶�. */
select count(*) as "�ο��� ��"
from employee;
/* Q3. ����̸��� ������ �˻��϶�. */
select count(ename) as "����̸�����"
from employee;
/* Q4. Ŀ�̼� ���� ������ �˻��϶�. */
select count(commission) as "���� ����"
from employee;
/* Q5. �μ��� ������� �ο����� �˻��϶�. */
select dno as "�μ�", count(dno) as "�ο���"
from employee
group by dno;
/* Q6. �μ��� ������� ��� �޿��� �˻��϶�. */
select dno as "�μ�", round(avg(salary)) as "��ձ޿�"
from employee
group by dno;
/* Q7. �μ���, ��������� ������� ��� �޿��� �˻��϶�. */
select dno as "�μ�",job as "�������", round(avg(salary)) as "��ձ޿�"
from employee
group by dno, job
order by dno;
/* Q8. �μ���, ��������� ����� �Ի��� �� ���� �Ի��ϰ� �ֱ� �Ի����� �˻��϶�. */
select dno as "�μ�", job as "�������", min(hiredate) as "�����Ի���", max(hiredate) as "�ֱ��Ի���"
from employee
group by dno, job
order by dno;
/* Q9. �μ��� ������� �ο����� �ο����� ���� ������ �˻��϶�. */
select dno as "�μ�", count(*) as "�����"
from employee
group by dno
order by count(*) desc;
/* Q10. �μ��� ������� ��ձ޿��� ��ձ޿� ������ �˻��϶�. */
select dno as "�μ�",round(avg(salary)) as "��ձ޿�"
from employee
group by dno
order by round(avg(salary)) desc;
/* Q11. �μ���, ��������� ����� ��ձ޿��� ���� ������ �˻��϶�. */
select dno as "�μ�", job as "�������", round(avg(salary)) as "��ձ޿�"
from employee
group by dno, job
order by dno, round(avg(salary)) desc;

select dno, job, sum(salary)
from employee
group by dno, job
order by dno, job;


select sum(decode(dno, 10, sum(salary))) as "�μ�10",
       sum(decode(dno, 20, sum(salary))) as "�μ�20",
       sum(decode(dno, 30, sum(salary))) as "�μ�30"
from employee
group by dno;

select job, decode(dno, 10, sum(salary)) as "�μ�10",
       decode(dno, 20, sum(salary)) as "�μ�20",
       decode(dno, 30, sum(salary)) as "�μ�30"
from employee
group by dno, job;
