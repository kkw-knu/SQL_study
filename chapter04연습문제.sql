/* Q1. 사원들의 사원이름, 사원직무를 소문자로 검색하라. */
select lower(ename), lower(job)
from employee;
/* Q2. 사원들의 사원이름, 사원직무를 대문자로 검색하라. */
select upper(ename), upper(job)
from employee;
/* Q3. 사원들의 사원이름, 사원직무를 첫 자만 대문자로 검색하라. */
select initcap(ename), initcap(job)
from employee;
/* Q4. 사원들의 사원이름과 사원이름의 첫 두 글자를 검색하라. */
select ename, substr(ename, 1,2) as "첫 두 글자"
from employee;
/* Q5. 사원들의 사원이름과 사원이름의 길이를 검색하라. */
select ename, length(ename) as 길이
from employee;
/* Q6. 사원들의 사원이름에 'A'가 몇 번째 위치에 있는지 검색하라. */
select ename, instr(ename,'A',1) 위치
from employee;
/* Q7. 사원이름을 15자리로 하고, 뒤에 '*'를 채워 검색하라. */
select rpad(ename, 15, '*')
from employee;
/* Q8. 사원의 사원번호, 사원이름, 급여를 검색하라(급여는 두 번째 자리에서 반올림함). */
select eno, ename, round(salary,-2) 급여
from employee;
/* Q9. 사원의 사원번호, 사원이름, 급여를 검색하라(급여는 두 번째 자리에서 절삭함). */
select eno, ename, trunc(salary,-2) 급여
from employee;
/* Q10. 사원의 사원번호, 사원이름, 입사 후 100일의 날짜를 검색하라. */
select eno, ename, hiredate+100 "입사100일"
from employee;
/* Q11. 사원의 사원번호, 사원이름, 입사일, 근무 일자를 계산하여 검색하라. */
select eno, ename, hiredate, round(sysdate-hiredate) 근무일자
from employee;
/* Q12. 사원들의 입사일에서 3달째 되는 날짜를 검색하라. */
select ename, add_months(hiredate,3) "입사3달"
from employee;
/* Q13. 사원들의 입사일 다음 토요일의 날짜를 검색하라. */
select ename, next_day(hiredate, '토요일') "입사후첫토요일"
from employee;
/* Q14. 사원들의 입사월의 마지막 날짜를 검색하라. */
select ename, last_day(hiredate) "입사월의 마지막날"
from employee;
/* Q15. 상급자사원번호가 없는 사원의 경우 '상급자 없음'을 나타내도록 하는 질의문을 작성하라. */
select eno, ename, nvl(to_char(manager),'상급자 없음') as manager
from employee;
/* Q16. 커미션을 포함한 급여를 사원번호, 사원이름과 함께 검색하라. */
select eno, ename, round(salary+nvl(commission,0)/12) "+commission salary" 
from employee;
/* Q17. 상급자사원번호가 NULL인 경우 'CEO'로 바꾸어 사원번호, 사원이름, 상급자사원번호를 검색하라. */
select eno, ename,  nvl(to_char(manager),'CEO') as manager
from employee;
/* Q18. DECODE 함수로 직급에 따라 인상된급여를 구하시오. 직급이 'SALESMAN'인 사원은 10%, 'MANAGER'인 사원은 30%, 'CLERK'인 사원은 20%을 인상하시오. */
select ename, job, decode(job, 'SALESMAN', round(salary+salary*0.1),
                                'MANAGER', round(salary+salary*0.3),
                                'CLERK', round(salary+salary*0.2),
                                salary) as salary
from employee;
/* Q19. CASE 함수로 직급에 따라 인상된급여를 구하시오. 직급이 'SALESMAN'인 사원은 10%, 'MANAGER'인 사원은 30%, 'CLERK'인 사원은 20%을 인상하시오. */
select ename, job, CASE job when 'SALESMAN' then round(salary+salary*0.1)
                            when 'MANAGER' then round(salary+salary*0.3)
                            when 'CLERK'  then round(salary+salary*0.2)
                            else salary 
                    end as salary
from employee;