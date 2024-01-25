# 문제1
select count(salary)
from employees
where salary < (select avg(salary) from employees);

# 문제2
select employee_id, first_name, salary, avg(salary), max(salary)
from employees
where salary>=(select avg(salary) from employees) and
	  salary<=(select max(salary) from employees)
group by employee_id
order by salary ;

# 문제3
select * 
from locations
where location_id in (select location_id from departments where department_id 
					  in (select department_id from employees where first_name ='steven' and last_name='king'));

# 문제4
select employee_id, first_name, salary
from employees where salary < any(select salary from employees where job_id='st_man' )
order by salary desc;

# 문제5
select employee_id, first_name, salary, department_id from employees order by salary desc;
select department_id, max(salary) from employees group by department_id;
-- 조건절에서 비교
select employee_id, first_name, salary, department_id 
from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id)
order by salary desc;

-- 테이블에서 비교
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary from employees group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary;

# 문제6
select j.job_title, sum(e.salary) 
from employees e, jobs j 
where e.job_id = j.job_id
group by j.job_title
order by sum(e.salary) desc;

# 문제7
select e.employee_id, e.first_name, e.salary
from employees e
where salary > (select avg(salary) from employees where department_id = e.department_id);


# 문제8
select employee_id, first_name, salary, hire_date
from employees
order by hire_date 
limit 10,5;




		