-- 4�� Quiz 
-- Quiz 4-1.
-- �ű����α׷� ���߿� ������ IT���úμ��� ������ �λ��ϰ��� �Ѵ�.
-- ������ ���� ������ ���� �����͸� ���õ� ��ȸ�������� ��ȸ�Ͻÿ�
-- ����
--    �λ��� �μ� : IT���úμ� : DEPARTMENT_ID => IT: 60, 210:IT SUPPORT, 230:IT HELPDESK
--    �����λ��� : 12.3%�λ��Ͽ� ����(�ݿø�)�� ǥ��
--    �̸� ��� : �̸� �� (�� : Hunold Alexander) 
-- ��ȸ����
--    �����ȣ      �̸�              �μ�      ����        ����       �λ�ȿ���
--      103	    Hunold Alexander	IT	    IT_PROG	    9000    	10107
-------------------------------------------------------------------------------
select department_id �����ȣ, first_name||last_name �̸�, substr(job_id,1,2) �μ�, job_id ����,
salary ����, 
    case
    when department_id=60 then round(salary*1.23,0)
    when department_id=210 then round(salary*1.23,0)
    when department_id=230 then round(salary*1.23,0)
    else salary
    end "�λ�� ����"
from employees;
-------------------------------------------------------------------------------

-- Quiz 4-2.
-- ������̺��� ������ ���� ������ ���� �����͸� ���õ� ��ȸ�������� ��ȸ�Ͻÿ�
-- ��(last_name)�� 's'�� ������ ����� �̸��� ������ ���õ� ��ȸ���Ŀ� �°� ����ϰ��� �Ѵ�.
-- ����
--    �̸��� �� : ù���ڸ� �빮��
--    ���� : ��� �빮��
--    �Ӹ��� : "Employees JOBs."�� ǥ��
-- ��ȸ����
--    Employees JOBs.
--    Abel Ellenis a SA_REP
-------------------------------------------------------------------------------
select first_name||last_name �̸�, upper(job_id) ����
from employees
where last_name like '%s';
-------------------------------------------------------------------------------

-- Quiz 4-3.
-- ��� ����� ������ ǥ���ϴ� ���� ������ �ۼ��Ϸ� �Ѵ�.
-- �������� �̸�(�̸� ��), ����, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�.
-- ����
--   ���� : ����(salary) + ����(salary)*������������(commission_pct)
--   ���翩�� : ������������(commission_pct)�� ������ "salary+Commition"
--                                      ������ "salary Only"
-- ��ȸ����
--    ���    �̸�           ����      ���翩��
--    144	Vargas Peter	2500	salary Only
--    145	Russell John	19600	salary+Commition
-------------------------------------------------------------------------------
select first_name||last_name �̸�, salary + salary*NVL(commission_pct, 1) ����,
NVL2(commission_pct, 'salary Only', 'salary+Commition') ���翩��
from employees;
-------------------------------------------------------------------------------

-- Quiz 4-4.
-- ��� ����� �̸�(�̸� ��), �Ի���, �Ի������ ����Ͻÿ�. 
-- ����
--   ��(week)�� ������ �Ͽ��Ϻ��� ��µǵ��� �����Ͻÿ�,
-- ��ȸ����
--    �̸�        �Ի���     �Ի����
--    Faviet Daniel	2002-08-16	�ݿ���
-------------------------------------------------------------------------------
select first_name||last_name �̸�, to_char(hire_date,'YYYY-MM-DD') �Ի���,
to_char(hire_date,'DAY') �Ի����
from employees;
-------------------------------------------------------------------------------

-- Quiz 4-5.
-- HR�μ������� �ű�������Ʈ�� �������� �̲� �ش� �����ڵ��� ������ �λ��ϱ�� �����Ͽ���.
-- ����� ���� 107���̸�, 19���� ���ο� �ҼӵǾ� �ٹ����̴�.
-- ���� ���ǰ� �������Ŀ� �´� ����Ÿ�� ��ȸ�Ͻÿ�.
-- ����
--    �޿��λ� ����ڴ� ȸ���� ����(job_id)�� ���� 5�� ������ ���ϴ� ����� �ش�ȴ�.
--    ������ ������ ���ؼ��� ������ ����ȴ�.
--    5�� ���� ��� ���� �λ���� ������ ����.
--    HR_ERP(10%), MK_ERP(12%), PR_ERP(15%), SA_ERP(18%), IT_PROG(20%)
--    case, decode��  ���� ����Ͽ� ������ �ۼ��Ͻÿ�.
-- ��ȸ����
--   ���         �̸�              ����      ����      �λ�ȿ���
--  100	    King Steven	        AD_PRES	    24000	    24000
--  103	    Hunold Alexander	IT_PROG	    9000	    10800
-------------------------------------------------------------------------------

-- DECODE ��� --
select department_id ���, first_name||last_name �̸�, job_id ����, salary ����,
decode(job_id,'HR_ERP',salary*1.1,'MK_ERP',salary*1.2,'PR_ERP',salary*1.5,
                'SA_ERP',salary*1.8,'IT_PROG',salary*2.1,salary) "�λ�� ����"
from employees;

-- CASE ��� --
select department_id ���, first_name||last_name �̸�, job_id ����, salary ����,
case
    when job_id='HR_ERP' then salary*1.1
    when job_id='MK_ERP' then salary*1.2
    when job_id='PR_ERP' then salary*1.5
    when job_id='SA_ERP' then salary*1.8
    when job_id='IT_PROG' then salary*2.1
else salary
end "�λ�� ����"
from employees;

-------------------------------------------------------------------------------

-- Quiz 4-6.
-- HR�μ����� �ֻ��� �Ի��Ͽ� �ش��ϴ� 2001����� 2003����� �Ի��ڵ��� �޿���
-- ���� 5%, 3%, 1% �λ��Ͽ� ���п� ���� �������� �����ϰ��� �Ѵ�.
-- ��ü����� �ش� �⵵�� �ش��ϴ� ������� ������ �˻��Ͽ� �����ϰ� 
-- ���� ���ǰ� �������Ŀ� �´� ����Ÿ�� ��ȸ�Ͻÿ�.
-- ����
--    ���� ����� : 2001����� 2003����� �Ի���
--    ���� : ����(salary)���� 2001�⵵ => 5%, 2002�⵵ => 3%, 2003�⵵ =>1% ������ ����
--    ���� : �Ի����ڿ� ���� ��������
--    case ����Ͽ� ������ �ۼ��Ͻÿ�.
-- ��ȸ����
--   ���         �̸�             �Ի�����       ����     ����
--   102	De Haan Lex	01/01/13	  17000	17850
-------------------------------------------------------------------------------
select department_id ���, first_name||last_name �̸�, hire_date �Ի�����, salary ����,
case
    when to_char(hire_date, 'YY')='01' then round(salary*0.5,0)
    when to_char(hire_date, 'YY')='02' then round(salary*0.3,0)
    when to_char(hire_date, 'YY')='03' then round(salary*0.1,0)
else salary
end "����"
from employees
order by hire_date;
-------------------------------------------------------------------------------