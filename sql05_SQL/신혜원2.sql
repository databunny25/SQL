--1
select *
from employees;

select employee_id, last_name, salary, department_id
from employees
where salary between 7000 and 12000
    and UPPER(last_name) like 'H%';
    
--2
select employee_id, last_name,
       TO_CHAR(hire_date, 'MM/DD/YYYY DAY') "입사일",
       TO_CHAR(salary*commission_pct, '$99,999.00') "수당"
from employees
order by 4 desc;

--3
select employee_id, last_name, job_id, salary, department_id
from employees
where department_id IN (50, 60)
    and salary > 5000;

--4
select employee_id, last_name, department_id,
       DECODE (department_id, 20, 'Canada',
                              80, 'UK',
                                  'USA') as "근무지역"
from employees;

--5
select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

--6
select last_name, hire_date,
       CASE when hire_date >= '05/01/01' then 'New employee'
            else 'Career employee'
            end "사원구분"
from employees
where employee_id = &employee_num;

--7 
select last_name, salary,
       CASE when salary <= 5000 then TO_CHAR(salary*1.2)
            when salary <= 10000 then TO_CHAR(salary*1.15)
            when salary <= 15000 then TO_CHAR(salary*1.1)
            else '급여 인상없음'
            END "인상된 급여"
from employees
where employee_id = &employee_num;

--8
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id = l.location_id;
    
    
--9
select employee_id, last_name, job_id
from employees
where department_id = (select department_id
                       from departments
                       where UPPER(department_name) = 'IT');
                       
--10
select department_id, count(employee_id) "부서별 근무인원수", round(avg(salary)) "평균급여"
from employees
group by department_id;

--11
create table prof
    (PROFNO number(4),
     NAME   varchar2(15) not null,
     ID     varchar2(15) not null,
     HIREDATE  date,
     PAY    number(4));
     
--12.(1)
select *
from prof;

insert into prof
values (1001, 'Mark', 'm1001', '07/03/01', 800);

insert into prof (PROFNO, NAME, ID, HIREDATE)
values (1003, 'Adam', 'a1003', '11/03/02');

COMMIT;

--12.(2)
update prof
set pay = 1200
where profno = 1001;

--12.(3)
delete from prof
where profno = 1003;

--13.(1)
alter table prof
add CONSTRAINT PROF_NO_PK PRIMARY KEY(profno);

desc prof;

--13.(2)
alter table prof
ADD (GENDER CHAR(3));

--13.(3)
alter table prof
modify (NAME VARCHAR2(30));

--14.(1)
create view PROF_VU
    as select profno PNO, name PNAME, ID
       from prof;
       
select *
from prof_vu;

--14.(2)
create or replace view PROF_VU(PNO, PNAME, ID, HIREDATE)
    as select profno, name, ID, HIREDATE
       from prof;

--15.(1)
drop table prof PURGE;

--15.(2)
select *
from user_catalog;

