-- <기타 객체> ==========================================================================

-- < INDEX >----------------------------------------------------------------------------
-- 잘 안씀


-- < SEQUENCE >-----------------------------------------------------------------------
--오라클만 지원 
--게시판 넘버링 부여할때 사용

--시퀀스 만들기
create sequence dept_deptid_seq
                increment by 10
                start with 120
                maxvalue 9999
                nocache
                nocycle;
                
--시퀀스 사용...주로 nextval많이 씀
insert into departments(department_id, department_name, location_id)
values (dept_deptid_seq.NEXTVAL, 'Support', 2500); --4번 실행해봄

select *
from departments; --department_id 칼럼에 120, 130, 140, 150 이 입력되었다!

--시퀀스에 오류나는 경우
ROLLBACK;

select *
from departments; --아까 삽입한 120, 130, 140, 150 지움

insert into departments(department_id, department_name, location_id)
values (dept_deptid_seq.NEXTVAL, 'Support', 2500); --다시 4번 실행해봄

select *
from departments; --롤백 후 다시 4번하니 department_id 에 160, 170, 180 이 입력됨!!  갭이 생겼다!!!!!


--현재 시퀀스 값 조회
select dept_deptid_seq.CURRVAL
from dual; --현재 시퀀스를 어디까지 썼느냐 확인 (CURRVAL은 현재 시퀀스 값 돌려줌)




--<SYNONYM>------------------------------------------------------------------------

create synonym d_sum
for dept_sum_vu;

select *
from d_sum;

select *
from dept_sum_vu; --위의 동의어와 원본 테이블 조회결과 같다!

drop synonym d_sum; --삭제