# subquery
-- 'Den' 보다 월급을 많은 사람의 이름과 월급은?
-- 1. 'Den'의 월급을 구함
select first_name, salary from employees
where first_name='Den';

-- 2. 'Den'의 월급보다 많은 직원을 구함.
select first_name, salary from employees
where salary>=11000;

-- '1' + '2'
select first_name, salary from employees
where salary > (select salary 
				  from employees 
                  where first_name='Den');


-- [예제] 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
select first_name, salary, employee_id 
from employees
where salary=(select min(salary)
			  from employees);


-- [예제] 평균 월그보다 적게 받는 사람의 이름, 월급을 출력하세요
select first_name, salary
from employees 
where salary<(select avg(salary)
			  from employees);
              
-- [예제] 부서번호가 110인 직원의 급여와 같은 월급을 받는 모든 직원의 사번, 이름, 급여를 출력하세요(row 1개이상일때)
select employee_id, first_name, salary
from employees
where salary in (select salary from employees where department_id=110);

-- [예제] 각 부서별로 최고급여를 받는 사원의 이름과 월급 출력
select department_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

-- [예제] 부서번호가 110인 직원의 급여 보다 큰 모든 직원의 이름, 급여를 출력하세요 (or)
select first_name, salary from employees
where salary>any(select salary from employees where department_id=110);

-- [예제] 부서번호가 110인 직원의 급여 보다 큰 모든 직원의 이름, 급여를 출력하세요 (and)
select first_name, salary from employees
where salary>all(select salary from employees where department_id=110);

-- [예제] 가장적게 월급 받는 직원 이름, 월급
select salary, first_name, hire_date, phone_number
from employees
where salary in (select min(salary) from employees);

-- [예제] 부서별 최고월급, 이름
select salary, first_name
from employees
where (department_id,salary) in (select department_id, max(salary) from employees group by department_id);


-- [예제] 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
# 조건절에서 비교
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
from employees
group by department_id);

# 테이블에서 조인
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary
from employees
group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary;

-- [예제 조건절에서 비교] 각 부서별로 최고급여를 받는 사원을 출력하세요
select department_id, employee_id, first_name, salary
from employees 
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

-- [예제 테이블에서 비교] 각 부서별로 최고급여를 받는 사원을 출력하세요
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, 
	 (select department_id, max(salary) from employees group by department_id) s
where e.department_id=s.department_id
and e.salary=s.salary;