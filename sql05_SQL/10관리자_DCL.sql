-- <DCL> ============================================================================



--���Ѻο��ҰŴϱ� �������� ������ �������� �����ؼ� �ǽ�!
--����� ����
create user skj
identified by test;

--���� ����â�� skj���� ����...
--Run SQL Command Line ����� CONN skj/test..........(Ŀ��Ʈ�ϰڴ� skj��������, ����� test)
--����...

GRANT CREATE SESSION
TO skj;

--���� CONN skj/test �ȴ�!


--���� �ֱ�(db����, ���̺� ����, �� ����)
GRANT create session, create table, create view
to skj;




--���� öȸ
REVOKE create table, create view
from skj;



--����� ��ȣ ���� (������ ��ȭ X, ����� ������ ��)
ALTER USER skj
IDENTIFIED BY lion;



--ROLE-------------------------------------------------------------------------------

create user yedam
identified by yedam
default tablespace users
temporary tablespace temp;

GRANT connect, dba
TO yedam;



--��ü ���� �ο� -------------------------------------------------------------------

--yedam ����� ���� ��
revoke select 
on hr.employees
from yedam;