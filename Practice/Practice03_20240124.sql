# 문제1
select e.employee_id, e.first_name, e.last_name,d.department_name
from employees e 
join departments d 
on e.department_id=d.department_id
order by d.department_name , e.employee_id desc;

# 문제2
select e.employee_id, e.first_name, e.salary, d.department_name, j.job_title
from employees e
inner join departments d
on e.department_id=d.department_id
inner join jobs j
on e.job_id=j.job_id
order by e.employee_id ;

# 문제2-1
select e.employee_id, e.first_name, e.salary, d.department_name, j.job_title
from employees e
left outer join departments d
on e.department_id=d.department_id
left outer join jobs j
on e.job_id=j.job_id
order by e.employee_id ;

#문제3
select l.location_id, l.city, d.department_name, d.department_id
from  departments d
left outer join locations l
on l.location_id=d.location_id;


# 문제3-1
select l.location_id, l.city, d.department_name, d.department_id
from  locations l
left outer join departments d
on l.location_id=d.location_id;

# 문제4
select r.region_name, c.country_name
from regions r
left outer join countries c
on r.region_id=c.region_id
order by r.region_name, c.country_name desc;

# 문제5
select emp.employee_id ,emp.first_name, emp.hire_date, man.first_name , man.hire_date
from employees emp, employees man
where emp.manager_id = man.employee_id and
      emp.hire_date < man.hire_date;


# 문제6
select c.country_name, c.country_id, l.location_id, d.department_name, d.department_id
from countries c, locations l, departments d;

# 문제7
select e.employee_id, concat(e.first_name, ' ', e.last_name) as name,j.job_id, j.start_date, j.end_date 
from employees e
left outer join job_history j
on e.employee_id=j.employee_id
where j.job_id='AC_ACCOUNT';

# 문제8
select d.department_id,
	   d.department_name,
       e.first_name,
       l.city, 
       c.country_name,
       r.region_name 
from departments d
inner join employees e on e.employee_id=d.manager_id
left outer join locations l on d.location_id=l.location_id
left outer join countries c on l.country_id=c.country_id
left outer join regions r on r.region_id=c.region_id;


# 문제9
select emp.employee_id, emp.first_name, d.department_name, man.first_name
from employees emp
left outer join employees man on emp.manager_id=man.employee_id
left outer join departments d on d.department_id=emp.department_id;

# 문제9-1
select emp.employee_id, emp.first_name, d.department_name, man.first_name as manager 
from employees emp
inner join employees man on emp.employee_id=man.manager_id
left join departments d on emp.department_id=d.department_id;

# 문제9-2
select emp.employee_id, emp.first_name, d.department_name, man.first_name as manager 
from employees emp, employees man, departments d
where emp.manager_id = man.employee_id
and emp.department_id=d.department_id;