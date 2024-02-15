SET SERVEROUTPUT ON



/*  문제2.
        치환변수(&)를 사용하면 숫자를 입력하면
        해당 구구단이 출력되도록 하시오.
        ex) 2입력시
            2 * 1 = 2
            2 * 2 = 4
            .
            .
            .
            2+ 9 = 18                   */
            
DECLARE
    v_num NUMBER(2, 0) := &실행할단수;
    v_result NUMBER(10, 0) := 0;
BEGIN    
    FOR i IN 1..9 LOOP 
         v_result := v_num * i;
        DBMS_OUTPUT.PUT_LINE(v_num || ' * ' || i || ' = ' || v_result);
    END LOOP;  
    
END;
/

--by교수님
/*
치환변수 : 변수, 단을 입력
곱하는 수 : 1에서 9까지, 정수값 ===> LOOP문
*/
-- 기본 LOOP문 ==> 조건과 관련된 변수 필수!
DECLARE
    v_dan CONSTANT NUMBER(2,0) := &단;
    v_num NUMBER(2,0) := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num));
        
        v_num := v_num + 1;
        EXIT WHEN v_num > 9;
    END LOOP;
END;
/

--WHILE LOOP => 조건과 관련된 변수
DECLARE
    v_dan CONSTANT NUMBER(2,0) := &단;
    v_num NUMBER(2,0) := 1; --범위 : 1~9, 정수 모두
BEGIN
    WHILE v_num <= 9 LOOP
        DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num));
        v_num := v_num +1;
    END LOOP;
END;
/

--FOR LOOP => 변수를 요구하지 않음
DECLARE
    v_dan CONSTANT NUMBER(2,0) := &단;
BEGIN
    FOR num IN 1..9 LOOP --특정 범위에 존재하는 정수 값을 내부 변수
        DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num));
    END LOOP;
END;
/







/*  문제3.
        구구단 2~9단까지 출력되도록 하시오.   */

DECLARE
    v_result NUMBER(2, 0) := 0;
BEGIN    
    FOR i IN 2..9 LOOP    
        FOR j IN 1..9 LOOP
            v_result := i * j;
            DBMS_OUTPUT.PUT_LINE(i || ' * ' || j || ' = ' || v_result);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;     
END;
/

--by교수님
-- WHILE LOOP => 반복조건과 관련된 변수
DECLARE
    v_dan NUMBER(2,0) := 2; -- 2~9
    v_num NUMBER(2,0) := 1; -- 1~9
BEGIN
    WHILE v_dan <= 9 LOOP --단
        v_num := 1;
        WHILE v_num <= 9 LOOP --곱하는 수
            DBMS_OUTPUT.PUT(v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num) || ' ');
            v_num := v_num +1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
        v_dan := v_dan +1;
    END LOOP;
END;
/


DECLARE
    v_i NUMBER(2,0) := 1;
    v_j NUMBER(2,0) := 1;
BEGIN
    LOOP
        v_j := 1;
        LOOP            
            DBMS_OUTPUT.PUT(v_i || ' * ' || v_j || ' = ' || v_i * v_j );
            v_j := v_j + 1;
            EXIT WHEN v_j > 9;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
        v_i := v_i + 1;
        EXIT WHEN v_i > 9;
    END LOOP;
END;
/






/*  문제4.
        구구단 1~9단까지 출력되도록 하시오.
        (단, 홀수단 출력)     */
   
BEGIN
    FOR i IN 2..9 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        FOR j IN 1..9 LOOP
            DBMS_OUTPUT.PUT(i || ' * ' || j || ' = ' || i*j || ' ');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;    
END;
/



-- by교수님
-- 교수님 코드/FOR LOOP
BEGIN
    FOR v_dan IN 2..9 LOOP
        IF MOD(v_dan, 2) = 0 THEN
            CONTINUE;
        END IF;
        
        FOR v_num IN 1..9 LOOP
            DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num));
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;
/

-- 교수님 코드/기본 LOOP
DECLARE
    v_dan NUMBER(2,0) := 2;
    v_num NUMBER(2,0) := 1;
BEGIN
    LOOP 
        IF MOD(v_dan, 2) <> 0 THEN
            v_num := 1;
            LOOP
                DBMS_OUTPUT.PUT_LINE(v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num) || ' '); 
                v_num := v_num + 1;
                EXIT WHEN v_num > 9;  
            END LOOP;
            DBMS_OUTPUT.PUT_LINE(' ');
        END IF;
        v_dan := v_dan + 1;
        EXIT WHEN v_dan > 9;
    END LOOP;
END;
/











/*  Composite   */
/*  RECORD  */

DECLARE
    -- 1) 정의
    TYPE emp_record_type IS RECORD
        (empno NUMBER(6,0), 
         ename employees.last_name%TYPE,
         sal employees.salary%TYPE := 0 );
         
    -- 2) 변수 선언
    v_emp_info emp_record_type;
    v_emp_record emp_record_type;
    
BEGIN    
    SELECT employee_id, first_name, salary
    INTO v_emp_info
    FROM employees
    WHERE employee_id = &사원번호;
    
    -- DBMS_OUTPUT.PUT_LINE(v_emp_info); 이렇게는 출력 불가능!!!
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_emp_info.empno);
    DBMS_OUTPUT.PUT_LINE(', 사원이름 : ' || v_emp_info.ename);
    DBMS_OUTPUT.PUT_LINE(', 급여 : ' || v_emp_info.sal);
    
END;
/

-- RECORD : %ROWTYPE
DECLARE
    v_emp_info employees%ROWTYPE;
BEGIN
    SELECT *
    INTO v_emp_info
    FROM employees
    WHERE employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_emp_info.employee_id);
    DBMS_OUTPUT.PUT_LINE(', 사원이름 : ' || v_emp_info.last_name);
    DBMS_OUTPUT.PUT_LI NE(', 업무 : ' || v_emp_info.job_id);
END;
/





-- TABLE
DECLARE
    -- 1) 정의
    TYPE num_table_type IS TABLE OF NUMBER
        INDEX BY PLS_INTEGER;
    -- 2) 변수 선언
    v_num_info num_table_type;
BEGIN
    --DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000));

    v_num_info(-1000) := 10000; -- -1000번째 인덱스에 10000이란 값을 넣겠따
    
    DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000));
END;
/


--2의 배수 10개를 담는 예제 : 2,4,6,8,10,12,13...
DECLARE
    TYPE num_table_type IS TABLE OF NUMBER
        INDEX BY PLS_INTEGER;
        
    v_num_ary num_table_type;
    
    v_result NUMBER(4,0) := 0;
BEGIN
    FOR idx IN 1..10 LOOP
        v_num_ary(idx * 5) := idx * 2;
    END LOOP;
    
    FOR i IN v_num_ary.FIRST .. v_num_ary.LAST LOOP
        IF v_num_ary.EXISTS(i) THEN
            DBMS_OUTPUT.PUT(i || ' : ');
            DBMS_OUTPUT.PUT_LINE(v_num_ary(i));
            
            v_result := v_result + v_num_ary(i);
        END IF;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_num_ary.COUNT);
    DBMS_OUTPUT.PUT_LINE('누적합 : ' || v_result);
END;
/





-- TABLE + RECORD
SELECT *
FROM employees;

DECLARE
    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
    
    v_emps emp_table_type;
    v_emp_info employees%ROWTYPE;
BEGIN
    FOR eid IN 100 .. 104 LOOP
        SELECT *
        INTO v_emp_info
        FROM employees
        WHERE employee_id = eid;
        
        v_emps(eid) := v_emp_info;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);
    DBMS_OUTPUT.PUT_LINE(v_emps(100).last_name);
END;
/


DECLARE
    v_min employees.employee_id%TYPE; -- 최소 사원번호
    v_max employees.employee_id%TYPE; -- 최대 사원번호
    v_result NUMBER(1,0);             -- 사원의 존재유무를 확인
    v_emp_record employees%ROWTYPE;     -- Employees 테이블의 한 행에 대응
    
    TYPE emp_table_type IS TABLE OF v_emp_record%TYPE
        INDEX BY PLS_INTEGER;
    
    v_emp_table emp_table_type;
BEGIN
    -- 최소 사원번호, 최대 사원번호
    SELECT MIN(employee_id), MAX(employee_id)
    INTO v_min, v_max
    FROM employees;
    
    FOR eid IN v_min .. v_max LOOP
        SELECT COUNT(*)
        INTO v_result
        FROM employees
        WHERE employee_id = eid;
        
        IF v_result = 0 THEN
            CONTINUE;
        END IF;
        
        SELECT *
        INTO v_emp_record
        FROM employees
        WHERE employee_id = eid;
        
        v_emp_table(eid) := v_emp_record;     
    END LOOP;
    
    FOR eid IN v_emp_table.FIRST .. v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;    
END;
/






/*  CURSOR  */

DECLARE
    -- 커서를 선언
    CURSOR emp_cursor IS 
        SELECT employee_id, last_name
        FROM employees;
        --WHERE employee_id = 0; --사원번호 0인 사원은 없는데도...에러 안 일어남. 커서의 맹점!
        
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
BEGIN
    OPEN emp_cursor;
    
    FETCH emp_cursor INTO v_eid, v_ename;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    
    CLOSE emp_cursor;
END;
/

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, last_name, job_id
        FROM employees;
        
    v_emp_record emp_cursor%ROWTYPE;       
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        --실제 연산 진행
        
        DBMS_OUTPUT.PUT(emp_cursor%ROWCOUNT || ', ');
        DBMS_OUTPUT.PUT_LINE(v_emp_record.last_name);
    END LOOP;
    
--    FETCH emp_cursor INTO v_emp_record;
--    DBMS_OUTPUT.PUT(emp_cursor%ROWCOUNT || ', ');
--    DBMS_OUTPUT.PUT_LINE(v_emp_record.last_name);
    
    CLOSE emp_cursor;
    
    --FETCH emp_cursor INTO v_emp_record;
    --DBMS_OUTPUT.PUT_LINE(emp_cursor%ROWCOUNT || ', ');
END;
/





DECLARE
    CURSOR emp_cursor IS
        SELECT *
        FROM employees;
        
    v_emp_record employees%ROWTYPE;

    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    v_emp_table emp_table_type;
BEGIN
    OPEN emp_cursor;
    
    LOOP
        FETCH emp_cursor INTO v_emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        v_emp_table(v_emp_record.employee_id) := v_emp_record;
    END LOOP;
    
    CLOSE emp_cursor;
    
    FOR eid IN v_emp_table.FIRST .. v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;   
END;
/