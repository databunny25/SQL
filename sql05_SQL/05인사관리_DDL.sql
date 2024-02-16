--<DDL>====================================================================================

--������ ��ųʸ�--------------------------------------------------------------------�ٽú���!
select table_name
from user_tables;

select distinct object_type
from user_objects;

select *
from user_catalog;


-- CREATE -------------------------------------------------------------------------
CREATE TABLE hire_dates
        (id NUMBER(8),
         hire_date DATE DEFAULT SYSDATE);
         
select *
from hire_dates;

insert into hire_dates(id)
values (35); --id�� �Է������� hire_dateĮ���� �ڵ����� sysdate�� �Էµȴ�!

insert into hire_dates
values (45, NULL); --sysdate�� �ƴ϶� null�� ��!

create table dept
    (deptno NUMBER(2),
     dname VARCHAR2(14),
     loc varchar2(13),
     create_date DATE DEFAULT sysdate);
     
select table_name
from user_tables; --������ ��ųʸ����� ���� ���� ���̺� Ȯ��


--���������� ���̺� �����!-----------------------------------------------------------
create table dept80
    as
        select employee_id, last_name, salary*12 ANNSAL, hire_date --����(salary*12)�� ���� ��쿡�� �ݵ�� �÷� alias �������!!
        from employees
        where department_id = 80;
        
desc dept80;



-- ALTER -------------------------------------------------------------------------
--ADD--
alter table dept80
ADD (job_id varchar2(9)); --���� �߰��� �÷��� ������ �� �ڿ� ���� ����, �� �����ϱ� null

select *
from dept80;

alter table dept80
add (hdate DATE DEFAULT sysdate); --defalut�����ϱ� ������ �ִ� �����͵� ���� sysdate ������! (Tip)ó���� �η� ��������...default�ؼ� add�� �� ���� ���� ������ modify�� �ٲ��ָ� �ȴ�~



--MODIFY--
alter table dept80
modify (last_name varchar2(30));

alter table dept80
modify (last_name varchar2(10)); --10���� ���̴°͵� �ǳ�?

alter table dept80
modify (last_name varchar2(5)); --5�� ���̴� �� �ȵǳ�? �̹� �ִ� �����ͺ��� �۰� ���̴°� �Ұ���!

alter table dept80
modify (job_id NUMBER(10)); --���� VARCHAR2���µ� NUMBER Ÿ������ �ٲ�

alter table dept80
modify (last_name NUMBER(15)); --last_name�� �������� ��������Ƿ� NUMBERŸ������ �ٲܼ� ����!



--DROP--

alter table dept80
drop (job_id); --job_id Į�� ����

alter table dept80
set unused (last_name);

select *
from dept80; --last_name �Ⱥ���! ������ �����Ȱ� �ƴ�

alter table dept80
drop unused columns; --set unused�� Į�� ��� ������!

