# Like 예제 
-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select first_name, salary from employees where first_name like '%am%';

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select first_name, salary from employees where first_name like '_a%';

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name from employees where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name from employees where first_name like '__a_';

# null 예제
-- 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select first_name, salary, commission_pct from employees where commission_pct is not null;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select first_name, manager_id, commission_pct from employees where manager_id is null and commission_pct is null;

-- 부서가 없는 직원의 이름과 월급을 출력하세요
select first_name, salary, department_id from employees where department_id is not null;


#order by 예제
-- 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select department_id, salary, first_name from employees order by department_id ;

-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select first_name, salary from employees where salary>=10000 order by salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요
select department_id, salary, first_name from employees order by department_id , salary desc;

-- 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select first_name, salary, hire_date from employees order by first_name ;

-- 직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select first_name, salary, hire_date from employees order by hire_date;