-- <DCL> ============================================================================



--권한부여할거니까 이제부터 관리자 계정으로 접속해서 실습!
--사용자 생성
create user skj
identified by test;

--왼쪽 접속창에 skj띄우기 위해...
--Run SQL Command Line 띄워서 CONN skj/test..........(커넥트하겠다 skj계정으로, 비번은 test)
--오류...

GRANT CREATE SESSION
TO skj;

--이제 CONN skj/test 된다!


--권한 주기(db접속, 테이블 생성, 뷰 생성)
GRANT create session, create table, create view
to skj;




--권한 철회
REVOKE create table, create view
from skj;



--사용자 암호 변경 (권한은 변화 X, 사용자 수정만 함)
ALTER USER skj
IDENTIFIED BY lion;



--ROLE-------------------------------------------------------------------------------

create user yedam
identified by yedam
default tablespace users
temporary tablespace temp;

GRANT connect, dba
TO yedam;



--객체 권한 부여 -------------------------------------------------------------------

--yedam 사용자 만든 후
revoke select 
on hr.employees
from yedam;