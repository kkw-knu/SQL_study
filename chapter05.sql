select sum(salary) as "�޿��Ѿ�",
round(avg(salary)) as "�޿����",
max(salary) as "�ִ�޿�",
min(salary) as "�ּұ޿�",
count(*) as "��������",
count(ename),
count(commission)
from employee;

select min(hiredate) "�����Ի���" from employee;

/*�׷��Լ��� �ش��Լ��� null�ΰ��� �����ϰ� ����Ѵ�.*/
select sum(commission), avg(commission), count(commission)
from employee;

select count(*) as "����� ��"
from employee;

select count(distinct job) as "���� ������ ����"
from employee;

select count(*), count(job) from employee;

select dno, max(salary)
from employee
group by dno;

select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno, job;

select dno, max(salary)
from employee
group by dno
having max(salary) >= 3000;

/*MANAGER�� �����ϰ� �޿� �Ѿ��� 5000�̻��� ������ �޿� �Ѿ� ���ϱ�*/
select job,count(*), sum(salary) as �޿�����
from employee
where job!='MANAGER'
group by job
having sum(salary)>=5000;
/*�μ��� ��ձ޿� �߿��� �ְ� ��ձ޿� ���ϱ�*/
select max(round(avg(salary)))
from employee
group by dno;