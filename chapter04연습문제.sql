/* Q1. ������� ����̸�, ��������� �ҹ��ڷ� �˻��϶�. */
select lower(ename), lower(job)
from employee;
/* Q2. ������� ����̸�, ��������� �빮�ڷ� �˻��϶�. */
select upper(ename), upper(job)
from employee;
/* Q3. ������� ����̸�, ��������� ù �ڸ� �빮�ڷ� �˻��϶�. */
select initcap(ename), initcap(job)
from employee;
/* Q4. ������� ����̸��� ����̸��� ù �� ���ڸ� �˻��϶�. */
select ename, substr(ename, 1,2) as "ù �� ����"
from employee;
/* Q5. ������� ����̸��� ����̸��� ���̸� �˻��϶�. */
select ename, length(ename) as ����
from employee;
/* Q6. ������� ����̸��� 'A'�� �� ��° ��ġ�� �ִ��� �˻��϶�. */
select ename, instr(ename,'A',1) ��ġ
from employee;
/* Q7. ����̸��� 15�ڸ��� �ϰ�, �ڿ� '*'�� ä�� �˻��϶�. */
select rpad(ename, 15, '*')
from employee;
/* Q8. ����� �����ȣ, ����̸�, �޿��� �˻��϶�(�޿��� �� ��° �ڸ����� �ݿø���). */
select eno, ename, round(salary,-2) �޿�
from employee;
/* Q9. ����� �����ȣ, ����̸�, �޿��� �˻��϶�(�޿��� �� ��° �ڸ����� ������). */
select eno, ename, trunc(salary,-2) �޿�
from employee;
/* Q10. ����� �����ȣ, ����̸�, �Ի� �� 100���� ��¥�� �˻��϶�. */
select eno, ename, hiredate+100 "�Ի�100��"
from employee;
/* Q11. ����� �����ȣ, ����̸�, �Ի���, �ٹ� ���ڸ� ����Ͽ� �˻��϶�. */
select eno, ename, hiredate, round(sysdate-hiredate) �ٹ�����
from employee;
/* Q12. ������� �Ի��Ͽ��� 3��° �Ǵ� ��¥�� �˻��϶�. */
select ename, add_months(hiredate,3) "�Ի�3��"
from employee;
/* Q13. ������� �Ի��� ���� ������� ��¥�� �˻��϶�. */
select ename, next_day(hiredate, '�����') "�Ի���ù�����"
from employee;
/* Q14. ������� �Ի���� ������ ��¥�� �˻��϶�. */
select ename, last_day(hiredate) "�Ի���� ��������"
from employee;
/* Q15. ����ڻ����ȣ�� ���� ����� ��� '����� ����'�� ��Ÿ������ �ϴ� ���ǹ��� �ۼ��϶�. */
select eno, ename, nvl(to_char(manager),'����� ����') as manager
from employee;
/* Q16. Ŀ�̼��� ������ �޿��� �����ȣ, ����̸��� �Բ� �˻��϶�. */
select eno, ename, round(salary+nvl(commission,0)/12) "+commission salary" 
from employee;
/* Q17. ����ڻ����ȣ�� NULL�� ��� 'CEO'�� �ٲپ� �����ȣ, ����̸�, ����ڻ����ȣ�� �˻��϶�. */
select eno, ename,  nvl(to_char(manager),'CEO') as manager
from employee;
/* Q18. DECODE �Լ��� ���޿� ���� �λ�ȱ޿��� ���Ͻÿ�. ������ 'SALESMAN'�� ����� 10%, 'MANAGER'�� ����� 30%, 'CLERK'�� ����� 20%�� �λ��Ͻÿ�. */
select ename, job, decode(job, 'SALESMAN', round(salary+salary*0.1),
                                'MANAGER', round(salary+salary*0.3),
                                'CLERK', round(salary+salary*0.2),
                                salary) as salary
from employee;
/* Q19. CASE �Լ��� ���޿� ���� �λ�ȱ޿��� ���Ͻÿ�. ������ 'SALESMAN'�� ����� 10%, 'MANAGER'�� ����� 30%, 'CLERK'�� ����� 20%�� �λ��Ͻÿ�. */
select ename, job, CASE job when 'SALESMAN' then round(salary+salary*0.1)
                            when 'MANAGER' then round(salary+salary*0.3)
                            when 'CLERK'  then round(salary+salary*0.2)
                            else salary 
                    end as salary
from employee;