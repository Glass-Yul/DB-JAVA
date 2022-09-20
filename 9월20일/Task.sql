-- connect hr/hr1234
-- SQL문 기본 연습 QUIZ
--[Quiz 3-1-1] : Departments의 모든 컬럼 조회
select * from Departments;
---------------------------------------------------

--[Quiz 3-1-2] : 부서명 조회
select department_name from Departments;
---------------------------------------------------

--[Quiz 3-1-3] : 부서명을 중복없이 조회
select distinct department_name from Departments;
---------------------------------------------------

--[Quiz 3-1-4]: 부서명 오름차순 정렬
select distinct department_name from Departments order by department_name;
---------------------------------------------------

--[Quiz 3-1-4] : 부서코드80인 부서의 부서코드, 부서명 조회
select department_id,department_name from Departments where department_id=80;
---------------------------------------------------

--[Quiz 3-1-5] : IT관련부서 부서코드, 부서명 조회
select department_id,department_name from Departments where department_name like 'IT%';
---------------------------------------------------

--[Quiz 3-2-1] : Jobs의 모든 컬럼 조회
select * from jobs;
---------------------------------------------------

--[Quiz 3-2-2] : job title 조회
select job_title from jobs;
---------------------------------------------------

--[Quiz 3-2-3] : job title 중복없이 조회
select distinct job_title from jobs;
---------------------------------------------------

--[Quiz 3-2-3]:  job title  내림차순 정렬
select distinct job_title from jobs order by job_title desc;
---------------------------------------------------

--[Quiz 3-2-4] : manager에 속하는 job_id, job_title을 조회하시오.
select job_id, job_title from jobs where job_title like '%Manager';
---------------------------------------------------

--[Quiz 3-3-1] : 다음과 같이 조회되도록 SQL문을 작성하시오
-- 조회형태
--  사원이름            이메일           연봉           성과급율
--  steve jobs   sthob@company.com   1000000$             10%
select first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉 from employees;
---------------------------------------------------

--[Quiz 3-3-2] : 성과급율이 입력되어 있는 사원들의 성과급을 
--              다음의 조회형태가 되도록 SQL문을 작성하시오
-- 성과급이 입력 => commission_pct가 null이 아님
-- 성과급 = 연봉*성과급율
-- 조회형태
--  사원이름         이메일           연봉           성과급율             성과급($)
-- steve jobs   sthob@company.com   14000$          .4%                5600$      
select first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉, commission_pct||'%' 성과급률, (salary*commission_pct)||'$' 성과급
from employees
where commission_pct is not null;
---------------------------------------------------

-- [Quiz 3-3-3] : IT관련 부서 근무자를 조회하시오.
--IT관련부서 부서코드 : 60, 210, 230
select * from Departments where department_id in (60,120,230);
---------------------------------------------------

-- [Quiz 3-3-4] : manager 직군에 속하는 근무자를 조회하시오.
-- manager직군 직군코드 : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
select * from jobs where job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN');
---------------------------------------------------



-- [Quiz 3-3-5] : IT관련 부서 근무자의 연봉과 성과급율을 조회하시오. (부서, 사원이름 순 조회)
--IT관련부서 부서코드 : 60, 210, 230
-- 성과급 = 연봉*성과급율
-- 조회형태
--  부서ID     사원이름         이메일           연봉           성과급율             성과급($)
--    60     steve jobs   sthob@company.com   14000$          .4%                5600$      
select D.department_id 부서ID, first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉, commission_pct||'%' 성과급률, (salary*commission_pct)||'$' 성과급 
from Departments D join employees E on D.department_id=E.department_id
where D.department_id in (60,210,230);

---------------------------------------------------


-- [Quiz 3-3-6] : manager 직군에 속하는 근무자의 연봉과 성과급율을 조회하시오. (직군ID, 사원이름 순 조회)
-- manager직군 직군코드 : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- 성과급 = 연봉*성과급율
-- 조회형태
--  직군ID     사원이름         이메일           연봉           성과급율             성과급($)
--  AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select jobs.job_id 직군ID, first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉, commission_pct||'%' 성과급률, (salary*commission_pct)||'$' 성과급 
from jobs join employees on jobs.job_id = employees.job_id
where jobs.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN');  
---------------------------------------------------


-- [Quiz 3-3-7] : manager 직군에 속하면서 성과급율이 NULL 값이 아닌 근무자의 연봉과 성과급율을 조회하시오. (직군ID, 사원이름 순 조회)
-- manager직군 직군코드 : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- 성과급 = 연봉*성과급율
-- 조회형태
--  직군ID     사원이름         이메일           연봉           성과급율             성과급($)
--  AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select jobs.job_id 직군ID, first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉, commission_pct||'%' 성과급률, (salary*commission_pct)||'$' 성과급 
from jobs join employees on jobs.job_id = employees.job_id
where jobs.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN')and commission_pct is not null;  
---------------------------------------------------


-- [Quiz 3-3-8] : manager 직군에 속하면서 성과급율이 NULL 값이 아닌 근무자중 
--                연봉이 12000$이상 15000$이하인 대상자의 연봉과 성과급율을 조회하시오. (직군ID, 사원이름 순 조회)
-- manager직군 직군코드 : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- 성과급 = 연봉*성과급율
-- 조회형태
--  부서ID     사원이름         이메일           연봉           성과급율             성과급($)
--  AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select jobs.job_id 직군ID, first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉, commission_pct||'%' 성과급률, (salary*commission_pct)||'$' 성과급 
from jobs join employees on jobs.job_id = employees.job_id
where salary between 12000 and 15000 and (jobs.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN')and commission_pct is not null ); 
---------------------------------------------------


-- [Quiz 3-3-9] : sales부서내에 manager 직군에 속하면서 성과급율이 NULL 값이 아닌 근무자중 
--                연봉이 12000$이상 15000$이하인 대상자의 연봉과 성과급율을 조회하시오. (직군ID, 사원이름 순 조회)
-- sales부서 부서코드 : 80
-- manager직군 직군코드 : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- 성과급 = 연봉*성과급율
-- 조회형태
--  부서ID     사원이름         이메일           연봉           성과급율             성과급($)
--   AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select J.job_id 직군ID, first_name || last_name 사원이름, email||'@company.com' 이메일, salary||'$' 연봉, commission_pct||'%' 성과급률, (salary*commission_pct)||'$' 성과급 
from (jobs J join employees E on J.job_id = E.job_id) join Departments D on D.department_id = E.department_id
where D.department_id =80 and (salary between 12000 and 15000 and (J.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN')and commission_pct is not null )); 
---------------------------------------------------


-- [Quiz 3-4-1] 사원내역에서 부서별 사원수, 총연봉, 평균연봉, 최대연봉, 최소연봉을 조회하시오.
--              (조회순서는 부서 기준 내림차순으로 정렬) 
-- 조회형태
--  부서ID  사원수    총연봉         평균연봉    최대연봉   최소연봉
--   80      34     304500          8955      14000      6100 
select department_id 부서ID, count(*) 사원수, sum(salary) 총연봉, avg(salary) 평균연봉, max(salary) 최대연봉, min(salary) 최소연봉
from  employees
group by department_id
order by department_id desc;
---------------------------------------------------



-- [Quiz 3-4-2] 사원내역에서 부서코드가 null이 아닌 사원 대상으로
--              부서별 사원수, 총연봉, 평균연봉, 최대연봉, 최소연봉을 조회하시오.
--              (조회순서는 부서 기준 내림차순으로 정렬) 
-- 조회형태
--  부서ID  사원수    총연봉         평균연봉    최대연봉   최소연봉
--   80      34     304500          8955      14000      6100 
select department_id 부서ID, count(*) 사원수, sum(salary) 총연봉, avg(salary) 평균연봉, max(salary) 최대연봉, min(salary) 최소연봉
from  employees
where department_id is not null
group by department_id
order by department_id desc;
---------------------------------------------------



-- [Quiz 3-4-3] 사원내역에서 부서코드와 직무코드가 null이 아닌 사원 대상으로
--              부서코드별, 직무코드별 사원수, 총연봉, 평균연봉, 최대연봉, 최소연봉을 조회하시오.
--              (조회순서는 부서코드 기준 오름차순, 직무코드 기준 오름차순으로 정렬)
-- 조회형태
--  부서ID   사원수  직무ID    총연봉         평균연봉    최대연봉   최소연봉
--   80       5    SA_MAN   61000           12200     14000    10500
select department_id 부서ID, count(*) 사원수, job_id 직무ID, sum(salary) 총연봉, avg(salary) 평균연봉, max(salary) 최대연봉, min(salary) 최소연봉
from  employees
where department_id is not null and job_id is not null
group by department_id, job_id
order by department_id , job_id;
---------------------------------------------------



-- [Quiz 3-4-4] 사원내역에서 부서코드와 직무코드가 null이 아닌 사원 대상으로
--              부서코드별, 직무코드별 사원수, 총연봉, 평균연봉, 최대연봉, 최소연봉을 조회하시오.
--              단, 평균연봉이 7000이상인 대상을 조회하시오.
--              (조회순서는 부서코드 기준 오름차순, 직무코드 기준 오름차순으로 정렬)  
--  부서ID   사원수  직무ID    총연봉         평균연봉    최대연봉   최소연봉
--   80       5    SA_MAN   61000           12200     14000    10500
select department_id 부서ID, count(*) 사원수, job_id 직무ID, sum(salary) 총연봉, avg(salary) 평균연봉, max(salary) 최대연봉, min(salary) 최소연봉
from  employees
where department_id is not null and job_id is not null
group by department_id, job_id having avg(salary)>=7000
order by department_id , job_id;

select * from Departments;
select * from employees;
select * from jobs;
---------------------------------------------------
