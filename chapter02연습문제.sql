/* Q1. ��� ���̺��� ������ �˻��϶�. */
DESC employee
/* Q2. ������� �����ȣ, ����̸�, ��������� �˻��϶�. */
SELECT eno, ename, job
from employee;
/* Q3. ������� ����ڻ����ȣ(manager) �ߺ��� �����ϰ� �˻��϶�. */
SELECT distinct manager
from employee;
/* Q4. ������� �μ���ȣ �ߺ��� �����ϰ� �˻��϶�. */
SELECT distinct dno
from employee;
/* Q5. ������� 6���� �޿��� ���� �˻��϶�. */
SELECT ename, salary*6
from employee;
/* Q6. �μ���ȣ, �μ��̸�, ������ �ѱ� �������� �˻��϶�. */
SELECT dno as �μ���ȣ, dname as �μ��̸�, loc as ����
from department;
/* Q7. �Ի���, ����̸��� '80/12/17'�� �Ի��� SMITH�Դϴ�.' ������ �˻��϶�. */
SELECT hiredate||'�� �Ի��� '||ename||'�Դϴ�.'
from employee;
/* Q8. �μ���ȣ 30 �̿��� �μ��̸��� ������ �˻��϶�. */
SELECT dname, loc from department
where not dno=30;
/* Q9. 10�� �μ��� �ٹ��ϴ� MANAGER�� ����̸��� �˻��϶�. */
SELECT ename from employee where dno=30 and job='MANAGER';
/* Q10. ��������� "CLERK"�̸�, 81�� ���Ŀ� �Ի��� ������� �����ȣ�� ����̸��� �˻��϶�. */
SELECT eno,ename from employee where job='CLERK' and hiredate>='1981/01/01';
/* Q11. 20 �μ� �ܿ� �ٹ��ϴ� MANAGER�� ����̸��� �˻��϶�. */
SELECT ename from employee where not dno=20 and job='MANAGER';
/* Q12. SALESMAN�̸�, �޿��� 1500 �̻��� ����̸��� �˻��϶�. */
SELECT ename from employee where salary>=1500 and job='SALESMAN';
/* Q13. �޿��� 1000 �̻��̸�, 2500 ������ ����� �����ȣ, ����̸�, �޿��� �˻��϶�. */
SELECT eno, ename, salary from employee where salary between 1000 and 2500;
--SELECT eno, ename, salary from employee where salary>=1000 and salary<=2500;
/* Q14. �����ȣ�� 75XX�� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�. */
SELECT eno, ename, dno from employee where eno like '75%';
/* Q15. �μ���ȣ�� 10 �Ǵ� 30�� �ٹ��ϴ� ������� ����̸��� �޿��� �˻��϶�. */
SELECT ename, salary from employee where dno in(10,30);
/* Q16. �����ȣ�� 79�� �����ϴ� ������� ����̸�, �޿�, Ŀ�̼��� �˻��϶�. */
SELECT ename, salary, commission from employee where eno like'79%';
/* Q17. 1981�� 2���� �Ի��� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�. */
SELECT eno, ename, dno from employee where hiredate like '1981/02/%';
/* Q18. ����̸� �߰��� 'A'�� ����ִ� ����� �����ȣ�� ����̸��� �˻��϶�. */
SELECT eno, ename from employee where ename like '_%A%_';
/* Q19. ����ڻ����ȣ�� NULL�� ����� �����ȣ�� ����̸��� �˻��϶�. */
SELECT eno, ename from employee where manager is null;
/* Q20. ����ڻ����ȣ�� NULL�� �ƴ� ����� �����ȣ, ����̸�, ����ڻ����ȣ�� �˻��϶�. */
SELECT eno, ename,manager from employee where manager is not null;
/* Q21. ��������� 'MANAGER'�� 'SALESMAN'�� �ƴ� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�. */
SELECT eno,ename,dno from employee where job not in('MANAGER','SALESMAN');
/* Q22. ������� �����ȣ�� ����̸��� �μ���ȣ�� �̸������� �˻��϶�. */
SELECT eno,ename from employee order by dno asc;
/* Q23. ������� ������ �μ��� �޿��� ���� ������ �˻��϶�. */
SELECT * from employee order by salary desc;
/* Q24. ������� ������ �μ���ȣ��, ���������, �޿� ������ �˻��϶�. */
SELECT * from employee order by dno, job, salary;