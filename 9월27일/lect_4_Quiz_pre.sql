-- 4강 Quiz 
-- Quiz 4-1.
-- 신규프로그램 개발에 성공한 IT관련부서의 연봉을 인상하고자 한다.
-- 다음과 같은 조건을 가진 데이터를 제시된 조회형식으로 조회하시오
-- 조건
--    인상대상 부서 : IT관련부서 : DEPARTMENT_ID => IT: 60, 210:IT SUPPORT, 230:IT HELPDESK
--    연봉인상율 : 12.3%인상하여 정수(반올림)만 표시
--    이름 출력 : 이름 성 (예 : Hunold Alexander) 
-- 조회형식
--    사원번호      이름              부서      직무        연봉       인상된연봉
--      103	    Hunold Alexander	IT	    IT_PROG	    9000    	10107
-------------------------------------------------------------------------------
select employee_id 사원번호, first_name||' '||last_name 이름, substr(job_id,1,2) 부서, job_id 직무, salary 연봉, round(salary*2.3,1) 인상된_연봉
from employees;

select*from employees;
-------------------------------------------------------------------------------

-- Quiz 4-2.
-- 사원테이블에서 다음과 같은 조건을 가진 데이터를 제시된 조회형식으로 조회하시오
-- 성(last_name)이 's'로 끝나는 사원의 이름과 업무를 제시된 조회형식에 맞게 출력하고자 한다.
-- 조건
--    이름과 성 : 첫글자만 대문자
--    직무 : 모두 대문자
--    머리글 : "Employees JOBs."로 표현
-- 조회형식
--    Employees JOBs.
--    Abel Ellenis a SA_REP
-------------------------------------------------------------------------------
select first_name||' '||initcap(last_name) 이름, upper(job_id) "Employees JOBs."
from employees
where last_name like '%s';

-------------------------------------------------------------------------------

-- Quiz 4-3.
-- 모든 사원의 연봉을 표시하는 연봉ㅇ보고서를 작성하려 한다.
-- 보고서에는 이름(이름 성), 연봉, 수당여부에 따른 연봉을 포함하여 출력하시오.
-- 조건
--   연봉 : 연봉(salary) + 연봉(salary)*성과급지급율(commission_pct)
--   수당여부 : 성과급지급율(commission_pct)이 있으면 "salary+Commition"
--                                      없으면 "salary Only"
-- 조회형식
--    사번    이름           연봉      수당여부
--    144	Vargas Peter	2500	salary Only
--    145	Russell John	19600	salary+Commition
-------------------------------------------------------------------------------
select employee_id 사번, first_name||' '||initcap(last_name) 이름, salary 연봉, NVL2(commission_pct, salary+commission_pct, salary) 성과급_지급율
from employees;
-------------------------------------------------------------------------------

-- Quiz 4-4.
-- 모든 사원의 이름(이름 성), 입사일, 입사요일을 출력하시오. 
-- 조건
--   주(week)의 시작인 일요일부터 출력되도록 정렬하시오,
-- 조회형식
--    이름        일사일     입사요일
--    Faviet Daniel	2002-08-16	금요일
-------------------------------------------------------------------------------
select first_name||' '||initcap(last_name) 이름, TO_CHAR(hire_date, 'YYYY-MM-DD') 일사일, TO_CHAR(hire_date, 'DAY') 입사요일
from employees;

select * from employees;
-------------------------------------------------------------------------------

-- Quiz 4-5.
-- HR부서에서는 신규프로젝트를 성공으로 이끈 해당 업무자들의 연봉을 인상하기로 결정하였다.
-- 사원은 현재 107명이며, 19개의 직부에 소속되어 근무중이다.
-- 다음 조건과 조건형식에 맞는 데이타를 조회하시오.
-- 조건
--    급여인상 대상자는 회사의 직무(job_id)중 다음 5개 직무에 속하는 사원에 해당된다.
--    나머지 직무에 대해서는 연봉이 동결된다.
--    5개 직무 대상 연봉 인상안은 다음과 같다.
--    HR_ERP(10%), MK_ERP(12%), PR_ERP(15%), SA_ERP(18%), IT_PROG(20%)
--    case, decode를  각각 사용하여 쿼리를 작성하시오.
-- 조회형식
--   사번         이름              직무      연봉      인상된연봉
--  100	    King Steven	        AD_PRES	    24000	    24000
--  103	    Hunold Alexander	IT_PROG	    9000	    10800
-------------------------------------------------------------------------------
select employee_id 사번, first_name||' '||initcap(last_name) 이름, job_id 직무, salary 연봉,
case
    when job_id='HR_ERP' then to_char(salary*1.1)
    when job_id='MK_ERP' then to_char(salary*1.2)
    when job_id='PR_ERP' then to_char(salary*1.5)
    when job_id='SA_ERP' then to_char(salary*1.8)
    when job_id='IT_PROG' then to_char(salary*2.0)
    else '변동없음'
end 연봉_변경여부
from employees;
-------------------------------------------------------------------------------

-- Quiz 4-6.
-- HR부서에서 최상위 입사일에 해당하는 2001년부터 2003년까지 입사자들의 급여를
-- 각각 5%, 3%, 1% 인상하여 지분에 따른 배당금으로 지급하고자 한다.
-- 전체사원중 해당 년도에 해당하는 사원들의 연봉을 검색하여 적용하고 
-- 다음 조건과 조건형식에 맞는 데이타를 조회하시오.
-- 조건
--    배당금 대상자 : 2001년부터 2003년까지 입사자
--    배당금 : 연봉(salary)에서 2001년도 => 5%, 2002년도 => 3%, 2003년도 =>1% 지급율 지급
--    정렬 : 입사일자에 따른 오름차순
--    case 사용하여 쿼리를 작성하시오.
-- 조회형식
--   사번         이름             입사일자       연봉     배당금
--   102	De Haan Lex	01/01/13	  17000	17850
-------------------------------------------------------------------------------
select employee_id 사번, first_name||' '||initcap(last_name) 이름, TO_CHAR(hire_date, 'YYYY-MM-DD') 입사일자, salary 연봉,
case
    when hire_date like '01%' then to_char(salary*0.5)
    when hire_date like '02%' then to_char(salary*0.3)
    when hire_date like '03%' then to_char(salary*0.1)
    else '변동없음'
end 배당금
from employees
order by hire_date;

select * from employees;
-------------------------------------------------------------------------------