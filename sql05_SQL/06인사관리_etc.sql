--기타 데이터 정의어 =================================================================

--테이블 삭제 & FLASHBACK TABLE
DROP TABLE dept80;

desc dept80; --yes or no도 안 묻고 걍 삭제해버리네ㅠㅠ

select object_name, original_name, type
from user_recyclebin; --방금 삭제한 dept80이 있다! user_recyclebin이 sql의 휴지통이다!

flashback table dept80 to before drop; --되살림!

drop table dept80 PURGE; --휴지통에도 안 담고 완전히 삭제!

select object_name, original_name, type
from user_recyclebin; --휴지통에 없다!


--RENAME --

rename dept to dept80;

select *
from dept80;


--TRUNCATE--

TRUNCATE TABLE dept80; --(구조는 남기고) 안에 있는 데이터 다 날림!

