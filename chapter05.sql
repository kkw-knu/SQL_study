select sum(salary) as "급여총액",
round(avg(salary)) as "급여평균",
max(salary) as "최대급여",
min(salary) as "최소급여",
count(*) as "총직원수",
count(ename),
count(commission)
from employee;

select min(hiredate) "최초입사자" from employee;

/*그룹함수는 해당함수가 null인것을 제외하고 계산한다.*/
select sum(commission), avg(commission), count(commission)
from employee;

select count(*) as "사원의 수"
from employee;

select count(distinct job) as "직업 종류의 개수"
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

/*MANAGER을 제외하고 급여 총액이 5000이상인 직무별 급여 총액 구하기*/
select job,count(*), sum(salary) as 급여총합
from employee
where job!='MANAGER'
group by job
having sum(salary)>=5000;
/*부서별 평균급여 중에서 최고 평균급여 구하기*/
select max(round(avg(salary)))
from employee
group by dno;