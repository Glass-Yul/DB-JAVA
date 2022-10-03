-- connect hr/hr1234
-- SQL문 기본 연습
--3.1.2 : 모든 컬럼 조회(*)
--[예제 3-1] : employees의 모든 컬럼 조회
select * from employees;
---------------------------------------------------

--3.1.3 : 특정 항목조회
--[예제 3-2] : 직원들의 사원번호와 이름만 출력 
select employee_id 사원번호, first_name || last_name 이름 from employees;
---------------------------------------------------

--3.1.3 : 조회정렬(order by절 - ASC DESC)
--[예제 3-3]: 직원들의 사원번호와 이름만 출력 (사번 내림차순)
select employee_id 사원번호, first_name || last_name 이름 
from employees
order by 사원번호 desc;
---------------------------------------------------

--3.1.4 : 중복제거(distinct)
---------------------------------------------------

--[예제 3-4] : job_id값을 중복제거
select distinct(job_id)
from employees;
--------------------------------------------------

--3.1.5 : 별칭 사용 (AS)
--[예제 3-5] : 별칭사용
select job_id 부서ID
from employees;
---------------------------------------------------


--3.1.6 : 연결연산자 사용 (||)
--[예제 3-6] : 연결연산자 사용하여 이름 출력 
select first_name || last_name 이름 from employees;
---------------------------------------------------

--[예제 3-7] : 연결연산자 사용하여 이메일 형식 완료(xxxx@company.com) 
select email || '@seoil.kr' 이메일 from employees;
---------------------------------------------------

--3.1.7 : 산술연산 : (), *, /, _, -
--[예제 3-8] : 사원의 사원번호, 급여, 추가급여(급여+500),인하급여(급여-100), 조정급여(급여에 10%추가하여 2로 나눔) 조회 
select employee_id 사원번호, salary 급여, salary+500 추가급여, salary-100 인하급여, (salary*1.1)/2 조정급여
from employees;
---------------------------------------------------

--[예제 3-9] : 별명 사용하여 사원의 사원번호, 급여, 추가급여,인하급여, 조정급여 조회 
select employee_id 사원번호, salary 급여, salary+500 추가급여, salary-100 인하급여, (salary*1.1)/2 조정급여
from employees;
---------------------------------------------------

--3.2.1 : where 조건절 사용
--[예제 3-10] : 비교연산자 '=' 사용 : 아이디가 100인 사원정보 조회 
select * from employees
where employee_id=100;
---------------------------------------------------

--[예제 3-11] : first_name이 'David'인 사원정보 조회
select * from employees
where first_name='David';
---------------------------------------------------

--[예제 3-12] 비교연산자 '>=' 사용  : 아이디가 105 이상인 사원정보 조회 
select * from employees
where employee_id>=105;
---------------------------------------------------

--3.2.2 : SQL연산자(BETWEEN A AND B, IN, LIKE, IS NULL)
--[예제 3-13] : 비교연산자 사용 : 급여가  10000 이상이고 20000이하인 사원정보조회
select * from employees
where salary between 1000 and 20000;
select * from employees
where salary >= 1000 and salary <= 20000;
---------------------------------------------------
--[예제 3-13] : BETWEEN A AND B 연산자 사용 : 급여가  10000 이상이고 20000이하인 사원정보조회
select * from employees
where salary between 1000 and 20000;
---------------------------------------------------

--[예제 3-14] : 조건연산자 사용 : 급여가 1000, 17000, 240000인 정보조회
select * from employees
where salary = 1000 or salary = 17000 or salary = 240000;
select * from employees;
---------------------------------------------------
--[예제 3-14] : IN연산자 사용 : 급여가 1000, 17000, 240000인 정보조회
select * from employees
where salary in ( 1000, 17000, 240000);
---------------------------------------------------

--[예제 3-15] : like 연산자 : job_id가 'AD'로 시작하는 모든 사원정보 조회
select * from employees
where job_id like 'AD%';
---------------------------------------------------

--[예제 3-16] :  : like 연산자 : job_id가 'AD'로 시작하고 'AD'다음에 문자열이 3자리인 모든 사원정보 조회
select * from employees
where job_id like 'AD___';
---------------------------------------------------

--[예제 3-17] : IS NULL연산자 :  manager_id가 null값인 직원 정보 조회
select * from employees
where manager_id is null;
---------------------------------------------------

--3.2.3 : 논리연산자(AND, OR, NOT)
--[예제 3-18] : 논리연산자(AND, OR, NOT) : salary가 4000을 초과하면서, job_id가 'IT_PROG'인 사원의 정보를 조회
select * from employees
where salary>4000 and job_id='IT_PROG';
---------------------------------------------------

--[예제 3-19] : 논리연산자(AND, OR, NOT) : salary가 4000을 초과하면서, job_id가 'IT_PROG'이거나 'FI_ACCOUNT' 사원의 정보를 조회
select * from employees
where salary>4000 and job_id in ('IT_PROG','FI_ACCOUNT');
---------------------------------------------------

--[예제 3-20] : 논리연산자(AND, OR, NOT) : 사원id각 105가 아닌 모든 사원정보 조회
select * from employees
where not employee_id = 105;
---------------------------------------------------

--[예제 3-21]: 논리연산자(AND, OR, NOT) : manager_id가 NULL이 아닌 모든 사원정보 조회
select * from employees
where manager_id is not null;
---------------------------------------------------
