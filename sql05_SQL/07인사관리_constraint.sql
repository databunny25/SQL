-- <CONSTRAINT> =======================================================================

--NOU NULL 제약조건------------------------------------------------------------------------
CREATE TABLE emp_test ( empid   NUMBER(5),
                        empname VARCHAR2(10) NOT NULL,
                        duty    VARCHAR2(9),
                        sal     NUMBER(7,2),
                        bonus   NUMBER(7,2),
                        mgr     NUMBER(5),
                        hire_date DATE,
                        deptid  NUMBER(2));
                           
INSERT INTO emp_test(empid, empname)
values (10, NULL); --empname은 not null!

INSERT INTO emp_test(empid, empname)
values (10, 'YD');



--UNIQUE 제약조건------------------------------------------------------------------------
create table dept_test( depid   NUMBER(2),
                        dname   VARCHAR2(14),
                        loc     VARCHAR2(13),
                            UNIQUE(dname)); --CONSTRAINT 제약조건명 UNIQUE(dname)에서 CONSTRAINT 제약조건명 은 생략가능!
desc dept_test;

INSERT INTO dept_test(depid, dname)
values(10, NULL);

INSERT INTO dept_test(depid, dname)
values(20, 'YD');

INSERT INTO dept_test(depid, dname)
values(20, 'YD'); --오류...이미 (20, 'YD')가 있다!




--PRIMARY KEY 제약조건------------------------------------------------------------------------

--유일성 + 최소성 => 후보키 (유일성과 최소성을 만족하면 후보키라고 한다)
--슈퍼키(유일성은 만족하지만 최소성은 만족 x)
--후보키 중 기본키 제외한 나머지 키 : 대체키

drop table dept_test;

create table dept_test( deptid  NUMBER(2) PRIMARY KEY,
                        dname   varchar2(14),
                        loc     VARCHAR2(13),
                            UNIQUE(dname));
                            
insert into dept_test
values (10, 'YD', 'Daegu');

insert into dept_test
values (20, 'YD1', 'Daegu'); 

insert into dept_test
values (20, 'YD2', 'Daegu'); --PK중복 

insert into dept_test
values (NULL, 'YD3', 'Daegu'); --PK null 불가




--FOREIGN KEY 제약조건------------------------------------------------------------------------

drop table emp_test;

--테이블 레벨에서 FK지정... references 반드시 적어줘야!
CREATE TABLE emp_test ( empid   NUMBER(5),
                        empname VARCHAR2(10) NOT NULL,
                        duty    VARCHAR2(9),
                        sal     NUMBER(7,2),
                        bonus   NUMBER(7,2),
                        mgr     NUMBER(5),
                        hire_date DATE,
                        deptid  NUMBER(2),
                        FOREIGN KEY(deptid) references dept_test(deptid) on delete set null); 

--컬럼 레벨에서 FK지정...  FOREIGN KEY(deptid) 적을 필요 없다!
CREATE TABLE emp_test ( empid   NUMBER(5),
                        empname VARCHAR2(10) NOT NULL,
                        duty    VARCHAR2(9),
                        sal     NUMBER(7,2),
                        bonus   NUMBER(7,2),
                        mgr     NUMBER(5),
                        hire_date DATE,
                        deptid  NUMBER(2) references dept_test(deptid)); 
                        

insert into emp_test(empid, empname, deptid)
values (100, 'YD1', 10);

insert into emp_test(empid, empname, deptid)
values (200, 'YD2', NULL);

insert into emp_test(empid, empname, deptid)
values (300, 'YD3', 30); --참조무결성 제약...부모키가 없다! (FK에 부모키가 없음)

select *
from emp_test;


/*
alter table emp_test
modify deptid references dept_test(deptid) on delete set null;

drop table emp_test;*/

select *
from emp_test;

delete dept_test
where deptid = 10;

select *
from dept_test;

select *
from emp_test; --10으로 존재하던 deptid 칼럼의 값이 null로 바뀜 (ON DELETE SET NULL)




--CHECK 제약조건 ------------------------------------------------------------------------

drop table emp_test;

CREATE TABLE emp_test ( empid   NUMBER(5),
                        empname VARCHAR2(10) NOT NULL,
                        duty    VARCHAR2(9),
                        sal     NUMBER(7,2),
                        bonus   NUMBER(7,2),
                        mgr     NUMBER(5),
                        hire_date DATE,
                        deptid  NUMBER(2),
                            CHECK (deptid BETWEEN 10 AND 99),
                            FOREIGN KEY(deptid) references dept_test(deptid)); 
                            
                            
--<제약조건 수정> (만들어놓은 테이블에 제약조건 지정하기)--------------------------------------

alter table emp_test
add primary key(empid);


alter table emp_test
add         FOREIGN KEY(mgr) references emp_test(empid); --참조키는 무조건 PK나 UNIQUE 되어있는 애만 참조할수 있다


alter table emp_test
modify (duty NOT NULL);  --not null제약조건은 테이블 레벨에서 지정할수 없다! -> 무조건 modify

desc emp_test;


--<제약조건 삭제> ---------------------------------------------------------------------
--삭제 위해 제약조건 이름 확인
select constraint_name, constraint_type, search_condition
from user_constraints;

--컬럼이름과 컬럼의 제약조건 이름 확인
select constraint_name, column_name
from user_cons_columns; --제약조건 만들때 이름 명명 안 했으면 SYS_C999999 이런식으로 이름 생긴다...

desc user_cons_columns;

--내가 만든 EMP_TEST 테이블의 제약조건 이름들 확인
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP_TEST'; --MGR 칼럼의 제약조건 이름은 SYS_C007023이다! 하고 알아냄

alter table emp_test
drop constraint SYS_C007023;



--제약조건 (비)활성화--

--제약조건 보기--






