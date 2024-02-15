SET SERVEROUTPUT ON

-- 실행문을 먼저 쓰고 그 다음에 선언문에 변수 선언~
DECLARE
    v_deptno departments.department_id%TYPE;
    v_comm employees.commission_pct%TYPE := .1; --0.1(10%) sql은 소수점 앞 0 생략 가능
BEGIN
    SELECT department_id
    INTO v_deptno
    FROM employees
    WHERE employee_id = &사원번호;
    
    INSERT INTO employees(employee_id, last_name, email, hire_date, job_id, department_id)
    VALUES (1000, 'Hong', 'hkd@google.com', sysdate, 'IT_PROG', v_deptno);
    
    UPDATE employees
    SET salary = (NVL(salary,0) + 10000) * v_comm
    WHERE employee_id = 1000;
END;
/

SELECT *
FROM employees
WHERE employee_id = 1000;

--익명인데도 TRANSACTION 종료 안된걸 볼 수 있다...적절한 시기에 커밋과 롤백 해줘야함
ROLLBACK;





BEGIN
    DELETE FROM employees
    WHERE employee_id = 1000;
    
--    UPDATE employees
--    SET salary = salary * 1.1
--    WHERE employee_id = 1000;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다.');
    END IF;
END;
/

SELECT *
FROM employees
WHERE employee_id = 1000; --update에 반응해서 ROWCOUNT가 0이라서 문구 출력... delete에만 반응하도록 만들수 없다....따라서 delete와 if문 사이에 update없어야 함







/* 문제1. 
    사원번호를 입력(치환변수사용&) 할 경우
    사원번호, 사원이름, 부서이름
    을 출력하는 PL/SQL을 작성하시오.   */

-- 첫번째 방법 
DECLARE
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
    v_deptname departments.department_name%TYPE;
BEGIN
    SELECT employee_id, last_name, department_name
    INTO v_eid, v_ename, v_deptname
    FROM employees 
        JOIN departments
        ON employees.department_id = departments.department_id
    WHERE employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('부서이름 : ' || v_deptname);
END;
/


select *
from employees
where employee_id = 100;

-- 두번째 방법
-- PL/SQL의 경우 가능한 방법_ 2개의 SELECT문
DECLARE
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
    v_deptid departments.department_id%TYPE;
    v_deptname departments.department_name%TYPE;
BEGIN
    SELECT employee_id, last_name, department_id
    INTO v_eid, v_ename, v_deptid
    FROM employees
    WHERE employee_id = &사원번호;
    
    SELECT department_name
    INTO v_deptname
    FROM departments
    WHERE department_id = v_deptid;    
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('부서이름 : ' || v_deptname);
END;
/



/* 문제2.
    사원번호를 입력(치환변수사용&) 할 경우
    사원이름, 급여, 연봉 -> (급여*12 + (nvl(급여,0) * nvl(커미션퍼센트,0)*12)
    을 출력하는 PL/SQL을 작성하시오    */

DECLARE
    v_name employees.last_name%TYPE;
    v_salary employees.salary%TYPE;
    v_comm employees.commission_pct%TYPE;
    v_annual v_salary%TYPE;
BEGIN
    SELECT last_name, salary, commission_pct
    INTO v_name, v_salary, v_comm
    FROM employees
    WHERE employee_id = &사원번호;
    
    v_annual := (v_salary + (NVL(v_salary, 0)*NVL(v_comm, 0)) )*12;
    
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('연봉 : ' || v_annual);    
END;
/


-- 교수님 방법
DECLARE
    v_ename employees.last_name%TYPE;
    v_sal employees.salary%TYPE;
    v_annual v_sal%TYPE;
BEGIN
    SELECT last_name, salary, (salary*12 + (NVL(salary, 0)*NVL(commission_pct, 0)*12)) as annual
    INTO v_ename, v_sal, v_annual
    FROM employees
    WHERE employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('연봉 : ' || v_annual);    
END;
/








CREATE TABLE test_employees
AS
    SELECT *
    FROM employees;

-- 기본 IF 문
BEGIN
    DELETE FROM test_employees
    WHERE employee_id = &사원번호;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다.');
        DBMS_OUTPUT.PUT_LINE('사원번호를 확인해주세요.');
    END IF;
END;
/

SELECT *
FROM test_employees;







-- IF ~ ELSE 문 : 하나의 조건식, 결과는 참과 거짓 각각
DECLARE
    v_result NUMBER(4,0);
BEGIN
    SELECT COUNT(employee_id)
    INTO v_result
    FROM employees
    WHERE manager_id = &사원번호;
    
    IF v_result = 0 THEN
        DBMS_OUTPUT.PUT_LINE('일반 사원입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('팀장입니다.');
    END IF;
END;
/

SELECT employee_id
FROM employees
WHERE manager_id = 100;





-- IF ~ ELSIF ~ ELSE 문 : 다중 조건식이 필요, 각각 결과처리
-- 연차를 구하는 공식
SELECT TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12, 0)
FROM employees;

DECLARE
    v_hyear NUMBER(2,0);
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12)
    INTO v_hyear
    FROM employees
    WHERE employee_id = &사원번호;
    
    IF v_hyear < 5 THEN
        DBMS_OUTPUT.PUT_LINE('입사한 지 5년 미만입니다.');
    ELSIF v_hyear < 10 THEN
        DBMS_OUTPUT.PUT_LINE('입사한 지 5년 이상 10년 미만입니다.');
    ELSIF v_hyear < 15 THEN
        DBMS_OUTPUT.PUT_LINE('입사한 지 10년 이상 15년 미만입니다.');
    ELSIF v_hyear < 20 THEN
        DBMS_OUTPUT.PUT_LINE('입사한 지 15년 이상 20년 미만입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('입사한 지 20년 이상입니다.');
    END IF; 
END;
/





/* 문제3-1. 
    사원번호를 입력(치환변수사용&) 할 경우
    입사일이 2015년 이후(2015년 포함)이면 'New employee' 출력
            2015년 이전이면 'Career employee' 출력     */        
DECLARE
    v_hdate NUMBER(5,0);
BEGIN
    SELECT TO_CHAR(hire_date, 'YYYY')
    INTO v_hdate
    FROM employees
    WHERE employee_id = &사원번호;
    
    --v_date := TO_CHAR(v_hdate, 'YYYY');
    
    IF v_hdate >= 2015 THEN
        DBMS_OUTPUT.PUT_LINE('New employee');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('Career employee');
    END IF;
END;
/

-- by 교수님
DECLARE
    v_hdate employees.hire_date%TYPE;
BEGIN
    SELECT hire_date
    INTO v_hdate
    FROM employees
    WHERE employee_id = &사원번호;
    
    --IF v_hdate >= TO_DATE('2015-01-01', 'yyyy-MM-dd') THEN
    IF TO_CHAR(v_hdate, 'yyyy') >= '2015' THEN  --2015에 따옴표 해줘도,안 해줘도 실행 오케이~
        DBMS_OUTPUT.PUT_LINE('New employee');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('Career employee');
    END IF;
END;
/



/* 날짜 연도 YY rr 형식*/
SELECT TO_CHAR(TO_DATE('99/01/01', 'rr/MM/dd'), 'yyyy-MM-dd'),
       TO_CHAR(TO_DATE('99/01/01', 'yy/MM/dd'), 'yyyy-MM-dd')
FROM dual;


/* 문제3-2. 
    사원번호를 입력(치환변수사용&) 할 경우
    입사일이 2015년 이후(2015년 포함)이면 'New employee' 출력
            2015년 이전이면 'Career employee' 출력
    단, DBMS_OUTPUT.PUT_LINE ~ 은 한번만 사용      */
    
-- 리턴 구문은 하나만 있는 것이 좋다!!!!!!!!!!!!!
DECLARE
    v_hdate employees.hire_date%TYPE;
BEGIN
    SELECT TO_CHAR(hire_date, 'YYYY')
    INTO v_hdate
    FROM employees
    WHERE employee_id = &사원번호;
        
    IF v_hdate >= 2015 THEN
        v_sentence := 'New employee';
    ELSE
        v_sentence := 'Career employee';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(v_sentence);
END;
/


--by 교수님
DECLARE
    v_hdate employees.hire_date%TYPE;
    v_msg VARCHAR(1000) := 'Career employee'; --이렇게 해도 된다...but 그냥 적어주는게 좋다! 클린코드!!!
BEGIN
    SELECT hire_date
    INTO v_hdate
    FROM employees
    WHERE employee_id = &사원번호;
    
    --IF v_hdate >= TO_DATE('2015-01-01', 'yyyy-MM-dd') THEN
    IF TO_CHAR(v_hdate, 'yyyy') >= '2015' THEN
        v_msg := 'New employee';
--    ELSIF
--        v_msg := 'Career employee';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(v_msg);
END;
/




/* 문제5.
    급여가  5000이하이면 20% 인상된 급여
    급여가 10000이하이면 15% 인상된 급여
    급여가 15000이하이면 10% 인상된 급여
    급여가 15001이상이면 급여 인상없음
    
    사원번호를 입력(치환변수)하면
    사원이름, 급여, 인상된 급여가 출력되도록 PL/SQL 블록을 생성하시오    */    
    
DECLARE
    v_name employees.last_name%TYPE;
    v_sal employees.salary%TYPE;
    v_commsal employees.salary%TYPE;
BEGIN
    SELECT last_name, salary
    INTO v_name, v_sal
    FROM employees
    WHERE employee_id = &사원번호;
    
    IF v_sal <=5000 THEN
        v_commsal := NVL(v_sal, 0) * 1.2;
    ELSIF v_sal <= 10000 THEN
        v_commsal := NVL(v_sal, 0) * 1.15;
    ELSIF v_sal <= 15000 THEN
        v_commsal := NVL(v_sal, 0) * 1.1;
    ELSE
        v_commsal := NVL(v_sal, 0);
    END IF;
    
    IF v_sal > 15000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' 사원의 급여는 ' || v_sal || '이며, 급여 인상은 없습니다.'); 
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name || ' 사원의 급여는 ' || v_sal || '이며, 인상된 급여는 ' || v_commsal); 
    END IF;
END;
/


--by 교수님
-- 입력하는 데이터에 잘 대응하도록 코드 짜라!
DECLARE
    v_ename employees.last_name%TYPE;
    v_sal employees.salary%TYPE;
    v_raise NUMBER(4, 1);
    v_result v_sal%TYPE; 
BEGIN
    SELECT last_name, salary
    INTO v_ename, v_sal
    FROM employees
    WHERE employee_id = &사원번호;
    
    IF v_sal <=5000 THEN
        v_raise := 20;
    ELSIF v_sal <= 10000 THEN
        v_raise := 15;
    ELSIF v_sal <= 15000 THEN
        v_raise := 10;
    ELSE
        v_raise := 0;
    END IF;
    
    v_result := (v_sal + v_sal * v_raise/100);
    
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('인상된 급여 : ' || v_result);
END;
/









-- 기본 LOOP문
DECLARE
    v_num NUMBER(38) := 0;
BEGIN
    LOOP
        v_num := v_num + 1;
        DBMS_OUTPUT.PUT_LINE(v_num);
        EXIT WHEN v_num >= 10; --종료조건
    END LOOP;
END;
/


-- WHILE LOOP문
DECLARE
    v_num NUMBER(38,0) := 10 ;
BEGIN
    WHILE v_num <5 LOOP --반복조건
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_num := v_num + 1;
    END LOOP;
END;
/


-- 예제 : 1에서 10까지 정수값의 합
-- 1) 기본 LOOP
DECLARE
    v_num NUMBER(2,0) := 1;
    v_sum NUMBER(2,0) := 0;
BEGIN
    LOOP
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
        EXIT WHEN v_num > 10;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/

-- 2) WHILE LOOP
DECLARE
    v_num NUMBER(2,0) := 1;
    v_sum NUMBER(2,0) := 0;
BEGIN
    WHILE v_num <= 10 LOOP --반복조건
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/





-- FOR LOOP
BEGIN
    FOR idx IN -10 .. 5 LOOP
        IF MOD(idx, 2) <>0 THEN
            DBMS_OUTPUT.PUT_LINE(idx);
        END IF;
    END LOOP;
END;
/


-- 주의사항
BEGIN
    FOR idx IN REVERSE (-10/2) .. 5 LOOP --(-10/2) 이렇게 해서라도 정수만 나오면 가능하다
        IF MOD(idx, 2) <>0 THEN
            DBMS_OUTPUT.PUT_LINE(idx);
        END IF;
    END LOOP;
END;
/

-- 주의사항 2) 카운터(counter)
DECLARE
    v_num NUMBER(2,0) := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_num);
    v_num := v_num * 2;
    DBMS_OUTPUT.PUT_LINE(v_num);
    DBMS_OUTPUT.PUT_LINE('=============================');
    FOR v_num IN 1 .. 10 LOOP
        --v_num := v_num * 2; -- 여기에 두면 오류난다! v_num 은 할당 대상으로 사용 불가능
        --v_num := 0; --오류! v_num 은 할당 대상으로 사용 불가능
        DBMS_OUTPUT.PUT_LINE(v_num);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_num); -- 0출력
END;
/








/*  예제 : 1에서 10까지 정수값의 합    
    3) FOR LOOP     */
DECLARE
    -- 정수값 : 1~10 => FOR LOOP의 카운터로 처리
    -- 합계
    v_total NUMBER(2, 0) := 0;    
BEGIN
    FOR num IN 1 .. 10 LOOP
        v_total := v_total + num;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(v_total);
END;
/






/*  LOOP들   */
/*  1. 다음과 같이 출력되도록 하시오.
*
**
***
****
*****
        */
        
DECLARE
    v_star VARCHAR2(50);
    v_count NUMBER(1) := 0;    
BEGIN  
    LOOP
        --CONCAT(v_star, '*');
        v_star := v_star || '*';
        v_count := v_count +1;
        DBMS_OUTPUT.PUT_LINE(v_star) ;
        EXIT WHEN v_count >= 5;
    END LOOP;
END;
/
        
        
        
DECLARE
    v_star VARCHAR2(50) := ''; --반드시 공백 선언!!! null은 오류 가능성 높다
BEGIN
    FOR i IN 1 .. 5 LOOP
        v_star := v_star || '*';
        DBMS_OUTPUT.PUT_LINE(v_star) ;
    END LOOP;
END;
/

-- By 교수님
BEGIN
    FOR counter IN 1 .. 5 LOOP
        FOR i IN 1..counter LOOP
            DBMS_OUTPUT.PUT('*'); --단독 사용 불가능, PUT을 사용하는 경우에는 반드시 마지막에 PUT_LINE 사용해줘야 함!!! PUT 권장 X
        END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
/


DECLARE
    v_star VARCHAR2(50);
    v_count NUMBER(1) := 0;    
BEGIN
    WHILE v_count < 5 LOOP
        v_star := v_star || '*';
        v_count := v_count +1;
        DBMS_OUTPUT.PUT_LINE(v_star) ;
    END LOOP;
END;
/
