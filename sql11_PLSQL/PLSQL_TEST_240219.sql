SET SERVEROUTPUT ON

--2.
DECLARE 
    v_dept_name departments.department_name%TYPE;
    v_job_id employees.job_id%TYPE;
    v_salary employees.salary%TYPE;
    v_annual NUMBER(15, 0);
BEGIN
    SELECT d.department_name,
           e.job_id,
           NVL(e.salary, 0) as salary,
           NVL(e.salary, 0)*(1 + NVL(e.commission_pct, 0)/100) as annual
    INTO v_dept_name,
         v_job_id,
         v_salary,
         v_annual
    FROM employees e JOIN departments d
        ON e.department_id = d.department_id
    WHERE e.employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT_LINE('부서이름 : ' || v_dept_name);
    DBMS_OUTPUT.PUT_LINE('job_id : ' || v_job_id);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('연간 총수입 : ' || v_annual);    
END;
/





--3.
DECLARE
    v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT hire_date
    INTO v_hire_date
    FROM employees
    WHERE employee_id = &사원번호;
    
    IF TO_CHAR(v_hire_date, 'yyyy') > 2015 THEN
        DBMS_OUTPUT.PUT_LINE('New employee');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('Career employee');
    END IF;
END;
/



--4.
BEGIN
    FOR i IN 1..9 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        FOR j IN 1..9 LOOP
            DBMS_OUTPUT.PUT(i || ' * ' || j || ' = ' || i*j || ' ');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;    
END;
/




--5.
DECLARE
    CURSOR dept_emp_cur IS
        SELECT employee_id, last_name, salary
        FROM employees
        WHERE department_id = &치환변수;
        
    v_emp_info dept_emp_cur%ROWTYPE;
BEGIN

    FOR v_emp_info IN dept_emp_cur LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp_info.employee_id || ' ' || v_emp_info.last_name || ' 사원의 급여는 ' || v_emp_info.salary);
    END LOOP;
    
END;
/



--6.
CREATE OR REPLACE PROCEDURE salary_update
( emp_id IN employees.employee_id%TYPE,
  sal_raise IN NUMBER )
IS
    no_emp_err EXCEPTION;
BEGIN
    UPDATE employees
    SET salary = salary * ( 1 + (sal_raise/100) )
    WHERE employee_id = emp_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE no_emp_err;
    END IF;
    
EXCEPTION
    WHEN no_emp_err THEN
        DBMS_OUTPUT.PUT_LINE('No search employee!!');
END;
/

SELECT * FROM employees WHERE employee_id = 100;
EXECUTE salary_update(100, 10);




--7.

CREATE OR REPLACE PROCEDURE jumin_info
    ( jumin IN VARCHAR2)
IS
    v_birth DATE;
    v_age NUMBER(3, 0);
    v_gender VARCHAR2(100);
BEGIN
    v_birth := TO_DATE( SUBSTR(jumin, 1, 6), 'RRMMdd');
    v_age := TRUNC((sysdate-v_birth)/365, 0);
    
    CASE SUBSTR(jumin, 7, 1) 
        WHEN '1' THEN
            v_gender := '남자';
        WHEN '3' THEN
            v_gender := '남자';
        ELSE
            v_gender := '여자';
        END CASE;
    
    DBMS_OUTPUT.PUT_LINE('입력한 주민번호에 해당하는 주민의 나이는 ' || v_age || ', 성별은 ' || v_gender || '입니다.');    
END;
/
    




--8.
CREATE OR REPLACE FUNCTION hired_year_fun
    ( empid employees.employee_id%TYPE )
    RETURN NUMBER
IS 
    v_hired_year NUMBER(2,0);
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12)
    INTO v_hired_year
    FROM employees
    WHERE employee_id = empid;
    
    RETURN v_hired_year;
END;
/

SELECT last_name, hired_year_fun(employee_id) as "hired_year"
FROM employees;


--9.
select * from departments;
select * from employees;

CREATE OR REPLACE FUNCTION manager_info_fun
    (deptname departments.department_name%TYPE)
    RETURN VARCHAR2
IS
    v_manager_name employees.last_name%TYPE;
BEGIN
    SELECT last_name
    INTO v_manager_name
    FROM employees
    WHERE employee_id = ( SELECT manager_id
                          FROM departments
                          WHERE department_name = deptname);
                          
    RETURN v_manager_name;
END;
/




--10.
SELECT name, text
FROM user_source
WHERE type IN ('PROCEDURE', 'FUCTION', 'PACKAGE', 'PACKAGE BODY');




--11.
BEGIN
    FOR counter IN 1 .. 10 LOOP
        FOR i IN REVERSE counter..10 LOOP
            DBMS_OUTPUT.PUT('-');
        END LOOP;
        FOR j IN 1..counter LOOP            
                DBMS_OUTPUT.PUT('*');
        END LOOP;
        
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
/

