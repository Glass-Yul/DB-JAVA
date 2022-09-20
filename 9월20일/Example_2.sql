-- connect as hr/hr1234
-- 4.3 �׷��Լ��� �׷���
-- 4.3.1 : �׷��Լ�(count, sum, avg, min, max)

-- [���� 4-18] : ����� ���� ��
select count(*) "��� �� ��" from employees;
---------------------------------------------------

-- [���� 4-19] : ��ü ����Ǥ� ���� �հ�, ���� ���, ��� ��տ����� ��ȸ�Ͻÿ�.
-- ��� = ��ü�޿��հ�/����Ǽ�
select sum(salary) �հ�,avg(salary) ���, sum(salary)/count(salary) ���2 from employees;
---------------------------------------------------

-- [���� 4-20] : ��ü����� ���� �� ���� �ִ밪, ���� �ּڰ�, ����� �̸��� �ִ빮�ڰ�, �ּҹ��ڰ��� ��ȸ�Ͻÿ�.
select max(salary) �ִ밪, min(salary)�ּڰ�, max(first_name || last_name) �ִ빮�ڰ�, min(first_name || last_name) �ּҹ��ڰ� from employees;
---------------------------------------------------

--4.3.2 : group by
-- [���� 4-21]: employee_id�� 10�̻��� ������� job_id(����)���� �׷�ȭ�Ͽ�
--             �ѿ����� ��տ����� ��ȸ�Ͻÿ�.
--             (��ȸ������ job_id�� �ѿ��� ���� ������������ ����)  
select job_id ����, sum(salary) �ѿ���, avg(salary) ��տ��� 
from employees
where employee_id>=10
group by job_id
order by job_id, �ѿ��� desc;
---------------------------------------------------

-- [���� 4-21-2]: employee_id�� 10�̻��� ������� job_id, manager_id�� �׷�ȭ�Ͽ�
--             �ѿ������� ��տ����� ��ȸ�Ͻÿ�.
--             (��ȸ������ �ѱ޿� ���� ������������ ����)  
select job_id ��׷�, manager_id �ұ׷�, sum(salary) As �ѿ���, avg(salary) ��տ���
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
select job_id ����, sum(salary) �ѿ���, avg(salary) ��տ��� 
from employees
where employee_id>=10
group by job_id having sum(salary)>=3000
order by job_id, �ѿ��� desc;
---------------------------------------------------
