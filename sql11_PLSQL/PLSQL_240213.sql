SET SERVEROUTPUT ON --설정을 건드는거라서 작업이 완료되었다고 뜨기만 한다...

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, World!');
END;
/
--해당 블럭을 실행하고 컴파일하는 명령어 (반드시 한 줄에 있어야 함)


DECLARE
    -- 선언부 : 정의 및 선언
    v_annual NUMBER(9,2) := &연봉;
    v_sal v_annual%TYPE; --위의 타입을 그대로 사용하겠따
BEGIN
    -- 실행부
    v_sal := v_annual/12;
    DBMS_OUTPUT.PUT_LINE('The monthly salary is ' || TO_CHAR(v_sal));
END;
/





-- 중첩블록
DECLARE
    v_sal NUMBER(7,2) := 60000;
    v_comm v_sal%TYPE := v_sal * .20;
    v_message VARCHAR2(255) := ' eligible for commission';
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal);    --60000
    DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm);  --12000
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message);    --' eligible for commission'
    DBMS_OUTPUT.PUT_LINE('================================');
    DECLARE 
        v_sal NUMBER(7,2) := 50000;
        v_comm v_sal%TYPE := 0;
        v_total_comp NUMBER(7,2) := v_sal + v_comm;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal);    --50000
        DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm);  --0
        DBMS_OUTPUT.PUT_LINE('v_message ' || v_message);    --' eligible for commission'
        DBMS_OUTPUT.PUT_LINE('v_total_comp ' || v_total_comp);  --50000
        DBMS_OUTPUT.PUT_LINE('================================');
        v_message := 'CLERK not ' || v_message;
        v_comm := v_sal * .30;
    END;
    DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal);    --60000
    DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm);  --12000
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message);    --'CLERK not  eligible for commission'
    DBMS_OUTPUT.PUT_LINE('================================');
    v_message := 'SALESMAN ' || v_message;
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message);    --'SALESMAN CLERK not  eligible for commission'
END;
/



DECLARE
    v_eid employees.employee_id%TYPE;
    v_ename VARCHAR2(100);
BEGIN
    SELECT employee_id, last_name
    INTO v_eid, v_ename
    FROM employees
    WHERE employee_id = &사원번호;
    -- WHERE department_id = &부서번호;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
END;
/
