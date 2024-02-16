--<DML>--------------------------------------------------------------------------
--cre_hrdata.sql ���� ��� ��������� ��Ȱ�� �ǽ� ����!
--INSERT ----------------------------------------------------------------------------------------------------------
insert into departments(department_id, department_name, manager_id, location_id)
values (370, 'Public Relations', 100, 1700);

select *
from departments;

insert into departments --��� Į���� ������ �Է½ÿ��� insert into ���̺� �ڿ� �÷��� �Է� ���ص���!
values (371, 'Public Relations', 100, 1700);

--�Ͻ��� null����
insert into departments (department_id, department_name) --������ �÷��� �Ͻ������� null
values (330, 'Purchasing'); 

--����� null����
insert into departments
values (400, 'Finance', NULL, NULL); --'null'�� null�̶� ���� ������ �ԷµǴϱ� ����!!!

--SYSDATE �Է�
insert into employees --hire_date�� SYSDATE �Է��ؼ� ���� ��¥�� ���!
values (113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);

select *
from employees;

-- TO_DATE �Լ� �̿��ؼ� ��¥ �Է�
insert into employees
values (114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561', TO_DATE('FEB 3, 1999', 'MON DD, YYYY'), 'SA_REP', 11000, 0.2, 100, 60);

--NULL�� �Է��ϴ� �ΰ��� ��� 1) NULL 2) ''
insert into departments
values (100, 'Finance', '', '');

--ġȯ���� �̿��ؼ� �ݺ������� �� insert
insert into departments (department_id, department_name, location_id)
values (&department_id, '&department_name', &location);




--INSERT���� Subquery ���� ��� (�ٸ� ���̺��� �����͸� �����ͼ� �����ؼ� �����ϰڴ�!)
--(sales_reps.sql ���� ����)

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

--INSERT �������� ������ ����Ű�� ���
INSERT INTO departments(department_name)
values ('Yedam'); --DEPARTMENT_ID(PK) Į���� NOT NULL�̹Ƿ�!!! ����

INSERT INTO departments(department_id, department_name)
values (10,'Yedam'); --unique constraint (HR.DEPT_ID_PK) ...DEPARTMENT_ID�� PK�̹Ƿ� unique�ؾ���

INSERT INTO departments(department_id, department_name)
values (120,'Yedam'); -- ���� ����(null�ƴϰ� unique�ϰ� ���������Ƿ�)

INSERT INTO departments(department_id)
VALUES (130); --department_name�� NOT NULL�̹Ƿ� ����!

INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 1); --integrity constraint (HR.DEPT_MGR_FK) violated - parent key not found....manager_id(FK)�� employee���̺��� �θ�Ű�� �����Ѵ�. �θ�Ű�� 1�� ���µ� �Է��Ϸ� �����Ƿ� ����!

INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 100); --���� ����







--UPDATE --------------------------------------------------------------------------------

UPDATE employees
SET department_id = 50
where employee_id = 113;

select *
from employees;

UPDATE employees
SET department_id = 51
where employee_id = 113; --integrity constraint... department_id �� �θ�Ű�� 51�� ����

UPDATE copy_emp
SET department_id = 110; --department_id �� ���� 110���� �ٲ�����...where�� �߿�!

select *
from copy_emp;

--����Į�� �ѹ��� ����...set���� ,�� ������ �����ϸ� ��!
update employees
set job_id = 'IT_PROG', commission_pct = NULL
where employee_id = 114;

--UPDATE ���� �������� ����ϱ�...�״�� set���� Ÿ ���̺��� ����� �� �־��ָ� ��!
--�ֺ񱳵� ����


ROLLBACK;

select *
from copy_emp;






-- DELETE ---------------------------------------------------------------------------------------------
DELETE employees; --�������Ἲ ����...�ڽ�Ű�� �������̶� ���� �Ұ���

INSERT INTO copy_emp
    select *
    from employees;
    
select *
from copy_emp;

COMMIT;

DELETE copy_emp;

ROLLBACK; --���� copy_emp���̺� ������ ���Ե�ä�� �� ����ִ�!
--DML(delete), DDL(truncate) ��....DML�� �ѹ鰡��, DDL�� �ѹ�Ұ���!



DELETE from departments
where department_name = 'Finance';

select *
from departments;

delete from departments
where department_id IN (30, 40);

select *
from departments;

ROLLBACK;

--delete�� truncate ��!-------------------
select *
from copy_emp; --������ Ȯ��

DELETE copy_emp;

select * 
from copy_emp; -- �� ���ư�

ROLLBACK;

select * 
from copy_emp; --�ѹ��ϴϱ� �� ��Ƴ�! delete�� DML�̹Ƿ�!

TRUNCATE TABLE copy_emp;

select *
from copy_emp;

ROLLBACK;

select *
from copy_emp; --TRUNCATE�� �ѹ��ص� �� ��Ƴ�!!! DDL!





--���� sql08-------------------------------------------------------------------------
--1.
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));
   
--2
desc my_employee;

--3 INSERT�� �ѹ��� �ϳ��� �����ϴ�!
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


