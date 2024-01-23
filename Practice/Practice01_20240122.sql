# 문제 1
select concat(first_name, ' ', last_name) '이름',
	   salary '월급',
       phone_number '전화번호', 
       hire_date '입사일'
from employees
order by hire_date asc, first_name asc ;

# 문제2
select * from jobs order by job_id, max_salary desc;

# 문제3
select first_name, manager_id, commission_pct, salary 
from employees
where salary>3000 and commission_pct is null and manager_id is not null;

# 문제4
select job_title, max_salary from jobs where max_salary>=10000 order by max_salary desc;

# 문제5
select first_name, salary, ifnull(commission_pct,0) 'commission_pct' from employees where salary between 10000 and 14000 order by salary desc;

# 문제6
select first_name, salary, date_format(hire_date,'%Y-%m'), department_id from employees where department_id in (10,90,100);

# 문제7
select first_name, salary from employees where first_name like '%s%' or '%S%';

# 문제8
select * from departments order by char_length(department_name) desc;

# 문제9
select country_id, upper(country_name), region_id from countries order by country_name asc;

# 문제10
select first_name, salary, replace(phone_number, '.', '-') 'phone_number', hire_date from employees where hire_date <'2003-12-31';

