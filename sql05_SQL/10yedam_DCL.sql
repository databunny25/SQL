select *
from hr.employees; --hr����ڰ� ���� employees ���̺��� ��ȸ�ϰڴ�!



create table aaa (aa number(2));

insert into aaa
values (1);
insert into aaa
values (2);

commit;

--Run SQL Command Line���� skj/lion user�� �����ؼ� aaa��ȸ�ص�...�ȵ�!

GRANT select
on aaa
to skj; --���� ��ȸ ��!