-- ������ �Լ� 
-- 4-1 : ����Ÿ�� �Լ�
-- ����4-1 : employees ���� �̸��� �ҹ���, ���� �빮��, 
--           �̸����� ù���ڴ� �빮�� �������� �ҹ��ڷ� ��ȸ�Ͻÿ�. 
select first_name||upper(last_name) �̸�, initcap(email)||'@seoil.kr' �̸���
from employees;
---------------------------------------------------

-- 4.2 : ���ڿ� ���� : substr
-- ���� 4-2 : employees table���� job_id�� ó�� �α���(�μ�)�� ��ȸ�Ͻÿ�.
select substr(job_id,1,2) �μ�ID
from employees;
---------------------------------------------------

-- 4-3. ���ڿ� ��ȯ : Ư�� ���ڸ� ã�� �ٲٱ� : replace
-- ���� 4-3 : employees table���� job_id���ڿ�����
--           'ACCOUNT'�� 'ACCNT'�� �����Ͻÿ�.
select job_id ����_�μ�ID, replace(job_id, 'ACCOUNT', 'ACCNT') �μ�ID
from employees;
---------------------------------------------------
-- 4-4. ���ڿ���ȯ : Ư������ �ڸ��� ä��� : lpad, rpad
-- ���� 4-4 : employees table���� first_name�� 12�ڸ� ���ڿ� �ڸ��� �������
--           first_name�� ���� 12�ڸ����� ������ ���ʺ��� '*'�� ä��
select lpad(first_name, 12,'*')
from employees;
---------------------------------------------------

-- 4-5. ���ڿ���ȯ : Ư�� ���� �����ϱ� : ltrim, rtrim
-- ���� 4-5 : employees table���� job_id�� ������ ���� ���� 
--           ���ʿ��� ���� 'F'�� ������ ����,
--           �����ʿ������� 'T'�� ������ ����
select ltrim(job_id,'F') ����_F����, rtrim(job_id, 'T') ������_T����
from employees;
---------------------------------------------------

-- ���� 4-5-1 : dual Ȯ��
-- ���� 4-5-2 dual table�̿��Ͽ� ���ڿ� '   - space -  '�� �ִ� ���� ���� �Ͻÿ�.
--            ���ڿ� �տ��� 'start' ���ڿ� ���������� 'end'�� �ٿ� �ּ���.
select 'start'||trim('   - space -  ')||'end' ��������
from dual;
---------------------------------------------------

-- 4-6 :���ڿ� ��ġ ã�� :  Ư�� ������ ��ġ�� ã�� : INSTR
-- ���� 4-6-1 :  ��������� �ι�° '/'�� �ִ� ��ġ�� ��ȸ�Ͻÿ�.
select instr(hire_date,'/') "ù��°_/��ġ",
instr(hire_date,'/',4) "�ι�°_/��ġ" 
from employees;
---------------------------------------------------
-- 4.2.2 : ���� �Լ�
-- 4.2.1 : �ݿø��Լ� : round
-- ���� 4-6-2 : salary�� ���޿��� �����ϸ�
--             salary���� 30�Ϸ� ���� �� (�ϱ�)
--             �Ҽ��� ù°�ڸ�, �Ҽ����Ѷ��ڸ�, ����ù°�ڸ�����
--             �ݿø��� ���� ��ȸ�Ͻÿ�.
select salary/30 �⺻, round((salary/30),0) ù��°�ڸ�,
round((salary/30),1) �ι�°�ڸ�, round((salary/30),-1) ����°�ڸ�
from employees;
---------------------------------------------------

-- 4.2.1 : �����Լ� : trunc
-- ���� 4-7: salary�� ���޿��� �����ϸ�
--             salary���� 30�Ϸ� ���� �� (�ϱ�)
--             �Ҽ��� ù°�ڸ�, �Ҽ����Ѷ��ڸ�, ����ù°�ڸ�����
--             ������ ���� ��ȸ�Ͻÿ�.
select salary/30 �⺻, trunc((salary/30),0) ù��°�ڸ�,
trunc((salary/30),1) �ι�°�ڸ�, trunc((salary/30),-1) ����°�ڸ�
from employees;
---------------------------------------------------

-- 4.2.3 : ���� �ø��� ���� : CEIL , FLOOR
-- ���� 4-7-2 : salary�� ���޿��� �����ϸ�
--             salary���� 30�Ϸ� ���� �� (�ϱ�)
--             ������ �ø��Ѱ��� ������ ���� ���Ͻÿ�.
select salary/30 �ϱ�, CEIL(salary/30) �ø��Ѱ�,
FLOOR(salary/30) �����Ѱ�
from employees;
---------------------------------------------------
-- 4.2.3 : ���� ����ϱ� : MOD , POWER , SQRT  
-- ���� 4-7-3 : DUAL�� �̿��Ͽ� 100�� 3���� ���� ������,
--             -100�� ��ȣ��, 2�� 10�°�, 144�� �����ٰ��� ���Ͻÿ�.
select mod(100, 3) ������, sign(-100) ��ȣȮ��, power(2,10) �ŵ�����, sqrt(144) ������
from dual;
---------------------------------------------------
-- 4.3 : ��¥�Լ�
-- 4.3.1 : ���ó�¥ : SYSDATE
-- ���� : 4-8 :���� ��¥�� �ð�, ���� ��¥���� 1�� ���� ��, 1�� �� ��, 
--              ���� ��¥���� 2022�� 09�� 01���� �� ��, 
--              ���� ��¥���� 13�ð��� ���� ���� ���
select sysdate ���ó�¥�ͽð�, sysdate+1 ���Ѱ�, sysdate-1 ����,
round((sysdate - to_date('20220901')-1),1) ���ó�¥_����,
sysdate-13/24 "13�ð�_����"
from employees;
---------------------------------------------------
-- 4.3.2 : ��¥ ��� �Լ�: ADD_MONTHS, NEXT_DAY , LAST_DAY
-- 4.3.2.1 : ��¥�� ���� ���ų� ���ϴ� �Լ� : ADD_MONTHS
-- ���� 4-9 : EMPLOYEES ���� EMPLOEE_ID�� 100�� 106 ������ ������
--           �Ի�����(HIRE_DATE)�� 3������ ���� ��, 3������ ������ ��ȸ�ϼ���.
select add_months(hire_date, 3) "3���� ���� ��", add_months(hire_date, -3) "3���� �� ��"
from employees
where employee_id between 100 and 106;
---------------------------------------------------
-- 4.3.2.2 : ���ƿ��� ������ ��¥ ����ϱ� : NEXT_DAY
-- ���� 4-10 : EMPLOYEES ���� EMPLOEE_ID�� 100�� 106 ������ ������
--           �Ի�����(HIRE_DATE)���� ���� ����� �ݿ����� ��¥�� ���� ��ȸ�Ͻÿ�.
select hire_date �Ի糯¥, next_day(hire_date, 6) "�ݿ��ϰ� �����"
from employees
where employee_id between 100 and 106;
---------------------------------------------------

-- 4.3.2.3 : ���ƿ��� ���� ������ ��¥ ����ϱ� : LAST_DAY 
-- ���� 4-11 : EMPLOYEES ���� EMPLOEE_ID�� 100�� 106 ������ ������
--           �Ի�����(HIRE_DATE) �������� �ش���� ������ ��¥�� ��ȸ�Ͻÿ�.
select hire_date �Ի糯¥, LAST_DAY(hire_date) ��������¥
from employees
where employee_id between 100 and 106;
---------------------------------------------------

-- 4.3.3 : ��¥ ��� �Լ�: MONTHS_BETWEEN , ROUND , TRUNC
-- 4.3.3.1 : �� ��¥ ������ ���� �� ����ϱ� : MONTHS_BETWEEN 
-- ���� 4-11-2 : EMPLOYEES ���� DEPARTMWNT_ID�� 100�� ������
--           ���ó�¥, �Ի�����(HIRE_DATE), ���ó�¥�� HIRE_DATE������
--           �������� ��ȸ�ϼ���.
select hire_date �Ի�����, round(months_between(sysdate, hire_date),2) ���̰�����
from employees
where department_id = 100;
---------------------------------------------------
-- 4.3.3.2 : ��¥ �ݿø�/�����ϱ� : ROUND, TRUNC 
-- ���� 4-12 : EMPLOYEES ���� DEPARTMWNT_ID�� 100�� ������
--           �Ի�����(HIRE_DATE)�� ���� ������ �ݿø�, ������ �ݿø�,
--           ����������, ����������� �����Ͽ� ��ȸ�ϼ���.
select ROUND(hire_date, 'MONTH') "������ �ݿø�", ROUND(hire_date, 'YEAR') "������ �ݿø�",
TRUNC(hire_date, 'MONTH') "������ ����", TRUNC(hire_date, 'MONTH') "������ ����"
from employees
where department_id = 100;
---------------------------------------------------
-- 4.4 : �������� ��ȯ �Լ�
-- 4.4.1 : �ڵ��������� ��ȯ
-- ���� : ���� => ���� ����ȯ
--       DUAL table�� �̿��Ͽ� ���� 1�� ����'2�� ���Ͻÿ�. 
select TO_NUMBER('2')+1 ���ϱ�
from dual;
---------------------------------------------------
--4.4.2 : ���������� ����ȯ
--4.4.2.1 : ���ڿ��� ��ȯ�ϴ� �Լ� : TO_CHAR
--���� : ��¥ => ���������� ��ȯ (��¥ ������ ���� )
--       DUAL table�� �̿��Ͽ� ��¥�� Format�� �����Ͽ� ��ȸ�Ͻÿ�.
-- ��ȸ����
-- �⵵  �⵵2    ��  ��2    ���ó�¥1 '20220927'��¥
-- 22	2022	09	9�� 	20220926	20220927
select to_char(sysdate, 'YY') �⵵, to_char(sysdate, 'YYYY') �⵵2,
to_char(sysdate, 'MM') ��, to_char(sysdate, 'MM')||'��' ��2,
to_char(sysdate,'YYYYMMDD') ���ó�¥1, to_char(to_date('20221004'),'YYYYMMDD') ��¥
from dual;
---------------------------------------------------

--���� : ��¥ => ���������� ��ȯ (�ð� ������ ���� )
-- ��ȸ����
-- �ð�����1               ��¥�� �ð�����
-- 01:30:26 ����	          2022/09/26 01:30:26 ����
select to_char(sysdate, 'HH:MI:SS PM') �ð�����, 
to_char(sysdate, 'YYYY/MM/DD HH:MI:SS PM') "��¥�� �ð�����"
from employees;
---------------------------------------------------

--���� : ��¥ => ���������� ��ȯ (��Ÿ ������ ���� )
-- �ð�����1               ��¥�� �ð�����
-- 01-31-30 ����	          ��¥: 2022/09/26 �ð�: 01:31:30 ����
select to_char(sysdate, 'HH-MI-SS PM') �ð�����, 
to_char(sysdate,'"��¥ : "YYYY/MM/DD "�ð� : "HH:MI:SS PM') "��¥�� �ð�����"
from employees;
---------------------------------------------------
-- ���� : ���� => ���������� ��ȯ (���� ������ ���� )
--       employees���̺��� �����ȣ�� ���� ����������� ��ȸ�Ͻÿ�.
-- ��ȸ����
--���     ����1       ����2       ����3    ����4       ����5      ����6
--108	  12008	  00012008	   $12008  ��12008	 12008.00	 12,008
select employee_id ���, to_char(salary,'99999') ����1,to_char(salary,'99999999') ����2,
to_char(salary,'$99999') ����3, to_char(salary,'L99999') ����4,
to_char(salary,'99999.99') ����5,to_char(salary,'99,999') ����6
from employees;
---------------------------------------------------

--4.4.2.2 : ���� �����ͷ� ��ȯ�ϴ� �Լ� : TO_NUMBER
-- �� : dual table�� �̿��Ͽ� '123'�� ���ڷ� ��ȯ�Ͽ� 123�� ���� ����� ��ȸ�Ͻÿ�.  
select to_number('123') ���ں�ȯ
from dual;
---------------------------------------------------

--4.4.2.3 : ��¥ �����ͷ� ��ȯ�ϴ� �Լ� : TO_DATE
-- �� : dual table�� �̿��Ͽ� '20220927'�� ��¥�� ��ȯ�Ͽ� ��ȸ�Ͻÿ�.  
-- ��ȸ����
--  ��¥
--  22/09/27
select to_char(to_date('20220927'),'YY/MM/DD') ��¥��ȯ
from dual;
---------------------------------------------------

-- 4.5 : �Ϲ� �Լ�
-- 4.5.1 : NULL�� ó���ϱ� : NVL
-- ���� : NULL�� Ư��
--       employees���̺��� �����,  salary, commission_pct�� ��ȸ�Ͻÿ�.
--       commission_pct�� ����
select employee_id �����ȣ, salary ����, commission_pct
from employees
order by commission_pct;
---------------------------------------------------

-- ���� : NULL�� Ư�� => null ���� �����ϴ� ��� ������ ����� null��
--       employees���̺��� �����,  salary, commission_pct,
--       salary * commission_pct�� ��ȸ�Ͻÿ�.
--       commission_pct�� ����
select salary ����, commission_pct, salary * commission_pct
from employees
order by commission_pct;
---------------------------------------------------

-- ���� 4-13 : employees���̺��� salary�� commision_pct��
--             ���ϵ� commition_pct�� null�� ���� 1�� ġȯ�Ͽ�
--             commition_pct�� ���� ���� ����Ͻÿ�.
select salary ����, commission_pct, salary * NVL(commission_pct,1)
from employees
order by commission_pct;
---------------------------------------------------

-- ���� 4-13-2 : employees���̺��� manager_id�� null�̸� '�ӿ�'�̶� ����ϰ�
--              manager_id �� null�� �ƴϸ� '�Ϲݻ���� ������'�̶�� ����Ͻÿ�.
select manager_id, NVL2(manager_id, '�Ϲݻ�� �� ������', '�ӿ�')
from employees;
---------------------------------------------------

-- 4.5.2 : ���� �� ó���ϱ� : DECODE
--���� 4-14 : employees ���̺��� first_name, first_name, department_id, salary�� ����ϵ�
--           department_id�� 60�� ��쿡�� �޿��� 10%�λ��� ���� ����ϰ�
--           �������� ��쿡�� ������ ���� ����Ͻÿ�.
--           �׸��� department_id�� 60�� ��쿡�� '10%�λ�'�� ����ϰ�
--           ������ ��쿡�� '���λ�'�� ����Ͻÿ�.
select first_name,department_id, salary, decode(department_id, 60, '10%�λ�', '���λ�') ����1,
decode(department_id, 60,salary*1.1, salary)����2
from employees;
---------------------------------------------------
--4.5.3 ������ ���� �� ó���ϱ� : CASE ǥ����  
--���� 4-15 : employees ���̺��� job_id�� ;IT_PROG'�̶��
--           employee_id, first_name, last_name, salary�� ����ϵ�
--           salary�� 9000�̻��̸� '�����޿�'
--           salary�� 6000�̻� 9000�̸��̸� '�����޿�'
--           �� �����̸� '�����޿�'��� ��µǵ��� ��ȸ�Ͻÿ�.
select employee_id, first_name||last_name,job_id, salary,
    case
        when salary >= 9000 then '�����޿�'
        when (salary>= 6000 and salary < 9000)then '�����޿�'
        else '�����޿�'
    end as ���ǹ���
from employees
where job_id ='IT_PROG';
---------------------------------------------------
--4.5.4 ������ ���� ���� �ű�� : RANK, DENSE_RANK, ROW_NUMBER  
-- ���� 4-16 : employees���̺��� salary���� ���� ������� 
--            ������ �Ű� ����Ͻÿ�.
select salary, RANK()over(order by salary desc) ����_����,
DENSE_RANK()over(order by salary desc) ����_����,
ROW_NUMBER()over(order by salary desc) ����
from employees;
---------------------------------------------------
-- ���� 4-17 : employees���̺��� ����� ���� department_id�ȿ���
--            salary���� ���� ������� ������ �Ű� ����Ͻÿ�.
select department_id, salary, dense_rank()over(order by salary desc) ��������
from employees;
---------------------------------------------------

-- 4.6 : ��ޱ׷��Լ�
-- 4.6.1 �׷� �׸� ������ ����ϱ� : group by rollup
-- ���� : employees ���̺��� department_id�� 50�̻��� �����������
--       �μ���, ������ �������, �������հ踦 ��ȸ�ϰ� 
--       �μ��� �����踦 �Ͻÿ�.
select department_id �μ�, job_id ����, count(*) �����, sum(salary) �����հ�
from employees
where department_id >= 50
group by rollup(department_id, job_id);
---------------------------------------------------

-- 4.6.1 �׷� �׸� ������ ����ϱ� : group by cube
-- ���� : employees ���̺��� department_id�� 50�̻��� �����������
--       �μ���, ������ �������, �������հ踦 ��ȸ�ϰ� 
--       �μ��� �����踦 �Ͻÿ�.
select department_id �μ�, job_id ����, count(*) �����, sum(salary) �����հ�
from employees
where department_id >= 50
group by cube(department_id, job_id);
---------------------------------------------------

-- 4.6.1 �׷� �׸� ������ ����ϱ� : group by grouping sets
-- ���� : employees ���̺��� department_id�� 100�̻��� �����������
--       �μ��� �ο�����
--       �����ں� �ο����� ���ϰ� �������Ͻÿ�
-- UNION ���
select department_id �μ���, count(*) �ο���, 1 �׷�
from employees
where department_id >= 100
group by department_id
union
select manager_id �����ں�, count(*) �ο���, 2 �׷�
from employees
where department_id >= 100
group by manager_id;
---------------------------------------------------

-- group by grouping sets ���
select department_id �μ���, manager_id �����ں�, count(*) �ο���
from employees
where department_id >= 100
GROUP BY GROUPING SETS(department_id, manager_id);
---------------------------------------------------