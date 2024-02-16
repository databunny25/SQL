COMMIT;

UPDATE employees
SET salary = 99999
where employee_ID = 176;

select *
from employees
where employee_id = 176;

ROLLBACK;

COMMIT;

TRUNCATE TABLE aa; --aa란 테이블은 없지만 이 문장은 ddl이므로 실행하면 앞까지 전부 commit되므로 right에서 행 잠금 해제돼서 잘 볼 수 있다~

