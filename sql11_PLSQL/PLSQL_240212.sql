/* 240213 sql 테스트 */

--6
CREATE TABLE department (
                         deptid NUMBER(10) NOT NULL PRIMARY KEY,
                         deptname VARCHAR2(10),
                         location VARCHAR2(10),
                         tel VARCHAR2(15)
                         );
    
desc department;

drop table department;

CREATE TABLE employee
    (empid NUMBER(10) NOT NULL PRIMARY KEY,
     empname VARCHAR2(10),
     hiredate DATE,
     addr VARCHAR2(12),
     tel VARCHAR2(15),
     -- deptid NUMBER(10) REFERENCES department(deptid)
     deptid NUMBER(10),
     CONSTRAINT emp_dept_deptid_fk FOREIGN KEY (deptid) REFERENCES department(deptid)
     );
     
drop table employee;

desc employee;





-- 7
ALTER TABLE employee
ADD (birthday DATE);

--제약조건은 수정이 없다! only 추가/삭제(drop/add)




--8
insert into department (deptid,
                        deptname,
                        location,
                        tel)
values (1001,
        '총무팀',
        '본101호',
        '053-777-8777');

insert into department (deptid,
                        deptname,
                        location,
                        tel)
values (1002,
        '회계팀',
        '본102호',
        '053-888-9999');
        
insert into department (deptid,
                        deptname,
                        location,
                        tel)
values (1003,
        '영업팀',
        '본103호',
        '053-222-3333');

insert into employee (empid,
                      empname,
                      hiredate,
                      addr,
                      tel,
                      deptid)
values ( 20121945,
         '박민수',
         TO_DATE('12/03/02', 'YY/MM/DD'), --TO_DATE(char [, 'format_model'])
         '대구',
         '010-1111-1234',
         1001);
         
insert into employee (empid,
                      empname,
                      hiredate,
                      addr,
                      tel,
                      deptid)
values ( 20101817,
         '박준식',
         '20100901',
         '경산',
         '010-2222-1234',
         '1003');
         
         
insert into employee (empid,
                      empname,
                      hiredate,
                      addr,
                      tel,
                      deptid)
values ( 20122245,
         '선아라',
         '20120302',
         '대구',
         '010-3333-1222',
         1002);
         
         
insert into employee (empid,
                      empname,
                      hiredate,
                      addr,
                      tel,
                      deptid)
values ( 20121729,
         '이범수',
         '20110302',
         '서울',
         '010-3333-4444',
         1001);
         
         
insert into employee (empid,
                      empname,
                      hiredate,
                      addr,
                      tel,
                      deptid)
values ( 20121646,
         '이윤희',
         '20120901',
         '부산',
         '010-1234-2222',
         1003);
         
select * from employee;





--9
ALTER TABLE employee
MODIFY (empname not null); -- not null만 modify가능

desc employee;



--10
select e.empname,
       e.hiredate,
       d.deptname
from department d
    INNER JOIN employee e
    ON d.deptid = e.deptid
WHERE d.deptname = '총무팀';

-- 서브쿼리보다 조인 권장!!! (cf 성능)            
select * from employee;


select e.empname,
       e.hiredate,
       d.deptname
from department d
    LEFT OUTER JOIN employee e
    ON d.deptid = e.deptid;

SELECT employee_id,
       first_name,
       department_name
FROM employees e
     LEFT OUTER JOIN departments d
     ON (e.department_id = d.department_id);
     
SELECT employee_id,
       first_name,
       department_name
FROM employees e
     FULL JOIN departments d
     ON (e.department_id = d.department_id);


            
--11
DELETE employee
WHERE addr = '대구';

-- mybatis는 오토커밋!!! mybatis기반으로 실행시 sql에서 아무리 rollback해도 되돌릴수 X


--12

UPDATE employee
SET deptid = (SELECT deptid
              FROM department
              WHERE deptname = '회계팀')
WHERE deptid = (SELECT deptid
                FROM department
                WHERE deptname = '영업팀');

-- 조인은...insert, delete, update X 
-- insert, delete, update에서 다른 테이블 데이터 참고시 서브쿼리!


--13
SELECT e.empid, e.empname, e.birthday, d.deptname
FROM employee e
    JOIN department d
        ON e.deptid = d.deptid
WHERE e.hiredate >= (SELECT hiredate
                     FROM employee
                     WHERE empid = 20121729);
                   
         
         
         
                   
--14
--hr 계정에 권한이 없을 경우 sys계정에서...
GRANT CREATE VIEW TO hr;

CREATE OR REPLACE VIEW employee_vu (e_name, e_addr, e_department) --CREATE VIEW 이렇게 쓰면 되지~이럼 안 덮어쓰겠지..
AS 
    SELECT e.empname, e.addr, d.deptname
    FROM employee e
        JOIN department d
            ON e.deptid = d.deptid
    WHERE d.deptname = '총무팀';

--view는 alter불가능 (뷰는 논리적 테이블...not 물리적 테이블)
--주의 : create인지 replace인지 안 알려줌 ㅋ (타인의 뷰를 뒤집어쓸 가능성 O)
--view는 요청할때마다 매번 데이터 바뀐다 (그래서 select문을 포함!)
--테이블말고...index나 view 많이 쓴다 현업에서
--view 등록해두면....뷰는 객체라서 다른 프로그램에서 재사용 가능! (db가 뷰를 가지고 있으므로...java기반 쓰다가 node를 사용시에도 존재하는 뷰로 pl/sql 실행해서 재사용 가능)

drop view employee_vu;

select *
from employee_vu;





--employee 테이블의 페이징 쿼리문

select *
from employees;


select *
from employees
where rownum <= 5
order by employee_id;

