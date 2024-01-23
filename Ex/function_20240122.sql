# 숫자함수
-- Round(숫자,m) 반올림, 소수점m자리까지 표현
select round(123.123, 2),
	   round(123.126, 2),
       round(234.567, 0),
       round(123.456, 0), 
	   round(123.456),
	   round(123.126, -1), 
	   round(125.126, -1), 
	   round(123.126, -2)
from dual;

-- Ceil(숫자) 올림
select ceil(123.456),
	   ceil(123.789),
	   ceil(123.7892313),
	   ceil(987.1234);

-- Floor(숫자) 내림
select floor(123.456),
	   floor(123.789),
	   floor(123.7892313),
	   floor(987.1234);
       
-- truncate(숫자,m) 버림, 소수점 m자리까지 표현
select truncate(1234.34567, 2),
	   truncate(1234.34567, 3),
	   truncate(1234.34567, 0),
	   truncate(1235.34567, -2);
       
-- power(숫자, n) pw(숫자, n) 숫자의 n승
select pow(12,2), power (12,2);

-- sqrt(숫자) 숫자의 제곱근
select sqrt(144);

-- sign(숫자) 숫자가 음수이면 -1, 양수이면 1, 0이면 0
select sign(123), sign(0), sign(-123);

-- abs(숫자) 절대값
select abs(123), abs(0), abs(-123);

-- greatest(x,y,z...) 괄호안의 값 중 가장 큰 값
select greatest(2,0,-2), greatest(4,3.2,5.25), greatest('B', 'A', 'C', 'c');

-- least(x.y,z...) 괄호안의 값 중 가장 작은값
select least(2,0,-2), least(4,3.2, 5.25), least('B', 'A', 'C', 'c');

# 문자함수
-- concat(str1, str2, str3, ...) str1, str2, str3 ... 을 연결
select concat('안녕', '하세요');
select concat('안녕', '-','하세요');

-- concat_ws(s, str1, str2, str3, ...) str1, str2, str3 을 연결할때 s로 연결
select concat_ws('-', 'abc', '123', '가나다');

-- lcase(str) or lower(str) str의 모든 대문자를 소문자로 변환
select first_name,
	   lcase(first_name),
	   lower(first_name),
	   lower('ABCabc!#$%'),
	   lower('가나다')
from employees;

-- ucase(str) or upper(str) str의 모든 소문자를 대문자로 변환
select first_name,
	   ucase(first_name),
	   upper(first_name),
	   upper('ABCabc!#$%'),
	   upper('가나다')
from employees;

-- length(str) str의 길이를 byte로 반환
select first_name,
	   length(first_name),
	   char_length(first_name), 
	   character_length(first_name)
from employees;

-- char_length(str) or character_length() str의 문자열 길이를 반환
select length('a'), char_length('a'), character_length('a'),length('가'), char_length('가'), character_length('가');

-- substring(str, pos, len) or substr(str, pos, len) str의 pos위치에서 시작하여 len길이의 문자열 반환
select first_name, substr(first_name,1,3), substr(first_name,-3,2)
from employees
where department_id = 100;

-- trim(str) str의 양쪽에 있는 공백 문자를 제거
-- ltrim(str) str의 왼쪽에 있는 공백 문자를 제거
-- rtrim(str) str의 오른쪽에 있는 공백 문자를 제거
select concat('|', '   안녕하세요   ', '|' ),
	   concat('|', trim('   안녕하세요   '), '|' ),
	   concat('|', ltrim('   안녕하세요   '), '|' ),
	   concat('|', rtrim('   안녕하세요   '), '|' );
       
-- replace(str, from _str, to_str) str에서 from_str을 to_str로 변경
select first_name, 
replace(first_name, 'a', '*'), 
replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;


# 날짜/시간함수
-- current_date() or curdate() 현재 날짜 반환
select current_date(), curdate();

-- current_time() or curtime() 현재 시간 반환
select current_time(), curtime();

-- current_timestamp() or now() 현재 날짜와 시간 반환
select current_timestamp(), now();

-- adddate() or date_add() 날짜시간 더하기
select adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 DAY), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND);

-- subdate() or date_sub() 날짜시간 빼기
select subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 DAY), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE), 
	   subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND);

-- datediff() 두 날짜간 일수차
select datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00');

-- timediff() 두 날짜시간 간 시간차
select timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00');


# 변환함수
-- date_format(date, format) date를 format형식으로 변환
select now(), date_format(now(), '%y-%m-%d %H:%i:%s'),
	   date_format(now(), '%Y-%m-%d(%a) %H:%i:%s %p')
from dual;

-- str_to_date(str, format) str를 format형식으로 변환
select datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'), 
str_to_date('2021-06-01 12:30:05', '%Y-%m-%d'));

-- format(숫자, p) 숫자에 콤마를 추가, 소수점 p까지 출력
SELECT format(1234567.89, 2),
	   format(1234567.89, 0),
	   format(1234567.89, -5);

-- cast(expression as type) expression을 type형식으로 변환
select cast(1234567.89 as char);
select cast('2024-01-10' as date);

-- ifnull(컬럽명, null일때 값) 컬럼의 값이 null일때 정해진 값을 출력
select commission_pct, ifnull(commission_pct, '없음') from employees;
