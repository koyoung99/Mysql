# 문제1
select count(manager_id) haveMngCnt from employees;

# 문제2
select max(salary) 최고임금, min(salary) 최저임금, max(salary)-min(salary) '최저임금-최저임금' from employees;

# 문제3
select date_format(max(hire_date), '%Y년 %m월 %d일') from employees;

# 문제4
select avg(salary) '평균임금', max(salary) '최고임금', min(salary) '최저임금', department_id '부서번호'
from employees 
group by department_id 
order by department_id desc;

# 문제5
select avg(salary) '평균임금', max(salary) '최고임금', min(salary) '최저임금', job_id '업무아이디'
from employees 
group by job_id
order by round(avg(salary),0) and min(salary) desc ;

# 문제6
select date_format(min(hire_date), '%Y-%m-%d %W')from employees;

# 문제7
select department_id '부서', avg(salary) '평균임금', min(salary) '최저임금', avg(salary)-min(salary) '평균임금-최저임금' 
from employees
group by department_id
having avg(salary)-min(salary)<2000
order by avg(salary)-min(salary) desc;

# 문제8
select job_id,max(salary)-min(salary)
from employees
group by job_id
having max(salary)-min(salary) 
order by max(salary)-min(salary) desc;

# 문제9
select manager_id, round(avg(salary),1), max(salary), min(salary) 
from employees
group by manager_id
having avg(salary)>=5000
order by avg(salary) desc;


# 문제10
select hire_date,
case when hire_date <'2002-12-31' then '창립멤버'
	 when date_format(hire_date, '%y')=03 then '03년생입사'
     when date_format(hire_date, '%y')=04 then '04년생입사'
	else '상장이후입사'
    end optDate
from employees;

# 문제11
select date_format(min(hire_date), '%Y년 %m월 %d일 (%a)')
/* case when date_format(min(hire_date), '%a')='Mon' then '월요일'
	 when date_format(min(hire_date), '%a')='Tus' then '화요일'
     when date_format(min(hire_date), '%a')='Wen' then '수요일'
     when date_format(min(hire_date), '%a')='Ths' then '목요일'
     when date_format(min(hire_date), '%a')='Fri' then '금요일'
     when date_format(min(hire_date), '%a')='Sat' then '토요일'
     when date_format(min(hire_date), '%a')='Sun' then '일요일'
	else '요일'
end '요일'
*/
from employees;