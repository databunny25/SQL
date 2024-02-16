--����Ŭ JOIN �------------------------------------------------------------------
--����Ŭ JOIN--------------------------------------------------------------------------------------

select employee_id, last_name, department_id
from employees;

select last_name, department_name
from employees, departments; --Cartessian Product�� 107*27�� 2889���� ���� ��ȯ

select COUNT(*)
from departments;


--Equi Join
select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

--�Ȱ��� �� �̸� ���� ���� ���̺� ���ξ� ������ ����������...���ξ ����Ͽ� ���� ����!!! (���� ���� �� ������)
select employee_id, last_name, e.department_id, d.department_id, location_id, department_name
from employees e, departments d
where e.department_id = d.department_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id = l.location_id AND d.department_id IN(20,50);


-- Non_Equi JOIN~
select *
from job_grades;

select e.last_name, e.salary, j.grade_level
from employees e, job_grades j
where e.salary
      BETWEEN j.lowest_sal AND j.highest_sal;

      
--Outer Join

--����Ŭ�� full outer join�� ����...
--right outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id; --����� ���� �μ��� ���ڴ�~

--left outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+); --�μ��� �Ҽӵ��� �ʴ� ����� ���ڴ�~

select employee_id, last_name, manager_id
from employees;

--self join
select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;



--ǥ�� ���� SQL-1999 ���� (ANSI JOIN)---------------------------------------------------------------------
--cross join
select last_name, department_name
from employees cross join departments; --īŸ�þ� ���� ���� ���
select last_name, department_name
from employees, departments; --����Ŭ īŸ�þ� �� (�Ⱦ������� �ȸ���...)

--natural join
select department_id, department_name, city
from departments NATURAL JOIN locations;

desc departments;
desc locations; -- �� ���̺��� ������ �̸��� ���� location_id�� �������� ����!....but �̷� ������ �Ⱦ��⸦ ����!

--USING��
--�� ���̺� ������ �̸��� Į���� 2�� �̻� ������...USING��! (NATURAL JOIN�� USING ���� ���� ��Ÿ��
--USING(�÷��̸�)�� �÷��̸����� alias ��������!!!...�� ���̺��� ���� �̸� Į�� �����ѵ�, Ư�� ���̺��� �� �����ϸ� �翬�� �ȵǰ���...
select employee_id, last_name, location_id, department_id
from employees JOIN departments USING (department_id);


select l.city, d.department_name
from locations l JOIN departments d
    USING (location_id)
where d.location_id = 1400; --������! ,,,USING�� ���� where������ �÷� alias ���� �ȵ�!

select l.city, d.department_name
from locations l JOIN departments d
    USING (location_id)
where location_id = 1400; --���� �����ȳ�!

-- ON�� �����ϴ� join : ������ ������ �����ϰų� ������ ���� �����Ϸ���!
select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
from employees e 
    JOIN departments d ON (e.department_id = d.department_id);

--n�� ���̺� ���� ���� n-1��!
select employee_id, city, department_name
from employees e
        JOIN departments d
            ON d.department_id = e.department_id
        JOIN locations l
            ON d.location_id = l.location_id;

--�� ansi������ ����Ŭ �������� �ٲ㺸��~            
select employee_id, city, department_name
from employees e, departments d, locations l
where d.department_id = e.department_id
AND d.location_id = l.location_id;


--(ansi) Outer Join
select e.last_name, e.department_id, d.department_name
from employees e LEFT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
--���� ����Ŭ �������� �ٲ㺸��~
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);


select e.last_name, e.department_id, d.department_name
from employees e RIGHT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
--�� ����� ����Ŭ ��������~
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where d.department_id = e.department_id(+);  --(+) ��ġ �����ϱ�!!!!      

--full Outer Join (����Ŭ�� ���� ����~)
select e.last_name, e.department_id, d.department_name
from employees e FULL OUTER JOIN departments d
        ON (e.department_id = d.department_id);
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where d.department_id(+)= e.department_id(+);--�������� �������ϴϱ�.....   

------------------�ٽú���------------------------
--�߰� ����! -> AND�� �߰�����
select e.last_name, e.department_id, d.department_name
from employees e JOIN departments d
        ON (e.department_id = d.department_id)
        AND e.manager_id= 149;
--�߰� ����...where���� �߰��ص� �ȴ�
select e.last_name, e.department_id, d.department_name
from employees e JOIN departments d
        ON (e.department_id = d.department_id)
where e.manager_id= 149;
-------------------�ٽú���-------------------



--���� sql06--------------------------------------------------------------------------
--1. LOCATIONS �� COUNTRIES ���̺��� ����Ͽ� ��� �μ��� �ּҸ� �����ϴ� query�� �ۼ��Ͻÿ�. ��¿� ��ġID(location_id), �ּ�(street_address), ��/��(city), ��/��(state_province) �� ����(country_name)�� ǥ���Ͻÿ�.
select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l, countries c
where l.country_id = c.country_id;

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l JOIN countries c ON l.country_id = c.country_id;

desc locations;
desc countries;

--2. ��� ����� �̸�, �Ҽ� �μ���ȣ �� �μ� �̸��� ǥ���ϴ� query�� �ۼ��Ͻÿ�.
select e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select e.last_name, d.department_id, d.department_name
from employees e 
    JOIN departments d ON e.department_id = d.department_id(+);

desc employees;
desc departments;
desc locations;

--3. Toronto�� �ٹ��ϴ� ����� ���� ������ �ʿ�� �մϴ�. toronto���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ� �̸��� ǥ���Ͻÿ�.
select *
from locations;

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e, departments d, locations l
where e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND LOWER(l.city) = 'toronto';
    
-- �ٽú���----------------------------------------------------------------------
select e.last_name, e.job_id, e.department_id, department_name
from employees e
    JOIN departments d
        ON e.department_id = d.department_id
    JOIN locations l
        ON d.location_id = l.location_id
where LOWER(l.city) = 'toronto'; 
--------------------------------------------------------------------------------


--4. ����� �̸� �� ��� ��ȣ�� �ش� �������� �̸� �� ������ ��ȣ�� �Բ� ǥ���ϴ� ������ �ۼ��ϴµ�, �� ���̺��� ���� Employee, Emp#, Manager �� Mgr#���� �����Ͻÿ�.
desc employees;
desc departments;
desc locations;

select e.employee_id "Emp#", e.last_name "Employee", m.manager_id "Mgr#", m.last_name "Manager"
from employees e, employees m
where e.manager_id = m.employee_id;

select e.employee_id "Emp#", e.last_name "Employee", m.manager_id "Mgr#", m.last_name "Manager"
from employees e
    JOIN employees m ON e.manager_id = m.employee_id;

--5. King�� ���� �ش� �����ڰ� �������� ���� ����� ǥ���ϵ��� 4�� ������ �����մϴ�. ��� ��ȣ������ ����� �����Ͻÿ�. 
select e.employee_id, e.last_name, m.manager_id, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id, e.last_name, m.manager_id, m.last_name
from employees e
    LEFT OUTER JOIN employees m ON e.manager_id = m.employee_id;

--6. ���� ��� �� �޿��� ���� ������ �ʿ�� �մϴ�. ���� JOB_GRADES ���̺��� ������ ǥ���� ���� ��� ����� �̸�, ����, �μ� �̸�, �޿� �� ����� ǥ���ϴ� query�� �ۼ��Ͻÿ�.
desc job_grades;
select *
from job_grades;
desc employees;

select e.last_name, d.department_name, e.salary, j.grade_level
from employees e, job_grades j, departments d
where e.department_id = d.department_id
    AND e.salary BETWEEN j.lowest_sal AND j.highest_sal;

select e.last_name, d.department_name, e.salary, j.grade_level
from employees e 
    JOIN departments d
        ON e.department_id = d.department_id
    JOIN job_grades j
        ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;



--��������-----------------------------------------------------------------------------

select last_name, salary
from employees
where salary IN(select MAX(salary)
                from employees
                GROUP BY department_id);
                
select MAX(salary)
from employees
GROUP BY department_id;

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel'); --Abel 11000 �̷�....

--�ΰ� ���ϱ�----------------------------------                
select employee_id, last_name, job_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)
AND employee_id !=141;

select employee_id, last_name, job_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141);
--------------------------------------------------

--Taylor�� ���� �����̸� �޿� �� ���� ���
select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Abel')
AND salary > (select salary
              from employees
              where last_name = 'Abel');
              
select *
from employees
where last_name = 'Taylor';




--���� sql07 ����!!!!!!----------------------------------------------------------------
--1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�. Zlotkey�� ������� �����Ͻÿ�.
select last_name, hire_date
from employees
where department_id = (select department_id
                       from employees
                       where lower(last_name) = 'zlotkey')
    AND last_name <> 'Zlotkey';

desc employees;
select *
from employees;

--2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� ����� �޿��� ���� ������������ �����Ͻÿ�.
select employee_id, last_name
from employees
where salary > (select avg(salary)
                from employees)
order by salary;


--3. �̸��� u�� ���Ե� ����� ���� �μ����� ���ϴ� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� ���Ǹ� �����Ͻÿ�.
select employee_id, last_name
from employees
where department_id IN (select department_id
                       from employees
                       where lower(last_name) LIKE '%u%'); --������ ��������! (IN, ANY, ALL, SOME ��������...)


--4. �μ� ��ġ ID(location_id)�� 1700�� ��� ����� �̸�, �μ� ��ȣ �� ���� ID�� ǥ���Ͻÿ�.
desc employees;
select *
from departments;

select last_name, department_id, job_id
from employees
where  department_id IN (select department_id
                         from departments
                         where location_id = 1700);


--5. King���� �����ϴ�(manager�� King) ��� ����� �̸��� �޿��� ǥ���Ͻÿ�.
select last_name, salary, manager_id
from employees
where manager_id IN (select employee_id
                    from employees
                    where UPPER(last_name) = 'KING');
 
--6. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻÿ�.
select department_id, last_name, job_id
from employees
where department_id = (select department_id
                       from departments
                       where LOWER(department_name) = 'executive');
                       
--7. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���Ͻÿ�.
select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
AND department_id IN (select department_id
                      from employees
                      where lower(last_name) LIKE '%u%');
--������ �ǹ�?      
select employee_id, last_name, salary
from employees
where department_id IN (select department_id    
                        from employees
                        where salary > (select avg(salary)
                                        from employees
                                        where lower(last_name) LIKE '%u%'); --�翬�� �ȵǰ���...
          
       
       
                      
                      
                      