use hrdb;

# select문 
select * from employees;	#직원
select * from departments;	#부서
select * from locations;	#도시
select * from countries;	#국가
select * from regions;		#지역
select * from job_history;	#업무현황
select * from jobs;			#업무

-- 모든 직원의 이름(first_name)과 전화번호 입사일 연봉 출력
select first_name, phone_number, hire_date,salary*12 '연봉' from employees;

-- 모든 직원의 이름(first_name,last name)과 월급 전화번호 이메일 입사일 출력
select first_name , last_name , salary , phone_number , email , hire_date from employees;

-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select first_name '이름', phone_number '전화번호', hire_date '입사일', salary '월급' from employees;

-- 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일, 입사일로 표시
select employee_id '사 번', first_name '이름', last_name '성', salary '월급', 
		phone_number '전화번호', email '이메일', hire_date '입사일' 
from employees;
        

-- 산술 연산자 사용하기
/**
• 월급에서 $100 제외
• 월급 12개월
• 연봉에 $5000 추가
• 월급을 30일로 나누기
• 3개의 팀으로 나누기
**/
select first_name, salary '월급', salary-100 '월급-식대', salary*12 '연봉', 
		salary*12+5000 '보너스포함', salary/30 '일급', employee_id%3 '워크샵 팀'
from employees;

-- 연산 시 문자열은 0으로 처리
select job_id*12 from employees;

-- concat() 문자열 연결, 결합
select concat(first_name,'-', last_name) 'name'
from employees;

select concat(first_name,' ', last_name, 'hire date is ', hire_date) 'name' 
from employees;

-- 전체직원의 정보 [예제]
select concat(first_name,'-', last_name) '성명', 
salary '월급', salary*12 '연봉', salary*12+5000 '보너스', phone_number '전화번호'
from employees;

--  테이블의 컬럼명>>테이블의 데이터, 문자열,숫자는 그대로 출력
select first_name, salary, '(주)개발자' as company, 3 from employees;

--  MySQL은 테이블명을 생략할 수 있다
select '(주)개발자' as company, 3;

select now();

select 12*5;

# where절 예제
select * from employees;

select first_name, department_id
from employees
where department_id=100;

-- 연봉이 15000 이상인 사원들의 이름과 월급을 출력
select * from employees;
select first_name '이름', salary '월급' from employees where salary>=15000;

-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select * from employees;
select first_name as 이름, hire_date as 입사일 from employees where hire_date>='2007-01-01';

-- 이름이 Lex인 직원의 이름과 월급을 출력하세요
-- 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용
select * from employees;
select first_name as 이름, salary as 월급 
from employees where binary first_name='Lex'; 

-- 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select first_name as 이름, salary as 월급 
from employees where  salary>= 14000 and salary <=17000;

-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, hire_date from employees
where hire_date between '2004-01-01' and '2005-12-31';

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select * from employees;
select first_name, salary from employees where salary in (2100, 3100, 4100, 5100);
