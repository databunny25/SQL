--오라클 JOIN 左------------------------------------------------------------------
--오라클 JOIN--------------------------------------------------------------------------------------

select employee_id, last_name, department_id
from employees;

select last_name, department_name
from employees, departments; --Cartessian Product로 107*27로 2889개의 행을 반환

select COUNT(*)
from departments;


--Equi Join
select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

--똑같은 열 이름 없는 열은 테이블 접두어 생략도 가능하지만...접두어를 사용하여 성능 개선!!! (성능 위해 꼭 붙이자)
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

--오라클은 full outer join은 없대...
--right outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id; --사원이 없는 부서도 보겠다~

--left outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+); --부서에 소속되지 않는 사원도 보겠다~

select employee_id, last_name, manager_id
from employees;

--self join
select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;



--표준 조인 SQL-1999 조인 (ANSI JOIN)---------------------------------------------------------------------
--cross join
select last_name, department_name
from employees cross join departments; --카타시안 곱과 같은 결과
select last_name, department_name
from employees, departments; --오라클 카타시안 곱 (안씨에서는 안먹힘...)

--natural join
select department_id, department_name, city
from departments NATURAL JOIN locations;

desc departments;
desc locations; -- 두 테이블에서 동일한 이름의 열인 location_id를 기준으로 조인!....but 이런 식으로 안쓰기를 권장!

--USING절
--두 테이블에 동일한 이름의 칼럼이 2개 이상 있을때...USING절! (NATURAL JOIN과 USING 절은 서로 배타적
--USING(컬럼이름)의 컬럼이름에는 alias 쓸수없다!!!...두 테이블의 같은 이름 칼럼 지정한데, 특정 테이블의 열 지정하면 당연히 안되겠지...
select employee_id, last_name, location_id, department_id
from employees JOIN departments USING (department_id);


select l.city, d.department_name
from locations l JOIN departments d
    USING (location_id)
where d.location_id = 1400; --오류남! ,,,USING절 사용시 where절에도 컬럼 alias 쓰면 안됨!

select l.city, d.department_name
from locations l JOIN departments d
    USING (location_id)
where location_id = 1400; --이제 오류안남!

-- ON절 포함하는 join : 임의의 조건을 지정하거나 조인할 열을 지정하려면!
select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
from employees e 
    JOIN departments d ON (e.department_id = d.department_id);

--n개 테이블 조인 조건 n-1개!
select employee_id, city, department_name
from employees e
        JOIN departments d
            ON d.department_id = e.department_id
        JOIN locations l
            ON d.location_id = l.location_id;

--위 ansi조인을 오라클 조인으로 바꿔보자~            
select employee_id, city, department_name
from employees e, departments d, locations l
where d.department_id = e.department_id
AND d.location_id = l.location_id;


--(ansi) Outer Join
select e.last_name, e.department_id, d.department_name
from employees e LEFT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
--위를 오라클 조인으로 바꿔보자~
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);


select e.last_name, e.department_id, d.department_name
from employees e RIGHT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
--위 결과를 오라클 조인으로~
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where d.department_id = e.department_id(+);  --(+) 위치 주의하기!!!!      

--full Outer Join (오라클은 지원 안함~)
select e.last_name, e.department_id, d.department_name
from employees e FULL OUTER JOIN departments d
        ON (e.department_id = d.department_id);
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where d.department_id(+)= e.department_id(+);--오류난다 지원안하니깐.....   

------------------다시보기------------------------
--추가 조건! -> AND로 추가해줌
select e.last_name, e.department_id, d.department_name
from employees e JOIN departments d
        ON (e.department_id = d.department_id)
        AND e.manager_id= 149;
--추가 조건...where절에 추가해도 된다
select e.last_name, e.department_id, d.department_name
from employees e JOIN departments d
        ON (e.department_id = d.department_id)
where e.manager_id= 149;
-------------------다시보기-------------------



--과제 sql06--------------------------------------------------------------------------
--1. LOCATIONS 및 COUNTRIES 테이블을 사용하여 모든 부서의 주소를 생성하는 query를 작성하시오. 출력에 위치ID(location_id), 주소(street_address), 구/군(city), 시/도(state_province) 및 국가(country_name)를 표시하시오.
select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l, countries c
where l.country_id = c.country_id;

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l JOIN countries c ON l.country_id = c.country_id;

desc locations;
desc countries;

--2. 모든 사원의 이름, 소속 부서번호 및 부서 이름을 표시하는 query를 작성하시오.
select e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select e.last_name, d.department_id, d.department_name
from employees e 
    JOIN departments d ON e.department_id = d.department_id(+);

desc employees;
desc departments;
desc locations;

--3. Toronto에 근무하는 사원에 대한 보고서를 필요로 합니다. toronto에서 근무하는 모든 사원의 이름, 직무, 부서번호 및 부서 이름을 표시하시오.
select *
from locations;

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e, departments d, locations l
where e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND LOWER(l.city) = 'toronto';
    
-- 다시보기----------------------------------------------------------------------
select e.last_name, e.job_id, e.department_id, department_name
from employees e
    JOIN departments d
        ON e.department_id = d.department_id
    JOIN locations l
        ON d.location_id = l.location_id
where LOWER(l.city) = 'toronto'; 
--------------------------------------------------------------------------------


--4. 사원의 이름 및 사원 번호를 해당 관리자의 이름 및 관리자 번호와 함께 표시하는 보고서를 작성하는데, 열 레이블을 각각 Employee, Emp#, Manager 및 Mgr#으로 지정하시오.
desc employees;
desc departments;
desc locations;

select e.employee_id "Emp#", e.last_name "Employee", m.manager_id "Mgr#", m.last_name "Manager"
from employees e, employees m
where e.manager_id = m.employee_id;

select e.employee_id "Emp#", e.last_name "Employee", m.manager_id "Mgr#", m.last_name "Manager"
from employees e
    JOIN employees m ON e.manager_id = m.employee_id;

--5. King과 같이 해당 관리자가 지정되지 않은 사원도 표시하도록 4번 문장을 수정합니다. 사원 번호순으로 결과를 정렬하시오. 
select e.employee_id, e.last_name, m.manager_id, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id, e.last_name, m.manager_id, m.last_name
from employees e
    LEFT OUTER JOIN employees m ON e.manager_id = m.employee_id;

--6. 직무 등급 및 급여에 대한 보고서를 필요로 합니다. 먼저 JOB_GRADES 테이블의 구조를 표시한 다음 모든 사원의 이름, 직무, 부서 이름, 급여 및 등급을 표시하는 query를 작성하시오.
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



--서브쿼리-----------------------------------------------------------------------------

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
                where last_name = 'Abel'); --Abel 11000 이래....

--두개 비교하기----------------------------------                
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

--Taylor와 같은 직무이며 급여 더 높은 사람
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




--과제 sql07 숙제!!!!!!----------------------------------------------------------------
--1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하시오. Zlotkey는 결과에서 제외하시오.
select last_name, hire_date
from employees
where department_id = (select department_id
                       from employees
                       where lower(last_name) = 'zlotkey')
    AND last_name <> 'Zlotkey';

desc employees;
select *
from employees;

--2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 결과를 급여에 대해 오름차순으로 정렬하시오.
select employee_id, last_name
from employees
where salary > (select avg(salary)
                from employees)
order by salary;


--3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 질의를 실행하시오.
select employee_id, last_name
from employees
where department_id IN (select department_id
                       from employees
                       where lower(last_name) LIKE '%u%'); --다중행 서브쿼리! (IN, ANY, ALL, SOME 생각하자...)


--4. 부서 위치 ID(location_id)가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하시오.
desc employees;
select *
from departments;

select last_name, department_id, job_id
from employees
where  department_id IN (select department_id
                         from departments
                         where location_id = 1700);


--5. King에게 보고하는(manager가 King) 모든 사원의 이름과 급여를 표시하시오.
select last_name, salary, manager_id
from employees
where manager_id IN (select employee_id
                    from employees
                    where UPPER(last_name) = 'KING');
 
--6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하시오.
select department_id, last_name, job_id
from employees
where department_id = (select department_id
                       from departments
                       where LOWER(department_name) = 'executive');
                       
--7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는 모든 사원의 사원 번호, 이름 및 급여를 표시하시오.
select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
AND department_id IN (select department_id
                      from employees
                      where lower(last_name) LIKE '%u%');
--중의적 의미?      
select employee_id, last_name, salary
from employees
where department_id IN (select department_id    
                        from employees
                        where salary > (select avg(salary)
                                        from employees
                                        where lower(last_name) LIKE '%u%'); --당연히 안되겠지...
          
       
       
                      
                      
                      