/* Q1. 전체 사원의 입사일 중 최초 입사일과 최근 입사일을 검색하라. */
select min(hiredate) as "최초입사일", max(hiredate) as "최근입사일"
from employee;
/* Q2. 사원 테이블의 로우(행)의 수를 검색하라. */
select count(*) as "로우의 수"
from employee;
/* Q3. 사원이름의 개수를 검색하라. */
select count(ename) as "사원이름개수"
from employee;
/* Q4. 커미션 열의 개수를 검색하라. */
select count(commission) as "열의 개수"
from employee;
/* Q5. 부서별 사원들의 인원수를 검색하라. */
select dno as "부서", count(dno) as "인원수"
from employee
group by dno;
/* Q6. 부서별 사원들의 평균 급여를 검색하라. */
select dno as "부서", round(avg(salary)) as "평균급여"
from employee
group by dno;
/* Q7. 부서별, 사원직무별 사원들의 평균 급여를 검색하라. */
select dno as "부서",job as "사원직무", round(avg(salary)) as "평균급여"
from employee
group by dno, job
order by dno;
/* Q8. 부서별, 사원직무별 사원의 입사일 중 최초 입사일과 최근 입사일을 검색하라. */
select dno as "부서", job as "사원직무", min(hiredate) as "최초입사일", max(hiredate) as "최근입사일"
from employee
group by dno, job
order by dno;
/* Q9. 부서별 사원들의 인원수를 인원수가 많은 순으로 검색하라. */
select dno as "부서", count(*) as "사원수"
from employee
group by dno
order by count(*) desc;
/* Q10. 부서별 사원들의 평균급여를 평균급여 순으로 검색하라. */
select dno as "부서",round(avg(salary)) as "평균급여"
from employee
group by dno
order by round(avg(salary)) desc;
/* Q11. 부서별, 사원직무별 사원의 평균급여를 많은 순으로 검색하라. */
select dno as "부서", job as "사원직무", round(avg(salary)) as "평균급여"
from employee
group by dno, job
order by dno, round(avg(salary)) desc;

select dno, job, sum(salary)
from employee
group by dno, job
order by dno, job;


select sum(decode(dno, 10, sum(salary))) as "부서10",
       sum(decode(dno, 20, sum(salary))) as "부서20",
       sum(decode(dno, 30, sum(salary))) as "부서30"
from employee
group by dno;

select job, decode(dno, 10, sum(salary)) as "부서10",
       decode(dno, 20, sum(salary)) as "부서20",
       decode(dno, 30, sum(salary)) as "부서30"
from employee
group by dno, job;
