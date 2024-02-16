COMMIT;

select *
from employees
where employee_id = 176;

UPDATE employees
SET salary = 77777
where employee_ID = 176; --ScriptRunner 작업만 계속 돌아가면서 결과 안나옴....left에서 누가 작업중이라 데이터가 잠겨있기 때문!
--left에서 커밋하는 순간 실행완료!(행 잠금 해제 됐으므로)...이제 행 업데이트 된다!!!


COMMIT;


