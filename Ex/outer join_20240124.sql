# outer join
-- left join
select count(*) 
from employees e
left join departments d on e.department_id=d.department_id;

-- 모든 직원의 부서번호, 이름, 부서번호를 출력하세요(부서번호가 없는 직원도 표시)
select e.department_id, e.first_name, d.department_name
from employees e 
left outer join departments d
on e.department_id=d.department_id;


-- right outer join
select count(*) 
from employees e
right outer join departments d
on e.department_id=d.department_id;

-- union
(select e.department_id, e.first_name, d.department_name
from employees e 
left outer join departments d
on e.department_id=d.department_id)
union
(select e.department_id, e.first_name, d.department_name
from employees e 
right outer join departments d
on e.department_id=d.department_id);

-- self join
select e.employee_id, e.first_name, m.first_name manaagerName
from employees e, employees m
where e.manager_id=m.employee_id;

