-- connect as hr/hr1234
-- 4.3 �׷��Լ��� �׷���
-- 4.3.1 : �׷��Լ�(count, sum, avg, min, max)
-- [���� 4-18] : ����� ���� ��
select count(*)����� from employees;
---------------------------------------------------

-- [���� 4-19] : ��ü ����� ���� �հ�, ���� ���, ��� ��տ����� ��ȸ�Ͻÿ�.
-- ��� = ��ü�޿��հ�/����Ǽ�
select sum(salary) ����_�հ�, avg(salary) ����_���, sum(salary)/count(*) ���
from employees;
---------------------------------------------------

-- [���� 4-20] : ��ü����� ���� �� ���� �ִ밪, ���� �ּڰ�, ����� �̸��� �ִ빮�ڰ�, �ּҹ��ڰ��� ��ȸ�Ͻÿ�.
select max(salary), min(salary), max(length(first_name||last_name)) �ִ빮�ڰ�, min(length(first_name||last_name)) �ּҹ��ڰ�
from employees;
---------------------------------------------------

--4.3.2 : group by
-- [���� 4-21]: employee_id�� 10�̻��� ������� job_id(����)���� �׷�ȭ�Ͽ�
--             �ѿ����� ��տ����� ��ȸ�Ͻÿ�.
--             (��ȸ������ job_id�� �ѿ��� ���� ������������ ����)
select job_id ������ID, sum(salary) �ѿ���, avg(salary) ��տ���
from employees
where employee_id>=10
group by job_id
order by job_id desc;
---------------------------------------------------

-- [���� 4-21-2]: employee_id�� 10�̻��� ������� job_id, manager_id�� �׷�ȭ�Ͽ�
--             �ѿ������� ��տ����� ��ȸ�Ͻÿ�.
--             (��ȸ������ �ѱ޿� ���� ������������ ����)  
select job_id ������ID,manager_id ������ID, sum(salary) �ѿ���, avg(salary) ��տ���
from employees
where employee_id>=10
group by job_id, manager_id
order by �ѿ��� desc;
---------------------------------------------------

-- 4.3.3 : having
-- [���� 4-22] : emploiyees ���̺��� employee_id �� 10�̻��� ����� ����
--              job_id���� �׷�ȭ�Ͽ� �ѿ����� ��տ����� ���ϵ�,
--              job_id�� �ѿ����� 30000���� ū ���� ��ȸ�Ͻÿ�.
--              (��ȸ������ job_id�� �ѱ޿����� ������������ ����)
select job_id ������ID, sum(salary) �ѿ���, avg(salary) ��տ���
from employees
where employee_id>=10
group by job_id having sum(salary)>30000
order by �ѿ��� desc;
---------------------------------------------------
