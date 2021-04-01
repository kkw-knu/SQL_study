/* Q1. 사원 테이블의 구조를 검색하라. */
DESC employee
/* Q2. 사원들의 사원번호, 사원이름, 사원직무를 검색하라. */
SELECT eno, ename, job
from employee;
/* Q3. 사원들의 상급자사원번호(manager) 중복을 제거하고 검색하라. */
SELECT distinct manager
from employee;
/* Q4. 사원들의 부서번호 중복을 제거하고 검색하라. */
SELECT distinct dno
from employee;
/* Q5. 사원들의 6개월 급여의 합을 검색하라. */
SELECT ename, salary*6
from employee;
/* Q6. 부서번호, 부서이름, 지역을 한글 제목으로 검색하라. */
SELECT dno as 부서번호, dname as 부서이름, loc as 지역
from department;
/* Q7. 입사일, 사원이름을 '80/12/17'에 입사한 SMITH입니다.' 식으로 검색하라. */
SELECT hiredate||'에 입사한 '||ename||'입니다.'
from employee;
/* Q8. 부서번호 30 이외의 부서이름과 지역을 검색하라. */
SELECT dname, loc from department
where not dno=30;
/* Q9. 10번 부서에 근무하는 MANAGER의 사원이름을 검색하라. */
SELECT ename from employee where dno=30 and job='MANAGER';
/* Q10. 사원직무가 "CLERK"이며, 81년 이후에 입사한 사원들의 사원번호와 사원이름을 검색하라. */
SELECT eno,ename from employee where job='CLERK' and hiredate>='1981/01/01';
/* Q11. 20 부서 외에 근무하는 MANAGER의 사원이름을 검색하라. */
SELECT ename from employee where not dno=20 and job='MANAGER';
/* Q12. SALESMAN이며, 급여가 1500 이상인 사원이름을 검색하라. */
SELECT ename from employee where salary>=1500 and job='SALESMAN';
/* Q13. 급여가 1000 이상이며, 2500 이하인 사원의 사원번호, 사원이름, 급여를 검색하라. */
SELECT eno, ename, salary from employee where salary between 1000 and 2500;
--SELECT eno, ename, salary from employee where salary>=1000 and salary<=2500;
/* Q14. 사원번호가 75XX인 사원의 사원번호, 사원이름, 부서번호를 검색하라. */
SELECT eno, ename, dno from employee where eno like '75%';
/* Q15. 부서번호가 10 또는 30에 근무하는 사원들의 사원이름과 급여를 검색하라. */
SELECT ename, salary from employee where dno in(10,30);
/* Q16. 사원번호가 79로 시작하는 사원들의 사원이름, 급여, 커미션을 검색하라. */
SELECT ename, salary, commission from employee where eno like'79%';
/* Q17. 1981년 2월에 입사한 사원의 사원번호, 사원이름, 부서번호를 검색하라. */
SELECT eno, ename, dno from employee where hiredate like '1981/02/%';
/* Q18. 사원이름 중간에 'A'가 들어있는 사원의 사원번호와 사원이름을 검색하라. */
SELECT eno, ename from employee where ename like '_%A%_';
/* Q19. 상급자사원번호가 NULL인 사원의 사원번호와 사원이름을 검색하라. */
SELECT eno, ename from employee where manager is null;
/* Q20. 상급자사원번호가 NULL이 아닌 사원의 사원번호, 사원이름, 상급자사원번호를 검색하라. */
SELECT eno, ename,manager from employee where manager is not null;
/* Q21. 사원직무가 'MANAGER'나 'SALESMAN'이 아닌 사원의 사원번호, 사원이름, 부서번호를 검색하라. */
SELECT eno,ename,dno from employee where job not in('MANAGER','SALESMAN');
/* Q22. 사원들의 사원번호와 사원이름을 부서번호별 이름순으로 검색하라. */
SELECT eno,ename from employee order by dno asc;
/* Q23. 사원들의 정보를 부서별 급여가 많은 순으로 검색하라. */
SELECT * from employee order by salary desc;
/* Q24. 사원들의 정보를 부서번호별, 사원직무별, 급여 순으로 검색하라. */
SELECT * from employee order by dno, job, salary;