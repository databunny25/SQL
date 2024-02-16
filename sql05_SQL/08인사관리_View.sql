--< VIEW > ==========================================================================

--�� �̿��ؼ� ���������� ���������� ���� ���� �ۼ� �����ϰ�, ����ڰ� �����Ϳ� �������ϴ°��� ���ѵ� ����~
--�� ����
create view empvu80
    as select employee_id, last_name, salary
       from employees
       where department_id = 80;
 
--�� ��ȸ      
select *
from empvu80; --��ġ ���̺�ó�� ��ȸ~


--�� Į���� alias �����ϱ� 
create view salvu50
    as select employee_id ID_NUMBER, last_name NAME, salary*12 ANN_SALARY
       from employees
       where department_id = 50;
       
select *
from salvu50;


--�� ���� (�����Ұ�...or replace�� ���� �������!)

create or replace view empvu80(id_number, name, sal, department_id)
    as select employee_id, first_name || ' ' || last_name, salary, department_id
       from employees
       where department_id = 80;
       
select *
from empvu80;


--
create or replace view dept_sum_vu (name, minsal, maxsal, avgsal)
                    as select d.department_name, MIN(e.salary), MAX(e.salary), AVG(e.salary)
                       from employees e JOIN departments d
                       on (e.department_id = d.department_id)
                       group by d.department_name;
                       
select *
from dept_sum_vu;



--�並 ���� ������ ����---------------------------------------------------------------------
select rownum, employee_id
from employees;


COMMIT;

select *
from empvu80;

delete empvu80
where id_number = 176; --������

select *
from empvu80;

select *
from employees; --176�� ��� ����!!!!!! �並 ���� ���� ������ ����! (�信�� ������ ���� ������ ����!)



select *
from dept_sum_vu;

delete dept_sum_vu
where name = 'IT';  --���� (������ ���� ����) cf) �� �ȿ� �׷��Լ�(SUM��)�� ����ֱ� ������ �並 ���� delete �Ұ���!!!



create view test_vu
as
    select department_name
    from departments;
    
select *
from test_vu;

insert into test_vu
values ('YD'); --����! ������ departmetn_id�� PK �̹Ƿ� null�� �� �� (�信 ���� �ϴ��� �並 ���� ���� �����Ϳ� �����ϴ� ���̹Ƿ�)





--WITH CHECK �ɼ� --------------------------------------------------------------------
-- �� �𸣰ڳפ̤�?




