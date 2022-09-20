-- connect hr/hr1234
-- SQL�� �⺻ ���� QUIZ
--[Quiz 3-1-1] : Departments�� ��� �÷� ��ȸ
select * from Departments;
---------------------------------------------------

--[Quiz 3-1-2] : �μ��� ��ȸ
select department_name from Departments;
---------------------------------------------------

--[Quiz 3-1-3] : �μ����� �ߺ����� ��ȸ
select distinct department_name from Departments;
---------------------------------------------------

--[Quiz 3-1-4]: �μ��� �������� ����
select distinct department_name from Departments order by department_name;
---------------------------------------------------

--[Quiz 3-1-4] : �μ��ڵ�80�� �μ��� �μ��ڵ�, �μ��� ��ȸ
select department_id,department_name from Departments where department_id=80;
---------------------------------------------------

--[Quiz 3-1-5] : IT���úμ� �μ��ڵ�, �μ��� ��ȸ
select department_id,department_name from Departments where department_name like 'IT%';
---------------------------------------------------

--[Quiz 3-2-1] : Jobs�� ��� �÷� ��ȸ
select * from jobs;
---------------------------------------------------

--[Quiz 3-2-2] : job title ��ȸ
select job_title from jobs;
---------------------------------------------------

--[Quiz 3-2-3] : job title �ߺ����� ��ȸ
select distinct job_title from jobs;
---------------------------------------------------

--[Quiz 3-2-3]:  job title  �������� ����
select distinct job_title from jobs order by job_title desc;
---------------------------------------------------

--[Quiz 3-2-4] : manager�� ���ϴ� job_id, job_title�� ��ȸ�Ͻÿ�.
select job_id, job_title from jobs where job_title like '%Manager';
---------------------------------------------------

--[Quiz 3-3-1] : ������ ���� ��ȸ�ǵ��� SQL���� �ۼ��Ͻÿ�
-- ��ȸ����
--  ����̸�            �̸���           ����           ��������
--  steve jobs   sthob@company.com   1000000$             10%
select first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ���� from employees;
---------------------------------------------------

--[Quiz 3-3-2] : ���������� �ԷµǾ� �ִ� ������� �������� 
--              ������ ��ȸ���°� �ǵ��� SQL���� �ۼ��Ͻÿ�
-- �������� �Է� => commission_pct�� null�� �ƴ�
-- ������ = ����*��������
-- ��ȸ����
--  ����̸�         �̸���           ����           ��������             ������($)
-- steve jobs   sthob@company.com   14000$          .4%                5600$      
select first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ����, commission_pct||'%' �����޷�, (salary*commission_pct)||'$' ������
from employees
where commission_pct is not null;
---------------------------------------------------

-- [Quiz 3-3-3] : IT���� �μ� �ٹ��ڸ� ��ȸ�Ͻÿ�.
--IT���úμ� �μ��ڵ� : 60, 210, 230
select * from Departments where department_id in (60,120,230);
---------------------------------------------------

-- [Quiz 3-3-4] : manager ������ ���ϴ� �ٹ��ڸ� ��ȸ�Ͻÿ�.
-- manager���� �����ڵ� : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
select * from jobs where job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN');
---------------------------------------------------



-- [Quiz 3-3-5] : IT���� �μ� �ٹ����� ������ ���������� ��ȸ�Ͻÿ�. (�μ�, ����̸� �� ��ȸ)
--IT���úμ� �μ��ڵ� : 60, 210, 230
-- ������ = ����*��������
-- ��ȸ����
--  �μ�ID     ����̸�         �̸���           ����           ��������             ������($)
--    60     steve jobs   sthob@company.com   14000$          .4%                5600$      
select D.department_id �μ�ID, first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ����, commission_pct||'%' �����޷�, (salary*commission_pct)||'$' ������ 
from Departments D join employees E on D.department_id=E.department_id
where D.department_id in (60,210,230);

---------------------------------------------------


-- [Quiz 3-3-6] : manager ������ ���ϴ� �ٹ����� ������ ���������� ��ȸ�Ͻÿ�. (����ID, ����̸� �� ��ȸ)
-- manager���� �����ڵ� : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- ������ = ����*��������
-- ��ȸ����
--  ����ID     ����̸�         �̸���           ����           ��������             ������($)
--  AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select jobs.job_id ����ID, first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ����, commission_pct||'%' �����޷�, (salary*commission_pct)||'$' ������ 
from jobs join employees on jobs.job_id = employees.job_id
where jobs.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN');  
---------------------------------------------------


-- [Quiz 3-3-7] : manager ������ ���ϸ鼭 ���������� NULL ���� �ƴ� �ٹ����� ������ ���������� ��ȸ�Ͻÿ�. (����ID, ����̸� �� ��ȸ)
-- manager���� �����ڵ� : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- ������ = ����*��������
-- ��ȸ����
--  ����ID     ����̸�         �̸���           ����           ��������             ������($)
--  AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select jobs.job_id ����ID, first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ����, commission_pct||'%' �����޷�, (salary*commission_pct)||'$' ������ 
from jobs join employees on jobs.job_id = employees.job_id
where jobs.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN')and commission_pct is not null;  
---------------------------------------------------


-- [Quiz 3-3-8] : manager ������ ���ϸ鼭 ���������� NULL ���� �ƴ� �ٹ����� 
--                ������ 12000$�̻� 15000$������ ������� ������ ���������� ��ȸ�Ͻÿ�. (����ID, ����̸� �� ��ȸ)
-- manager���� �����ڵ� : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- ������ = ����*��������
-- ��ȸ����
--  �μ�ID     ����̸�         �̸���           ����           ��������             ������($)
--  AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select jobs.job_id ����ID, first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ����, commission_pct||'%' �����޷�, (salary*commission_pct)||'$' ������ 
from jobs join employees on jobs.job_id = employees.job_id
where salary between 12000 and 15000 and (jobs.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN')and commission_pct is not null ); 
---------------------------------------------------


-- [Quiz 3-3-9] : sales�μ����� manager ������ ���ϸ鼭 ���������� NULL ���� �ƴ� �ٹ����� 
--                ������ 12000$�̻� 15000$������ ������� ������ ���������� ��ȸ�Ͻÿ�. (����ID, ����̸� �� ��ȸ)
-- sales�μ� �μ��ڵ� : 80
-- manager���� �����ڵ� : 'FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN'
-- ������ = ����*��������
-- ��ȸ����
--  �μ�ID     ����̸�         �̸���           ����           ��������             ������($)
--   AC_MGR   steve jobs   sthob@company.com   14000$          .4%                5600$      
select J.job_id ����ID, first_name || last_name ����̸�, email||'@company.com' �̸���, salary||'$' ����, commission_pct||'%' �����޷�, (salary*commission_pct)||'$' ������ 
from (jobs J join employees E on J.job_id = E.job_id) join Departments D on D.department_id = E.department_id
where D.department_id =80 and (salary between 12000 and 15000 and (J.job_id in ('FI_MGR', 'AC_MGR', 'SA_MAN', 'PU_MAN', 'ST_MAN', 'MK_MAN')and commission_pct is not null )); 
---------------------------------------------------


-- [Quiz 3-4-1] ����������� �μ��� �����, �ѿ���, ��տ���, �ִ뿬��, �ּҿ����� ��ȸ�Ͻÿ�.
--              (��ȸ������ �μ� ���� ������������ ����) 
-- ��ȸ����
--  �μ�ID  �����    �ѿ���         ��տ���    �ִ뿬��   �ּҿ���
--   80      34     304500          8955      14000      6100 
select department_id �μ�ID, count(*) �����, sum(salary) �ѿ���, avg(salary) ��տ���, max(salary) �ִ뿬��, min(salary) �ּҿ���
from  employees
group by department_id
order by department_id desc;
---------------------------------------------------



-- [Quiz 3-4-2] ����������� �μ��ڵ尡 null�� �ƴ� ��� �������
--              �μ��� �����, �ѿ���, ��տ���, �ִ뿬��, �ּҿ����� ��ȸ�Ͻÿ�.
--              (��ȸ������ �μ� ���� ������������ ����) 
-- ��ȸ����
--  �μ�ID  �����    �ѿ���         ��տ���    �ִ뿬��   �ּҿ���
--   80      34     304500          8955      14000      6100 
select department_id �μ�ID, count(*) �����, sum(salary) �ѿ���, avg(salary) ��տ���, max(salary) �ִ뿬��, min(salary) �ּҿ���
from  employees
where department_id is not null
group by department_id
order by department_id desc;
---------------------------------------------------



-- [Quiz 3-4-3] ����������� �μ��ڵ�� �����ڵ尡 null�� �ƴ� ��� �������
--              �μ��ڵ庰, �����ڵ庰 �����, �ѿ���, ��տ���, �ִ뿬��, �ּҿ����� ��ȸ�Ͻÿ�.
--              (��ȸ������ �μ��ڵ� ���� ��������, �����ڵ� ���� ������������ ����)
-- ��ȸ����
--  �μ�ID   �����  ����ID    �ѿ���         ��տ���    �ִ뿬��   �ּҿ���
--   80       5    SA_MAN   61000           12200     14000    10500
select department_id �μ�ID, count(*) �����, job_id ����ID, sum(salary) �ѿ���, avg(salary) ��տ���, max(salary) �ִ뿬��, min(salary) �ּҿ���
from  employees
where department_id is not null and job_id is not null
group by department_id, job_id
order by department_id , job_id;
---------------------------------------------------



-- [Quiz 3-4-4] ����������� �μ��ڵ�� �����ڵ尡 null�� �ƴ� ��� �������
--              �μ��ڵ庰, �����ڵ庰 �����, �ѿ���, ��տ���, �ִ뿬��, �ּҿ����� ��ȸ�Ͻÿ�.
--              ��, ��տ����� 7000�̻��� ����� ��ȸ�Ͻÿ�.
--              (��ȸ������ �μ��ڵ� ���� ��������, �����ڵ� ���� ������������ ����)  
--  �μ�ID   �����  ����ID    �ѿ���         ��տ���    �ִ뿬��   �ּҿ���
--   80       5    SA_MAN   61000           12200     14000    10500
select department_id �μ�ID, count(*) �����, job_id ����ID, sum(salary) �ѿ���, avg(salary) ��տ���, max(salary) �ִ뿬��, min(salary) �ּҿ���
from  employees
where department_id is not null and job_id is not null
group by department_id, job_id having avg(salary)>=7000
order by department_id , job_id;

select * from Departments;
select * from employees;
select * from jobs;
---------------------------------------------------
