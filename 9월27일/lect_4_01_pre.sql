-- ������ �Լ� 
-- 4-1 : ����Ÿ�� �Լ�
-- ����4-1 : employees ���� �̸��� �ҹ���, ���� �빮��, 
--           �̸����� ù���ڴ� �빮�� �������� �ҹ��ڷ� ��ȸ�Ͻÿ�. 
select LOWER(first_name) �̸�, UPPER(last_name) ��, INITCAP(email)||'@naver.com' �̸��� from employees;

---------------------------------------------------

-- 4.2 : ���ڿ� ���� : substr
-- ���� 4-2 : employees table���� job_id�� ó�� �α���(�μ�)�� ��ȸ�Ͻÿ�.
select distinct SUBSTR(job_id, 1, 2) �μ� from employees;
select distinct SUBSTR('�ȳ��ϼ���', 1, 2) �μ� from dual;

---------------------------------------------------

-- 4-3. ���ڿ� ��ȯ : Ư�� ���ڸ� ã�� �ٲٱ� : replace
-- ���� 4-3 : employees table���� job_id���ڿ�����
--           'ACCOUNT'�� 'ACCNT'�� �����Ͻÿ�.
select distinct replace(job_id, 'ACCOUNT', 'ACCNT') �μ� from employees;

---------------------------------------------------
-- 4-4. ���ڿ���ȯ : Ư������ �ڸ��� ä��� : lpad, rpad
-- ���� 4-4 : employees table���� first_name�� 12�ڸ� ���ڿ� �ڸ��� �������
--           first_name�� ���� 12�ڸ����� ������ ���ʺ��� '*'�� ä��
select lpad(first_name,12,'*') �̸� from employees;

---------------------------------------------------

-- 4-5. ���ڿ���ȯ : Ư�� ���� �����ϱ� : ltrim, rtrim
-- ���� 4-5 : employees table���� job_id�� ������ ���� ���� 
--           ���ʿ��� ���� 'F'�� ������ ����,
--           �����ʿ������� 'T'�� ������ ����
select ltrim(job_id,'F') ����, rtrim(job_id,'T') ������ from employees;

---------------------------------------------------

-- ���� 4-5-1 : dual Ȯ��
select * from dual;
-- ���� 4-5-2 dual table�̿��Ͽ� ���ڿ� '   - space -  '�� �ִ� ���� ���� �Ͻÿ�.
--            ���ڿ� �տ��� 'start' ���ڿ� ���������� 'end'�� �ٿ� �ּ���.
select 'start'||TRIM('   - space -  ')||'end' ���ŵ�_���� from dual;

---------------------------------------------------

-- 4-6 :���ڿ� ��ġ ã�� :  Ư�� ������ ��ġ�� ã�� : INSTR
-- ���� 4-6-1 :  ��������� �ι�° '/'�� �ִ� ��ġ�� ��ȸ�Ͻÿ�.
select INSTR(hire_date, '/', 1) ��ġ from employees;

-- 4.2.2 : ���� �Լ�
-- 4.2.1 : �ݿø��Լ� : round
-- ���� 4-6-2 : salary�� ���޿��� �����ϸ�
--             salary���� 30�Ϸ� ���� �� (�ϱ�)
--             �Ҽ��� ù°�ڸ�, �Ҽ����Ѷ��ڸ�, ����ù°�ڸ�����
--             �ݿø��� ���� ��ȸ�Ͻÿ�.
select round(salary/30,0) ù°,round(salary/30,1) ��°,round(salary/30,0) ����_ù° from employees;

---------------------------------------------------

-- 4.2.1 : �����Լ� : trunc
-- ���� 4-7: salary�� ���޿��� �����ϸ�
--             salary���� 30�Ϸ� ���� �� (�ϱ�)
--             �Ҽ��� ù°�ڸ�, �Ҽ����Ѷ��ڸ�, ����ù°�ڸ�����
--             ������ ���� ��ȸ�Ͻÿ�.
select trunc(salary/30,1) ù°,trunc(salary/30,2) ��°,trunc(salary/30,1) ����_ù° from employees;

---------------------------------------------------

-- 4.2.3 : ���� �ø��� ���� : CEIL , FLOOR
-- ���� 4-7-2 : salary�� ���޿��� �����ϸ�
--             salary���� 30�Ϸ� ���� �� (�ϱ�)
--             ������ �ø��Ѱ��� ������ ���� ���Ͻÿ�.
select CEIL(salary/30) �ø�,FLOOR(salary/30) ���� from employees;

-- 4.2.3 : ���� ����ϱ� : MOD , MOD , POWER , SQRT  
-- ���� 4-7-3 : DUAL�� �̿��Ͽ� 100�� 3���� ���� ������,
--             -100�� ��ȣ��, 2�� 10�°�, 144�� �����ٰ��� ���Ͻÿ�.
select MOD(100,3) ������, sign(100) ��ȣ, POWER(10,2) �ŵ�����, SQRT(144) ������ from dual;

-- 4.3 : ��¥�Լ�
-- 4.3.1 : ���ó�¥ : SYSDATE
-- ���� : 4-8 :���� ��¥�� �ð�, ���� ��¥���� 1�� ���� ��, 1�� �� ��, 
--              ���� ��¥���� 2022�� 09�� 01���� �� ��, 
--              ���� ��¥���� 13�ð��� ���� ���� ���
select to_char(sysdate,'YY/MM/DD/HH24:MI') ���ó�¥�ͽð�, sysdate+1 ���ϱ�1, sysdate-1 ����1,
to_date('20171202')-to_date('20171201') ��¥����, sysdate+13/24 �ð����ϱ� from dual;
---------------------------------------------------
-- 4.3.2 : ��¥ ��� �Լ�: ADD_MONTHS, NEXT_DAY , LAST_DAY
-- 4.3.2.1 : ��¥�� ���� ���ų� ���ϴ� �Լ� : ADD_MONTHS
-- ���� 4-9 : EMPLOYEES ���� EMPLOEE_ID�� 100�� 106 ������ ������
--           �Ի�����(HIRE_DATE)�� 3������ ���� ��, 3������ ������ ��ȸ�ϼ���.
select hire_date ������¥, ADD_MONTHS(hire_date, 3) ���Ѱ� ,ADD_MONTHS(hire_date, -3) ����
from EMPLOYEES
where employee_id BETWEEN 100 and 106;

---------------------------------------------------
-- 4.3.2.2 : ���ƿ��� ������ ��¥ ����ϱ� : NEXT_DAY
-- ���� 4-10 : EMPLOYEES ���� EMPLOEE_ID�� 100�� 106 ������ ������
--           �Ի�����(HIRE_DATE)���� ���� ����� �ݿ����� ��¥�� ���� ��ȸ�Ͻÿ�.
select hire_date ������¥, NEXT_DAY(hire_date, 6)�����_�ݿ���
from EMPLOYEES
where employee_id BETWEEN 100 and 106;

---------------------------------------------------

-- 4.3.2.3 : ���ƿ��� ���� ������ ��¥ ����ϱ� : LAST_DAY 
-- ���� 4-11 : EMPLOYEES ���� EMPLOEE_ID�� 100�� 106 ������ ������
--           �Ի�����(HIRE_DATE) �������� �ش���� ������ ��¥�� ��ȸ�Ͻÿ�.
select hire_date ������¥, LAST_DAY(hire_date) �ش��_������_��¥
from EMPLOYEES
where employee_id BETWEEN 100 and 106;

select * from EMPLOYEES;
---------------------------------------------------

-- 4.3.3 : ��¥ ��� �Լ�: MONTHS_BETWEEN , ROUND , TRUNC
-- 4.3.3.1 : �� ��¥ ������ ���� �� ����ϱ� : MONTHS_BETWEEN 
-- ���� 4-11-2 : EMPLOYEES ���� DEPARTMWNT_ID�� 100�� ������
--           ���ó�¥, �Ի�����(HIRE_DATE), ���ó�¥�� HIRE_DATE������
--           �������� ��ȸ�ϼ���.
select sysdate , hire_date , MONTHS_BETWEEN(sysdate, hire_date) �����ǰ�����
from EMPLOYEES
where employee_id = 100;

select * from EMPLOYEES;
---------------------------------------------------
-- 4.3.3.2 : ��¥ �ݿø�/�����ϱ� : ROUND, TRUNC 
-- ���� 4-12 : EMPLOYEES ���� DEPARTMWNT_ID�� 100�� ������
--           �Ի�����(HIRE_DATE)�� ���� ������ �ݿø�, ������ �ݿø�,
--           ����������, ����������� �����Ͽ� ��ȸ�ϼ���.
select hire_date , ROUND(hire_date,'MONTH') ������,ROUND(hire_date,'YEAR') ������,TRUNC(hire_date,'YEAR') ����������,TRUNC(hire_date,'MONTH') ���������
from EMPLOYEES
where employee_id = 100;

---------------------------------------------------
-- 4.4 : �������� ��ȯ �Լ�
-- 4.4.1 : �ڵ��������� ��ȯ
-- ���� : ���� => ���� ����ȯ
--       DUAL table�� �̿��Ͽ� ���� 1�� ����'2�� ���Ͻÿ�. 
select 1+'2'
from dual;

---------------------------------------------------
--4.4.2 : ���������� ����ȯ
--4.4.2.1 : ���ڿ��� ��ȯ�ϴ� �Լ� : TO_CHAR
--���� : ��¥ => ���������� ��ȯ (��¥ ������ ���� )
--       DUAL table�� �̿��Ͽ� ��¥�� Format�� �����Ͽ� ��ȸ�Ͻÿ�.
-- ��ȸ����
-- �⵵  �⵵2    ��  ��2    ���ó�¥1 '20220927'��¥
-- 22	2022	09	9�� 	20220926	20220927
select to_char(sysdate,'YY')�⵵, to_char(sysdate,'YYYY')�⵵2, to_char(sysdate,'MM')��, to_char(sysdate,'MON')��2, to_char(sysdate,'YYYYMMDD')���ó�¥1, to_char(to_date('20220927'),'YYYYMMDD')��¥
from dual;

---------------------------------------------------

--���� : ��¥ => ���������� ��ȯ (�ð� ������ ���� )
-- ��ȸ����
-- �ð�����1               ��¥�� �ð�����
-- 01:30:26 ����	          2022/09/26 01:30:26 ����
select to_char(sysdate, 'HH:MI:SS PM') �ð�����, to_char(sysdate, 'YYYY/MM/DD HH:MI:SS PM') ��¥��_�ð�����
FROM   dual;
---------------------------------------------------

--���� : ��¥ => ���������� ��ȯ (��Ÿ ������ ���� )
-- �ð�����1               ��¥�� �ð�����
-- 01-31-30 ����	          ��¥: 2022/09/26 �ð�: 01:31:30 ����
SELECT TO_CHAR(SYSDATE, 'HH-MI-SS PM') �ð�����,
       TO_CHAR(SYSDATE, ' "��¥:" YYYY/MM/DD "�ð�:" HH:MI:SS PM' ) ��¥�ͽð�ǥ��
FROM   dual;
---------------------------------------------------
-- ���� : ���� => ���������� ��ȯ (���� ������ ���� )
--       employees���̺��� �����ȣ�� ���� ����������� ��ȸ�Ͻÿ�.
-- ��ȸ����
--���     ����1       ����2       ����3    ����4       ����5      ����6
--108	  12008	  00012008	   $12008  ��12008	 12008.00	 12,008
select employee_id, TO_CHAR(employee_id,'99999')����1,TO_CHAR(employee_id,'09999999')����2, TO_CHAR(employee_id,'$99999')����3, TO_CHAR(employee_id,'L99999')����4, TO_CHAR(employee_id,'99999.99')����5, TO_CHAR(employee_id,'099,999')����6
from employees;

---------------------------------------------------

--4.4.2.2 : ���� �����ͷ� ��ȯ�ϴ� �Լ� : TO_NUMBER
-- �� : dual table�� �̿��Ͽ� '123'�� ���ڷ� ��ȯ�Ͽ� 123�� ���� ����� ��ȸ�Ͻÿ�.         
select to_number('123')
from dual;
---------------------------------------------------

--4.4.2.3 : ��¥ �����ͷ� ��ȯ�ϴ� �Լ� : TO_DATE
-- �� : dual table�� �̿��Ͽ� '20220927'�� ��¥�� ��ȯ�Ͽ� ��ȸ�Ͻÿ�.  
-- ��ȸ����
--  ��¥
--  22/09/27
select to_date('20220927')
from dual;
---------------------------------------------------

-- 4.5 : �Ϲ� �Լ�
-- 4.5.1 : NULL�� ó���ϱ� : NVL
-- ���� : NULL�� Ư��
--       employees���̺��� �����,  salary, commission_pct�� ��ȸ�Ͻÿ�.
--       commission_pct�� ����
SELECT employee_id, salary,  commission_pct
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

-- ���� : NULL�� Ư�� => null ���� �����ϴ� ��� ������ ����� null��
--       employees���̺��� �����,  salary, commission_pct,
--       salary * commission_pct�� ��ȸ�Ͻÿ�.
--       commission_pct�� ����
SELECT employee_id, salary,  commission_pct, salary * commission_pct
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

-- ���� 4-13 : employees���̺��� salary�� commision_pct��
--             ���ϵ� commition_pct�� null�� ���� 1�� ġȯ�Ͽ�
--             commition_pct�� ���� ���� ����Ͻÿ�.
SELECT salary * NVL(commission_pct, 1)
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

-- ���� 4-13-2 : employees���̺��� manager_id�� null�̸� '�ӿ�'�̶� ����ϰ�
--              manager_id �� null�� �ƴϸ� '�Ϲݻ���� ������'�̶�� ����Ͻÿ�.
select NVL2(manager_id, '�Ϲݻ�� �� ������', '�ӿ�')
from employees;

---------------------------------------------------

-- 4.5.2 : ���� �� ó���ϱ� : DECODE
--���� 4-14 : employees ���̺��� first_name, first_name, department_id, salary�� ����ϵ�
--           department_id�� 60�� ��쿡�� �޿��� 10%�λ��� ���� ����ϰ�
--           �������� ��쿡�� ������ ���� ����Ͻÿ�.
--           �׸��� department_id�� 60�� ��쿡�� '10%�λ�'�� ����ϰ�
--           ������ ��쿡�� '���λ�'�� ����Ͻÿ�.
select first_name||last_name �̸�, department_id, salary �����޿�, 
decode(department_id, 60, salary*1.1, salary) �����޿�, decode(department_id, 60, '10% �λ�', '���λ�') �λ�޿�
from employees;


select * from employees;
select * from DEPARTMENTS;
---------------------------------------------------
--4.5.3 ������ ���� �� ó���ϱ� : CASE ǥ����  
--���� 4-15 : employees ���̺��� job_id�� ;IT_PROG'�̶��
--           employee_id, first_name, last_name, salary�� ����ϵ�
--           salary�� 9000�̻��̸� '�����޿�'
--           salary�� 6000�̻� 9000�̸��̸� '�����޿�'
--           �� �����̸� '�����޿�'��� ��µǵ��� ��ȸ�Ͻÿ�.

---------------------------------------------------
--4.5.4 ������ ���� ���� �ű�� : RANK, DENSE_RANK, ROW_NUMBER  
-- ���� 4-16 : employees���̺��� salary���� ���� ������� 
--            ������ �Ű� ����Ͻÿ�.

---------------------------------------------------
-- ���� 4-17 : employees���̺��� ����� ���� department_id�ȿ���
--            salary���� ���� ������� ������ �Ű� ����Ͻÿ�.

---------------------------------------------------

-- 4.6 : ��ޱ׷��Լ�
-- 4.6.1 �׷� �׸� ������ ����ϱ� : group by rollup
-- ���� : employees ���̺��� department_id�� 50�̻��� �����������
--       �μ���, ������ �������, �������հ踦 ��ȸ�ϰ� 
--       �μ��� �����踦 �Ͻÿ�.

---------------------------------------------------

-- 4.6.1 �׷� �׸� ������ ����ϱ� : group by cube
-- ���� : employees ���̺��� department_id�� 50�̻��� �����������
--       �μ���, ������ �������, �������հ踦 ��ȸ�ϰ� 
--       �μ��� �����踦 �Ͻÿ�.

---------------------------------------------------

-- 4.6.1 �׷� �׸� ������ ����ϱ� : group by grouping sets
-- ���� : employees ���̺��� department_id�� 100�̻��� �����������
--       �μ��� �ο�����
--       �����ں� �ο����� ���ϰ� �������Ͻÿ�
-- UNION ���

---------------------------------------------------

-- group by grouping sets ���

---------------------------------------------------