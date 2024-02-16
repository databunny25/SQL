--<DML>--------------------------------------------------------------------------
--cre_hrdata.sql 파일 열어서 실행해줘야 원활한 실습 가능!
--INSERT ----------------------------------------------------------------------------------------------------------
insert into departments(department_id, department_name, manager_id, location_id)
values (370, 'Public Relations', 100, 1700);

select *
from departments;

insert into departments --모든 칼럼에 데이터 입력시에는 insert into 테이블 뒤에 컬럼명 입력 안해도됨!
values (371, 'Public Relations', 100, 1700);

--암시적 null삽입
insert into departments (department_id, department_name) --나머지 컬럼은 암시적으로 null
values (330, 'Purchasing'); 

--명시적 null삽입
insert into departments
values (400, 'Finance', NULL, NULL); --'null'은 null이란 문자 데이터 입력되니까 주의!!!

--SYSDATE 입력
insert into employees --hire_date에 SYSDATE 입력해서 오늘 날짜가 뜬다!
values (113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);

select *
from employees;

-- TO_DATE 함수 이용해서 날짜 입력
insert into employees
values (114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561', TO_DATE('FEB 3, 1999', 'MON DD, YYYY'), 'SA_REP', 11000, 0.2, 100, 60);

--NULL값 입력하는 두가지 방법 1) NULL 2) ''
insert into departments
values (100, 'Finance', '', '');

--치환변수 이용해서 반복적으로 값 insert
insert into departments (department_id, department_name, location_id)
values (&department_id, '&department_name', &location);




--INSERT절에 Subquery 쓰는 경우 (다른 테이블의 데이터를 가져와서 복사해서 삽입하겠다!)
--(sales_reps.sql 파일 실행)

select *
from sales_reps;

select *
from copy_emp;

INSERT INTO sales_reps (id, name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id LIKE '%REP%';

INSERT INTO copy_emp
    select *
    from employees;

--INSERT 구문에서 오류를 일으키는 경우
INSERT INTO departments(department_name)
values ('Yedam'); --DEPARTMENT_ID(PK) 칼럼은 NOT NULL이므로!!! 오류

INSERT INTO departments(department_id, department_name)
values (10,'Yedam'); --unique constraint (HR.DEPT_ID_PK) ...DEPARTMENT_ID는 PK이므로 unique해야함

INSERT INTO departments(department_id, department_name)
values (120,'Yedam'); -- 이제 가능(null아니고 unique하게 삽입했으므로)

INSERT INTO departments(department_id)
VALUES (130); --department_name은 NOT NULL이므로 오류!

INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 1); --integrity constraint (HR.DEPT_MGR_FK) violated - parent key not found....manager_id(FK)는 employee테이블의 부모키를 참조한다. 부모키에 1이 없는데 입력하려 했으므로 오류!

INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 100); --이제 가능







--UPDATE --------------------------------------------------------------------------------

UPDATE employees
SET department_id = 50
where employee_id = 113;

select *
from employees;

UPDATE employees
SET department_id = 51
where employee_id = 113; --integrity constraint... department_id 의 부모키에 51이 없다

UPDATE copy_emp
SET department_id = 110; --department_id 가 전부 110으로 바뀌어버림...where절 중요!

select *
from copy_emp;

--여러칼럼 한번에 수정...set절에 ,로 여러개 나열하면 됨!
update employees
set job_id = 'IT_PROG', commission_pct = NULL
where employee_id = 114;

--UPDATE 문에 서브쿼리 사용하기...그대로 set에다 타 테이블에서 끌어온 값 넣어주면 됨!
--쌍비교도 가능


ROLLBACK;

select *
from copy_emp;






-- DELETE ---------------------------------------------------------------------------------------------
DELETE employees; --참조무결성 제약...자식키가 참조중이라 삭제 불가능

INSERT INTO copy_emp
    select *
    from employees;
    
select *
from copy_emp;

COMMIT;

DELETE copy_emp;

ROLLBACK; --이제 copy_emp테이블 데이터 삽입된채로 다 살아있다!
--DML(delete), DDL(truncate) 비교....DML은 롤백가능, DDL은 롤백불가능!



DELETE from departments
where department_name = 'Finance';

select *
from departments;

delete from departments
where department_id IN (30, 40);

select *
from departments;

ROLLBACK;

--delete와 truncate 비교!-------------------
select *
from copy_emp; --데이터 확인

DELETE copy_emp;

select * 
from copy_emp; -- 다 날아감

ROLLBACK;

select * 
from copy_emp; --롤백하니까 다 살아남! delete는 DML이므로!

TRUNCATE TABLE copy_emp;

select *
from copy_emp;

ROLLBACK;

select *
from copy_emp; --TRUNCATE는 롤백해도 안 살아남!!! DDL!





--과제 sql08-------------------------------------------------------------------------
--1.
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));
   
--2
desc my_employee;

--3 INSERT는 한번에 하나만 가능하다!
insert into my_employee
values (1, 'Pastel', 'Ralph', 'Rpatel', 895);

insert into my_employee
values (2, 'Dancs', 'Betty', ' Bdancs', 860);

insert into my_employee
values (3, 'Biri', 'Ben', 'Bbiri', 1100);

--4
select *
from my_employee;

--6
update my_employee
set last_name = 'Drexler'
where id = 3;

--7
update my_employee
set salary = 1000
where salary < 900;

select *
from my_employee;

--8
delete from my_employee
where id = 3;

select *
from my_employee;

--11
delete from my_employee;
truncate table my_employee;

select *
from my_employee;
--------------------------------------------------------------------------------------


