COMMIT;

UPDATE employees
SET salary = 99999
where employee_ID = 176;

select *
from employees
where employee_id = 176;

ROLLBACK;

COMMIT;

TRUNCATE TABLE aa; --aa�� ���̺��� ������ �� ������ ddl�̹Ƿ� �����ϸ� �ձ��� ���� commit�ǹǷ� right���� �� ��� �����ż� �� �� �� �ִ�~

