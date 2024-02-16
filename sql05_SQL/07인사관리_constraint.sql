-- <CONSTRAINT> =======================================================================

--NOU NULL ��������------------------------------------------------------------------------
CREATE TABLE emp_test ( empid   NUMBER(5),
                        empname VARCHAR2(10) NOT NULL,
                        duty    VARCHAR2(9),
                        sal     NUMBER(7,2),
                        bonus   NUMBER(7,2),
                        mgr     NUMBER(5),
                        hire_date DATE,
                        deptid  NUMBER(2));
                           
INSERT INTO emp_test(empid, empname)
values (10, NULL); --empname�� not null!

INSERT INTO emp_test(empid, empname)
values (10, 'YD');



--UNIQUE ��������------------------------------------------------------------------------
create table dept_test( depid   NUMBER(2),
                        dname   VARCHAR2(14),
                        loc     VARCHAR2(13),
                            UNIQUE(dname)); --CONSTRAINT �������Ǹ� UNIQUE(dname)���� CONSTRAINT �������Ǹ� �� ��������!
desc dept_test;

INSERT INTO dept_test(depid, dname)
values(10, NULL);

INSERT INTO dept_test(depid, dname)
values(20, 'YD');

INSERT INTO dept_test(depid, dname)
values(20, 'YD'); --����...�̹� (20, 'YD')�� �ִ�!




--PRIMARY KEY ��������------------------------------------------------------------------------

--���ϼ� + �ּҼ� => �ĺ�Ű (���ϼ��� �ּҼ��� �����ϸ� �ĺ�Ű��� �Ѵ�)
--����Ű(���ϼ��� ���������� �ּҼ��� ���� x)
--�ĺ�Ű �� �⺻Ű ������ ������ Ű : ��üŰ

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
values (20, 'YD2', 'Daegu'); --PK�ߺ� 

insert into dept_test
values (NULL, 'YD3', 'Daegu'); --PK null �Ұ�




--FOREIGN KEY ��������------------------------------------------------------------------------

drop table emp_test;

--���̺� �������� FK����... references �ݵ�� �������!
CREATE TABLE emp_test ( empid   NUMBER(5),
                        empname VARCHAR2(10) NOT NULL,
                        duty    VARCHAR2(9),
                        sal     NUMBER(7,2),
                        bonus   NUMBER(7,2),
                        mgr     NUMBER(5),
                        hire_date DATE,
                        deptid  NUMBER(2),
                        FOREIGN KEY(deptid) references dept_test(deptid) on delete set null); 

--�÷� �������� FK����...  FOREIGN KEY(deptid) ���� �ʿ� ����!
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
values (300, 'YD3', 30); --�������Ἲ ����...�θ�Ű�� ����! (FK�� �θ�Ű�� ����)

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
from emp_test; --10���� �����ϴ� deptid Į���� ���� null�� �ٲ� (ON DELETE SET NULL)




--CHECK �������� ------------------------------------------------------------------------

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
                            
                            
--<�������� ����> (�������� ���̺� �������� �����ϱ�)--------------------------------------

alter table emp_test
add primary key(empid);


alter table emp_test
add         FOREIGN KEY(mgr) references emp_test(empid); --����Ű�� ������ PK�� UNIQUE �Ǿ��ִ� �ָ� �����Ҽ� �ִ�


alter table emp_test
modify (duty NOT NULL);  --not null���������� ���̺� �������� �����Ҽ� ����! -> ������ modify

desc emp_test;


--<�������� ����> ---------------------------------------------------------------------
--���� ���� �������� �̸� Ȯ��
select constraint_name, constraint_type, search_condition
from user_constraints;

--�÷��̸��� �÷��� �������� �̸� Ȯ��
select constraint_name, column_name
from user_cons_columns; --�������� ���鶧 �̸� ��� �� ������ SYS_C999999 �̷������� �̸� �����...

desc user_cons_columns;

--���� ���� EMP_TEST ���̺��� �������� �̸��� Ȯ��
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP_TEST'; --MGR Į���� �������� �̸��� SYS_C007023�̴�! �ϰ� �˾Ƴ�

alter table emp_test
drop constraint SYS_C007023;



--�������� (��)Ȱ��ȭ--

--�������� ����--






