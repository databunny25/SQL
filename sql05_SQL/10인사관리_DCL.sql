-- <DCL> ============================================================================

-- �ý��� ���� Ȯ��
select *
from system_privilege_map;






--��ü���� 
revoke select 
on employees
from yedam;





--<��� SQL>===========================================================================

--������ ���� ------------------------------------------------------------------------

select LEVEL, employee_id, last_name, manager_id
from employees
START WITH manager_id is null
connect by prior employee_id = manager_id; --top down ���
-- �̷��� �ᵵ ��� ���� connect by prior manager_id = employee_id;

select LEVEL, employee_id, last_name, manager_id
from employees
start with manager_id is null
connect by prior manager_id = employee_id; --bottom up ���


select LEVEL, LPAD(' ', 4*(LEVEL-1))||employee_id employee, last_name, manager_id
from employees
start with manager_id is null
connect by prior employee_id = manager_id; --�������� ������!