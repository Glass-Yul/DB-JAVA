-- connect as hr/hr1234
-- 4.3 그룹함수와 그룹핑
-- 4.3.1 : 그룹함수(count, sum, avg, min, max)

-- [예제 4-18] : 사원의 행의 수
select count(*) "사원 행 수" from employees;
---------------------------------------------------

-- [예제 4-19] : 전체 사원의ㅣ 연봉 합계, 연봉 평균, 계산 평균연봉을 조회하시오.
-- 평균 = 전체급여합계/사원건수
select sum(salary) 합계,avg(salary) 평균, sum(salary)/count(salary) 평균2 from employees;
---------------------------------------------------

-- [예제 4-20] : 전체사원의 연봉 중 연봉 최대값, 연봉 최솟값, 사원의 이름중 최대문자값, 최소문자값을 조회하시오.
select max(salary) 최대값, min(salary)최솟값, max(first_name || last_name) 최대문자값, min(first_name || last_name) 최소문자값 from employees;
---------------------------------------------------

--4.3.2 : group by
-- [예제 4-21]: employee_id가 10이상인 사원들의 job_id(직무)별로 그룹화하여
--             총연봉과 평균연봉을 조회하시오.
--             (조회순서는 job_id별 총연봉 기준 내림차순으로 정렬)  
select job_id 직무, sum(salary) 총연봉, avg(salary) 평균연봉 
from employees
where employee_id>=10
group by job_id
order by job_id, 총연봉 desc;
---------------------------------------------------

-- [예제 4-21-2]: employee_id가 10이상인 사원들의 job_id, manager_id로 그룹화하여
--             총연봉과와 평균연봉을 조회하시오.
--             (조회순서는 총급여 기준 내림차순으로 정렬)  
select job_id 대그룹, manager_id 소그룹, sum(salary) As 총연봉, avg(salary) 평균연봉
from employees 
where employee_id>=10
group by job_id, manager_id
order by 총연봉 desc; 
---------------------------------------------------

-- 4.3.3 : having
-- [예제 4-22] : emploiyees 테이블에서 employee_id 가 10이상인 사원에 대해
--              job_id별로 그룹화하여 총연봉와 평균연봉를 구하되,
--              job_id별 총연봉이 30000보다 큰 값만 조회하시오.
--              (조회순서는 job_id별 총급여기준 내림차순으로 정렬)
select job_id 직무, sum(salary) 총연봉, avg(salary) 평균연봉 
from employees
where employee_id>=10
group by job_id having sum(salary)>=3000
order by job_id, 총연봉 desc;
---------------------------------------------------
