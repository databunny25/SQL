select *
from hr.employees; --hr사용자가 가진 employees 테이블을 조회하겠다!



create table aaa (aa number(2));

insert into aaa
values (1);
insert into aaa
values (2);

commit;

--Run SQL Command Line에서 skj/lion user에 접속해서 aaa조회해도...안됨!

GRANT select
on aaa
to skj; --이제 조회 됨!