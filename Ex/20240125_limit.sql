# limit
select * from employees;

-- 1번부터 5번
select employee_id, first_name, salary
from employees
order by employee_id asc
limit 0, 5;

-- [예제 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일]
select first_name, salary, hire_date
from employees 
where date_format(hire_date, '%y')='07'
limit 3, 7;