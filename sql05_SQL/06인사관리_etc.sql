--��Ÿ ������ ���Ǿ� =================================================================

--���̺� ���� & FLASHBACK TABLE
DROP TABLE dept80;

desc dept80; --yes or no�� �� ���� �� �����ع����פФ�

select object_name, original_name, type
from user_recyclebin; --��� ������ dept80�� �ִ�! user_recyclebin�� sql�� �������̴�!

flashback table dept80 to before drop; --�ǻ츲!

drop table dept80 PURGE; --�����뿡�� �� ��� ������ ����!

select object_name, original_name, type
from user_recyclebin; --�����뿡 ����!


--RENAME --

rename dept to dept80;

select *
from dept80;


--TRUNCATE--

TRUNCATE TABLE dept80; --(������ �����) �ȿ� �ִ� ������ �� ����!

