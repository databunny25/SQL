SET SERVEROUTPUT ON

-- 커서 FOR LOOP
DECLARE
     CURSOR emp_cursor IS
        SELECT employee_Id, last_name
        FROM employees;
        -- WHERE employee_id = 0; 데이터가 없으면 출력자체가 안됨
BEGIN
    FOR emp_record IN emp_cursor LOOP -- FOR 레코드타입 변수 IN 범위 cursor LOOP
        DBMS_OUTPUT.PUT('NO. ' || emp_cursor%ROWCOUNT);
        DBMS_OUTPUT.PUT(', 사원번호 : ' || emp_record.employee_id);
        DBMS_OUTPUT.PUT_LINE(', 사원이름 : ' || emp_record.last_name); 
    END LOOP; -- CLOSE; END LOOP 밖에서 ROWCOUNT, NOTFOUND는 사용불가
        -- DBMS_OUTPUT.PUT_LINE('Total : ' || emp_cursor%ROWCOUNT);
    
    FOR dept_info IN (SELECT * 
                      FROM departments) LOOP -- 이름이 없으므로 속성을 사용할 수 없고 재사용이 불가, 데이터를 확인하는 용도에서 그침
        DBMS_OUTPUT.PUT('부서번호 : ' || dept_info.department_id);
        DBMS_OUTPUT.PUT_LINE(', 부서이름 : ' || dept_info.department_name);    
    END LOOP;
END;
/


-- 1) 모든 사원의 사원번호, 이름, 부서이름 출력
-- SQL문
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;

-- PLSQL문
DECLARE
    CURSOR emp_cursor IS 
        SELECT e.employee_id eid, e.last_name ename, d.department_name dept_name
        FROM employees e
        LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT('사원번호 : ' || emp_record.eid);
        DBMS_OUTPUT.PUT(', 사원이름 : ' || emp_record.ename);
        DBMS_OUTPUT.PUT_LINE(', 부서이름 : ' || emp_record.dept_name);  
    END LOOP;
END;
/

-- 2) 부서번호가 50이거나 80인 사원들의 사원이름, 급여, 연봉 출력
-- SQL문
SELECT last_name, salary, (salary*12+(NVL(salary, 0) * NVL(commission_pct, 0) * 12)) as annual
FROM employees
WHERE department_id IN (50, 80);

-- PLSQL문
DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, salary, (salary*12+(NVL(salary, 0) * NVL(commission_pct, 0) * 12)) as annual
        FROM employees
        WHERE department_id IN (50, 80);
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT('사원이름 : ' || emp_record.last_name);
        DBMS_OUTPUT.PUT(', 급여 : ' || emp_record.salary);
        DBMS_OUTPUT.PUT_LINE(', 연봉 : ' || emp_record.annual);
    END LOOp;
END;
/

-- PLSQL문
DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, salary, commission_pct
        FROM employees
        WHERE department_id IN (50, 80);
        
    v_annual NUMBER(10, 0);
BEGIN
    FOR emp_record IN emp_cursor LOOP
        v_annual := (emp_record.salary*12+(NVL(emp_record.salary, 0) * NVL(emp_record.commission_pct, 0) * 12));
        DBMS_OUTPUT.PUT('사원이름 : ' || emp_record.last_name);
        DBMS_OUTPUT.PUT(', 급여 : ' || emp_record.salary);
        DBMS_OUTPUT.PUT_LINE(', 연봉 : ' || v_annual);
    END LOOp;
END;
/

-- 매개변수를 사용하는 커서
DECLARE
    CURSOR emp_cursor
        ( p_mgr employees.manager_id%TYPE ) IS -- 이름과 데이터 타입만 선언함
            SELECT *
            FROM employees
            WHERE manager_id = p_mgr;
            
    v_emp_info emp_cursor%ROWTYPE;
BEGIN
    -- 기본
    OPEN emp_cursor(100); -- 커서를 OPEN 할 때 매개변수를 반드시 넣어줘야 함
        
    LOOP
        FETCH emp_cursor INTO v_emp_info;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
        DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name);
    END LOOP;
    
    CLOSE emp_cursor; -- 커서를 닫지 않고 새로운 값을 오픈하면 불가능함
    
    -- 커서 FOR LOOP
    FOR emp_info IN emp_cursor(149) LOOP
        DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
        DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name);
    END LOOP;
END;
/

/*
1.
사원(employees) 테이블에서
사원의 사원번호, 사원이름, 입사연도를
다음 기준에 맞게 각각 test01, test02에 입력하시오.
입사년도가 2015년(포함) 이전 입사한 사원은 test01 테이블에 입력
입사년도가 2015년 이후 입사한 사원은 test02 테이블에 입력
=> 커서
=> 조건문(IF문)
=> INSERT문
*/

CREATE TABLE test01
AS
    SELECT employee_id, first_name, hire_date
    FROM employees
    WHERE employee_id = 0;
    
CREATE TABLE test02
AS
    SELECT employee_id, first_name, hire_date
    FROM employees
    WHERE employee_id = 0;

-- 1-1) 명시적 커서 + 기본 LOOP 사용
DECLARE
    CURSOR emp_cursor IS
            SELECT employee_id, first_name, hire_date
            FROM employees;
            
    emp_record emp_cursor%ROWTYPE;
BEGIN
    OPEN emp_cursor;
    
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        -- 커서가 가리키는 한행을 기준으로 실행하고자 하는 부분
        IF TO_CHAR(emp_record.hire_date, 'yyyy') >= '2015' THEN
            INSERT INTO test01 ( employee_id, first_name, hire_date )
            VALUES ( emp_record.employee_id, emp_record.first_name, emp_record.hire_date );
        ELSE
            INSERT INTO test02
            VALUES emp_record;
        END IF;
    END LOOP;
    
    CLOSE emp_cursor;
END;
/

-- 1-2) 커서 FOR LOOP 사용
DECLARE
    CURSOR emp_cursor IS
            SELECT employee_id, first_name, hire_date
            FROM employees;
            
    emp_record emp_cursor%ROWTYPE;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        IF TO_CHAR(emp_record.hire_date, 'yyyy') >= '2015' THEN
            INSERT INTO test01 ( employee_id, first_name, hire_date )
            VALUES ( emp_record.employee_id, emp_record.first_name, emp_record.hire_date );
        ELSE
            INSERT INTO test02
            VALUES emp_record;
        END IF;
    END LOOP;
END;
/

SELECT * FROM test01;
SELECT * FROM test02;