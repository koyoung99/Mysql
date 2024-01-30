# 문제1
select first_name, manager_id, commission_pct, salary
from employees
where salary >3000 
	  and commission_pct is null
      and manager_id is not null;
      
# 문제2
select employee_id, 
	   first_name, salary, 
	   case when date_format(hire_date, '%a')='Mon' then concat(hire_date,' ', '월요일')
			when date_format(hire_date, '%a')='Tue' then concat(hire_date,' ', '화요일')
			when date_format(hire_date, '%a')='Wed' then concat(hire_date,' ', '수요일')
			when date_format(hire_date, '%a')='Thu' then concat(hire_date,' ', '목요일')
			when date_format(hire_date, '%a')='Fri' then concat(hire_date,' ', '금요일')
			when date_format(hire_date, '%a')='Sat' then concat(hire_date,' ', '토요일')
			when date_format(hire_date, '%a')='Sun' then concat(hire_date,' ', '일요일')
		end hire_date,
	   replace(phone_number,'.','-') phone_number, 
       department_id
from employees
where (department_id, salary) 
	   in (select department_id, max(salary) from employees group by department_id)
order by salary desc;

# 문제3
select *
from employees m
where salary >= (select avg(salary) from employees);

# 문제4
select e.employee_id, e.first_name, d.department_name, m.first_name
from employees e
join employees m on e.manager_id=m.employee_id
left outer join departments d on e.department_id=d.department_id;

# 문제5
select * 
from employees
where date_format(hire_date,'%Y')>2005
limit 10,10;

# 문제6
select first_name 이름,
       salary 월급,
       department_id 부서월급,
       hire_date 입사날짜
from employees
where hire_date in (select max(hire_date) from employees);

# 문제7
select e.employee_id 사번,
	   e.first_name 성,
	   e.last_name 이름,
       e.salary 월급,
       j.job_title 업무명,
	   s.asalary 부서평균월급,
       e.department_id 부서아이디
from employees e
join jobs j on e.job_id=j.job_id
join (select department_id, avg(salary) asalary from employees group by department_id) s on e.department_id=s.department_id
group by e.employee_id, s.asalary, e.department_id 
having s.asalary >= (select max(asalary) from employees e, 
					(select avg(salary) asalary, department_id
					 from employees group by department_id) s where e.department_id = s.department_id);


# 문제8
select d.department_name, asalary avgSalary
from employees e
join departments d on e.department_id = d.department_id
join (select department_id, avg(salary) asalary from employees group by department_id) s on e.department_id=s.department_id
group by e.department_id
having s.asalary >= (select max(asalary) from employees e, 
				    (select avg(salary) asalary, department_id
					 from employees group by department_id) s where e.department_id = s.department_id);

# 문제9
select r.region_name, avg(e.salary) avgSalary
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
join regions r on r.region_id=c.region_id
group by r.region_name
order by avg(salary) desc
limit 0,1;

# 문제10
select j.job_title, avg(e.salary) salary
from employees e
join jobs j on e.job_id = j.job_id
where e.salary=(select max(salary) from employees)
group by j.job_id, j.job_title;
