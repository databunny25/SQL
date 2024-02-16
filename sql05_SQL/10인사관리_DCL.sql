-- <DCL> ============================================================================

-- 시스템 권한 확인
select *
from system_privilege_map;






--객체권한 
revoke select 
on employees
from yedam;





--<고급 SQL>===========================================================================

--계층적 질의 ------------------------------------------------------------------------

select LEVEL, employee_id, last_name, manager_id
from employees
START WITH manager_id is null
connect by prior employee_id = manager_id; --top down 방식
-- 이렇게 써도 결과 같다 connect by prior manager_id = employee_id;

select LEVEL, employee_id, last_name, manager_id
from employees
start with manager_id is null
connect by prior manager_id = employee_id; --bottom up 방식


select LEVEL, LPAD(' ', 4*(LEVEL-1))||employee_id employee, last_name, manager_id
from employees
start with manager_id is null
connect by prior employee_id = manager_id; --레벨별로 보여줌!