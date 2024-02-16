--<DDL>====================================================================================

--데이터 딕셔너리--------------------------------------------------------------------다시보기!
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
values (35); --id만 입력했지만 hire_date칼럼에 자동으로 sysdate가 입력된다!

insert into hire_dates
values (45, NULL); --sysdate가 아니라 null이 들어감!

create table dept
    (deptno NUMBER(2),
     dname VARCHAR2(14),
     loc varchar2(13),
     create_date DATE DEFAULT sysdate);
     
select table_name
from user_tables; --데이터 딕셔너리에서 내가 만든 테이블 확인


--서브쿼리로 테이블 만들기!-----------------------------------------------------------
create table dept80
    as
        select employee_id, last_name, salary*12 ANNSAL, hire_date --수식(salary*12)이 들어가는 경우에는 반드시 컬럼 alias 써줘야함!!
        from employees
        where department_id = 80;
        
desc dept80;



-- ALTER -------------------------------------------------------------------------
--ADD--
alter table dept80
ADD (job_id varchar2(9)); --새로 추가된 컬럼은 무조건 맨 뒤에 갖다 붙음, 값 없으니까 null

select *
from dept80;

alter table dept80
add (hdate DATE DEFAULT sysdate); --defalut넣으니까 기존에 있던 데이터도 전부 sysdate 들어가있음! (Tip)처음에 널로 넣지말고...default해서 add로 다 넣은 다음 다음에 modify로 바꿔주면 된다~



--MODIFY--
alter table dept80
modify (last_name varchar2(30));

alter table dept80
modify (last_name varchar2(10)); --10으로 줄이는것도 되네?

alter table dept80
modify (last_name varchar2(5)); --5로 줄이는 건 안되네? 이미 있는 데이터보다 작게 줄이는건 불가능!

alter table dept80
modify (job_id NUMBER(10)); --원래 VARCHAR2였는데 NUMBER 타입으로 바꿈

alter table dept80
modify (last_name NUMBER(15)); --last_name은 문자형이 들어있으므로 NUMBER타입으로 바꿀수 없다!



--DROP--

alter table dept80
drop (job_id); --job_id 칼럼 삭제

alter table dept80
set unused (last_name);

select *
from dept80; --last_name 안보임! 실제로 삭제된건 아님

alter table dept80
drop unused columns; --set unused된 칼럼 모두 삭제됨!

