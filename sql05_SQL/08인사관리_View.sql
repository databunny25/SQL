--< VIEW > ==========================================================================

--뷰 이용해서 서브쿼리로 만들어놓으면 쉽게 쿼리 작성 가능하고, 사용자가 데이터에 엑세스하는것을 제한도 가능~
--뷰 생성
create view empvu80
    as select employee_id, last_name, salary
       from employees
       where department_id = 80;
 
--뷰 조회      
select *
from empvu80; --마치 테이블처럼 조회~


--뷰 칼럼에 alias 지정하기 
create view salvu50
    as select employee_id ID_NUMBER, last_name NAME, salary*12 ANN_SALARY
       from employees
       where department_id = 50;
       
select *
from salvu50;


--뷰 수정 (수정불가...or replace로 새로 만들어줌!)

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



--뷰를 통한 데이터 조작---------------------------------------------------------------------
select rownum, employee_id
from employees;


COMMIT;

select *
from empvu80;

delete empvu80
where id_number = 176; --삭제됨

select *
from empvu80;

select *
from employees; --176번 사원 없다!!!!!! 뷰를 통해 원본 데이터 삭제! (뷰에서 지워서 원본 데이터 삭제!)



select *
from dept_sum_vu;

delete dept_sum_vu
where name = 'IT';  --오류 (데이터 조작 못함) cf) 뷰 안에 그룹함수(SUM등)이 들어있기 때문에 뷰를 통한 delete 불가능!!!



create view test_vu
as
    select department_name
    from departments;
    
select *
from test_vu;

insert into test_vu
values ('YD'); --오류! 원본의 departmetn_id는 PK 이므로 null값 못 들어감 (뷰에 없다 하더라도 뷰를 통해 원본 데이터에 삽입하는 것이므로)





--WITH CHECK 옵션 --------------------------------------------------------------------
-- 잘 모르겠네ㅜㅜ?




