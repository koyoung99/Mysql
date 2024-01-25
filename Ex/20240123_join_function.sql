# 그룹함수
-- count() 데이터의 총 건수
select count(*) , count(commission_pct) from employees;

select count(*) from employees where salary>16000;

-- sum() 데이터들의 합계값
select count(*) , sum(salary) from employees;

-- avg() 입력된값들의 평균값 (null제외)
select count(*), sum(salary),avg(ifnull(salary,0)) from employees;

-- max()/min() 입력된 값들중 가장큰값 / 작은값
select count(*), max(salary), min(salary) from employees;


-- group by절
select department_id, count(*), sum(salary) from employees group by department_id;

-- having 절
select department_id, count(*), sum(salary) from employees group by department_id having sum(salary)>=2000 and department_id=100;

-- [예제] 월급(salary)의 합계가 20000이상인 부서의 부서번호와 인원수, 월급합계 출력(부서번호 오름차순)
select department_id, count(*), sum(salary) from employees group by department_id having sum(salary)>=20000 order by department_id ;

-- if~esle 문
-- 모든 직원의 이름, 월급, 수당, 상태(state)을 출력하세요(상태컬럼은 수당이 없으면 0, 수당이 있으면 1 을 state 컬럼에 표시)
select first_name, salary, commission_pct, if(commission_pct is null, 0, 1) as state from employees;

-- case~end문 
-- 직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요
select employee_id, salary, job_id,
	   case when job_id='ac_account' then salary + salary*0.1
			when job_id='sa_rep' then salary + salary*0.2
            when job_id='st_clerl' then salary + salary*0.3
            else salary
	   end realSalry
from employees;

-- [예제]
-- 직원의 이름, 부서번호, 팀을 출력하세요
-- 팀은 코드로 결정하며 부서코드가
-- 10~50 이면 'A-TEAM'
-- 60~100이면 'B-TEAM' 
-- 110~150이면 'C-TEAM' 
-- 나머지는 '팀없음' 으로 출력
select first_name, employee_id, department_id,
	   case when department_id between 10 and 50 then 'A-team'
			when department_id between 60 and 100 then 'B-team'
            when department_id between 110 and 150 then 'C-team'
            else '팀없음'
		end teamcode
from employees;
       

-- join
select * from employees, departments;
select e.first_name, d.department_name, e.department_id, d.department_id from employees e, departments d;

-- EQUL join(inner join)
select e.first_name, d.department_name, e.department_id, d.department_id
from employees e inner join departments d 
on e.department_id=d.department_id;

-- [예제]
-- 모든 직원이름, 부서이름, 업무명 을 출력하세요 *3개의 테이블
select first_name, department_name, j.job_title 
from employees e, departments d,jobs j 
where e.department_id=d.department_id 
	  and e.job_id=j.job_id; 

select e.first_name, d.department_name, j.job_id
from employees e
inner join departments d on e.department_id=d.department_id 
inner join jobs j on e.job_id=j.job_id;