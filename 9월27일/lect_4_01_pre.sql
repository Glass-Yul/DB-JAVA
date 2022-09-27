-- 단일행 함수 
-- 4-1 : 문자타입 함수
-- 예제4-1 : employees 에서 이름은 소문자, 성은 대문자, 
--           이메일의 첫글자는 대문자 나머지는 소문자로 조회하시오. 
select LOWER(first_name) 이름, UPPER(last_name) 성, INITCAP(email)||'@naver.com' 이메일 from employees;

---------------------------------------------------

-- 4.2 : 문자열 추출 : substr
-- 예제 4-2 : employees table에서 job_id의 처음 두글자(부서)만 조회하시오.
select distinct SUBSTR(job_id, 1, 2) 부서 from employees;
select distinct SUBSTR('안녕하세요', 1, 2) 부서 from dual;

---------------------------------------------------

-- 4-3. 문자열 변환 : 특정 문자를 찾아 바꾸기 : replace
-- 예제 4-3 : employees table에서 job_id문자열값중
--           'ACCOUNT'를 'ACCNT'로 변경하시오.
select distinct replace(job_id, 'ACCOUNT', 'ACCNT') 부서 from employees;

---------------------------------------------------
-- 4-4. 문자열변환 : 특정문자 자릿수 채우기 : lpad, rpad
-- 예제 4-4 : employees table에서 first_name을 12자리 문자열 자리로 만들어줌
--           first_name의 값이 12자리보다 작으면 왼쪽부터 '*'를 채움
select lpad(first_name,12,'*') 이름 from employees;

---------------------------------------------------

-- 4-5. 문자열변환 : 특정 문자 삭제하기 : ltrim, rtrim
-- 예제 4-5 : employees table에서 job_id의 데이터 값에 대해 
--           왼쪽에서 부터 'F'를 만나면 삭제,
--           오른쪽에서부터 'T'를 만나면 삭제
select ltrim(job_id,'F') 왼쪽, rtrim(job_id,'T') 오른쪽 from employees;

---------------------------------------------------

-- 예제 4-5-1 : dual 확인
select * from dual;
-- 예제 4-5-2 dual table이용하여 문자열 '   - space -  '에 있는 공백 제거 하시오.
--            문자열 앞에는 'start' 문자열 마지막에는 'end'를 붙여 주세요.
select 'start'||TRIM('   - space -  ')||'end' 제거된_공백 from dual;

---------------------------------------------------

-- 4-6 :문자열 위치 찾기 :  특정 글자의 위치를 찾기 : INSTR
-- 예제 4-6-1 :  고용일자중 두번째 '/'가 있는 위치를 조회하시오.
select INSTR(hire_date, '/', 1) 위치 from employees;

-- 4.2.2 : 숫자 함수
-- 4.2.1 : 반올림함수 : round
-- 예제 4-6-2 : salary를 월급여가 가정하면
--             salary에서 30일로 나눈 후 (일급)
--             소수점 첫째자리, 소수점둘때자리, 정수첫째자리에서
--             반올림한 값을 조회하시오.
select round(salary/30,0) 첫째,round(salary/30,1) 둘째,round(salary/30,0) 정수_첫째 from employees;

---------------------------------------------------

-- 4.2.1 : 절삭함수 : trunc
-- 예제 4-7: salary를 월급여가 가정하면
--             salary에서 30일로 나눈 후 (일급)
--             소수점 첫째자리, 소수점둘때자리, 정수첫째자리에서
--             절삭한 값을 조회하시오.
select trunc(salary/30,1) 첫째,trunc(salary/30,2) 둘째,trunc(salary/30,1) 정수_첫째 from employees;

---------------------------------------------------

-- 4.2.3 : 숫자 올림과 내림 : CEIL , FLOOR
-- 예제 4-7-2 : salary를 월급여가 가정하면
--             salary에서 30일로 나눈 후 (일급)
--             정수로 올림한값과 내림한 값을 구하시오.
select CEIL(salary/30) 올림,FLOOR(salary/30) 내림 from employees;

-- 4.2.3 : 숫자 계산하기 : MOD , MOD , POWER , SQRT  
-- 예제 4-7-3 : DUAL을 이용하여 100을 3으로 나눈 나머지,
--             -100의 부호값, 2의 10승값, 144의 제곱근값을 구하시오.
select MOD(100,3) 나머지, sign(100) 부호, POWER(10,2) 거듭제곱, SQRT(144) 제곱근 from dual;

-- 4.3 : 날짜함수
-- 4.3.1 : 오늘날짜 : SYSDATE
-- 예제 : 4-8 :오늘 날짜와 시간, 오늘 날짜에서 1을 더한 값, 1을 뺀 값, 
--              오늘 날짜에서 2022년 09월 01일을 뺀 값, 
--              오늘 날짜에서 13시간을 더한 값을 출력
select to_char(sysdate,'YY/MM/DD/HH24:MI') 오늘날짜와시간, sysdate+1 더하기1, sysdate-1 빼기1,
to_date('20171202')-to_date('20171201') 날짜빼기, sysdate+13/24 시간더하기 from dual;
---------------------------------------------------
-- 4.3.2 : 날짜 계산 함수: ADD_MONTHS, NEXT_DAY , LAST_DAY
-- 4.3.2.1 : 날짜에 월을 빼거나 더하는 함수 : ADD_MONTHS
-- 예제 4-9 : EMPLOYEES 에서 EMPLOEE_ID가 100과 106 사이인 직원의
--           입사일자(HIRE_DATE)에 3개월을 더한 값, 3개월을 뺀값을 조회하세요.
select hire_date 원래날짜, ADD_MONTHS(hire_date, 3) 더한값 ,ADD_MONTHS(hire_date, -3) 뺀값
from EMPLOYEES
where employee_id BETWEEN 100 and 106;

---------------------------------------------------
-- 4.3.2.2 : 돌아오는 요일의 날짜 계산하기 : NEXT_DAY
-- 예제 4-10 : EMPLOYEES 에서 EMPLOEE_ID가 100과 106 사이인 직원의
--           입사일자(HIRE_DATE)에서 가장 가까운 금요일의 날짜가 언제 조회하시오.
select hire_date 원래날짜, NEXT_DAY(hire_date, 6)가까운_금요일
from EMPLOYEES
where employee_id BETWEEN 100 and 106;

---------------------------------------------------

-- 4.3.2.3 : 돌아오는 월의 마지막 날짜 계산하기 : LAST_DAY 
-- 예제 4-11 : EMPLOYEES 에서 EMPLOEE_ID가 100과 106 사이인 직원의
--           입사일자(HIRE_DATE) 기준으로 해당월의 마지막 날짜를 조회하시오.
select hire_date 원래날짜, LAST_DAY(hire_date) 해당월_마지막_날짜
from EMPLOYEES
where employee_id BETWEEN 100 and 106;

select * from EMPLOYEES;
---------------------------------------------------

-- 4.3.3 : 날짜 계산 함수: MONTHS_BETWEEN , ROUND , TRUNC
-- 4.3.3.1 : 두 날짜 사이의 개월 수 계산하기 : MONTHS_BETWEEN 
-- 예제 4-11-2 : EMPLOYEES 에서 DEPARTMWNT_ID가 100인 직원의
--           오늘날짜, 입사일자(HIRE_DATE), 오늘날짜와 HIRE_DATE사이의
--           개월수를 조회하세요.
select sysdate , hire_date , MONTHS_BETWEEN(sysdate, hire_date) 사이의개월수
from EMPLOYEES
where employee_id = 100;

select * from EMPLOYEES;
---------------------------------------------------
-- 4.3.3.2 : 날짜 반올림/절삭하기 : ROUND, TRUNC 
-- 예제 4-12 : EMPLOYEES 에서 DEPARTMWNT_ID가 100인 직원의
--           입사일자(HIRE_DATE)에 대해 월기준 반올림, 연기준 반올림,
--           월기준절삭, 년기준절삭을 적용하여 조회하세요.
select hire_date , ROUND(hire_date,'MONTH') 월기준,ROUND(hire_date,'YEAR') 연기준,TRUNC(hire_date,'YEAR') 월기준절삭,TRUNC(hire_date,'MONTH') 년기준절삭
from EMPLOYEES
where employee_id = 100;

---------------------------------------------------
-- 4.4 : 데이터형 변환 함수
-- 4.4.1 : 자동데이터형 변환
-- 예제 : 문자 => 숫자 형변환
--       DUAL table을 이용하여 숫자 1과 문자'2를 더하시오. 
select 1+'2'
from dual;

---------------------------------------------------
--4.4.2 : 수동데이터 형변환
--4.4.2.1 : 문자열로 변환하는 함수 : TO_CHAR
--예제 : 날짜 => 문자형으로 변환 (날짜 데이터 서식 )
--       DUAL table을 이용하여 날짜형 Format을 적용하여 조회하시오.
-- 조회형태
-- 년도  년도2    월  월2    오늘날짜1 '20220927'날짜
-- 22	2022	09	9월 	20220926	20220927
select to_char(sysdate,'YY')년도, to_char(sysdate,'YYYY')년도2, to_char(sysdate,'MM')월, to_char(sysdate,'MON')월2, to_char(sysdate,'YYYYMMDD')오늘날짜1, to_char(to_date('20220927'),'YYYYMMDD')날짜
from dual;

---------------------------------------------------

--예제 : 날짜 => 문자형으로 변환 (시간 데이터 서식 )
-- 조회형태
-- 시간형식1               날짜와 시간조합
-- 01:30:26 오후	          2022/09/26 01:30:26 오후
select to_char(sysdate, 'HH:MI:SS PM') 시간형식, to_char(sysdate, 'YYYY/MM/DD HH:MI:SS PM') 날짜와_시간조합
FROM   dual;
---------------------------------------------------

--예제 : 날짜 => 문자형으로 변환 (기타 데이터 서식 )
-- 시간형식1               날짜와 시간조합
-- 01-31-30 오후	          날짜: 2022/09/26 시각: 01:31:30 오후
SELECT TO_CHAR(SYSDATE, 'HH-MI-SS PM') 시간형식,
       TO_CHAR(SYSDATE, ' "날짜:" YYYY/MM/DD "시각:" HH:MI:SS PM' ) 날짜와시각표현
FROM   dual;
---------------------------------------------------
-- 예제 : 숫자 => 문자형으로 변환 (숫자 데이터 서식 )
--       employees테이블에서 사원번호와 다음 출력형식으로 조회하시오.
-- 조회형태
--사번     서식1       서식2       서식3    서식4       서식5      서식6
--108	  12008	  00012008	   $12008  ￦12008	 12008.00	 12,008
select employee_id, TO_CHAR(employee_id,'99999')서식1,TO_CHAR(employee_id,'09999999')서식2, TO_CHAR(employee_id,'$99999')서식3, TO_CHAR(employee_id,'L99999')서식4, TO_CHAR(employee_id,'99999.99')서식5, TO_CHAR(employee_id,'099,999')서식6
from employees;

---------------------------------------------------

--4.4.2.2 : 숫자 데이터로 변환하는 함수 : TO_NUMBER
-- 예 : dual table을 이용하여 '123'을 숫자로 변환하여 123을 더한 결과를 조회하시오.         
select to_number('123')
from dual;
---------------------------------------------------

--4.4.2.3 : 날짜 데이터로 변환하는 함수 : TO_DATE
-- 예 : dual table을 이용하여 '20220927'을 날짜로 변환하여 조회하시오.  
-- 조회형태
--  날짜
--  22/09/27
select to_date('20220927')
from dual;
---------------------------------------------------

-- 4.5 : 일반 함수
-- 4.5.1 : NULL값 처리하기 : NVL
-- 예제 : NULL값 특성
--       employees테이블에서 사원번,  salary, commission_pct를 조회하시오.
--       commission_pct로 정렬
SELECT employee_id, salary,  commission_pct
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

-- 예제 : NULL값 특성 => null 값을 포함하는 산술 연산의 결과는 null임
--       employees테이블에서 사원번,  salary, commission_pct,
--       salary * commission_pct를 조회하시오.
--       commission_pct로 정렬
SELECT employee_id, salary,  commission_pct, salary * commission_pct
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

-- 예제 4-13 : employees테이블에서 salary에 commision_pct를
--             곱하되 commition_pct가 null인 경우는 1로 치환하여
--             commition_pct를 곱한 값을 출력하시오.
SELECT salary * NVL(commission_pct, 1)
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

-- 예제 4-13-2 : employees테이블에서 manager_id가 null이면 '임원'이라 출력하고
--              manager_id 가 null이 아니면 '일반사원및 관리직'이라고 출력하시오.
select NVL2(manager_id, '일반사원 및 관리직', '임원')
from employees;

---------------------------------------------------

-- 4.5.2 : 조건 논리 처리하기 : DECODE
--예제 4-14 : employees 테이블에서 first_name, first_name, department_id, salary를 출력하되
--           department_id가 60인 경우에는 급여를 10%인상한 값을 출력하고
--           나머지의 경우에는 원래의 값을 출력하시오.
--           그리고 department_id가 60인 경우에는 '10%인상'을 출력하고
--           나머지 경우에는 '미인상'을 출력하시오.
select first_name||last_name 이름, department_id, salary 원래급여, 
decode(department_id, 60, salary*1.1, salary) 조정급여, decode(department_id, 60, '10% 인상', '미인상') 인상급여
from employees;


select * from employees;
select * from DEPARTMENTS;
---------------------------------------------------
--4.5.3 복잡한 조건 논리 처리하기 : CASE 표현식  
--예제 4-15 : employees 테이블에서 job_id가 ;IT_PROG'이라면
--           employee_id, first_name, last_name, salary를 출력하되
--           salary가 9000이상이면 '상위급여'
--           salary가 6000이상 9000미만이면 '중위급여'
--           그 이하이면 '하위급여'라고 출력되도록 조회하시오.

---------------------------------------------------
--4.5.4 데이터 값에 순위 매기기 : RANK, DENSE_RANK, ROW_NUMBER  
-- 예제 4-16 : employees테이블의 salary값이 높은 순서대로 
--            순위를 매겨 출력하시오.

---------------------------------------------------
-- 예제 4-17 : employees테이블의 사원이 속한 department_id안에서
--            salary값이 높은 순서대로 순위를 매겨 출력하시오.

---------------------------------------------------

-- 4.6 : 고급그룹함수
-- 4.6.1 그룹 항목 소집계 출력하기 : group by rollup
-- 예제 : employees 테이블에서 department_id가 50이상인 사원내역에서
--       부서별, 직무별 사원수와, 연봉의합계를 조회하고 
--       부서별 소집계를 하시오.

---------------------------------------------------

-- 4.6.1 그룹 항목 소집계 출력하기 : group by cube
-- 예제 : employees 테이블에서 department_id가 50이상인 사원내역에서
--       부서별, 직무별 사원수와, 연봉의합계를 조회하고 
--       부서별 소집계를 하시오.

---------------------------------------------------

-- 4.6.1 그룹 항목 소집계 출력하기 : group by grouping sets
-- 예제 : employees 테이블에서 department_id가 100이상인 사원내역에서
--       부서별 인원수와
--       관리자별 인원수를 구하고 소집계하시오
-- UNION 사용

---------------------------------------------------

-- group by grouping sets 사용

---------------------------------------------------