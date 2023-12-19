/*lib_member 회원 클래스*/
create table lib_member (mem_id varchar2(30) primary key,
                         mem_name      varchar2(50),
                         mem_phone     varchar2(20),
                         checkOut      number(10),
                         overDue       varchar2(20),
                         mem_level     varchar2(20));

drop table lib_member;

alter table lib_member
drop column checkOut;
--select COUNT(h.code),m.checkout from lib_member m, book_history h where m.mem_id = h.mem_id GROUP by m.checkout;




select *
from lib_member
order by 1;  

insert into lib_member (mem_id, mem_name, mem_phone)
values('M001', '유재석', '010-1111-1111');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M002', '김연아', '010-2222-2222');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M003', '손흥민', '010-3333-3333');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M004', '김연경', '010-4444-4444');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M005', '박지성', '010-5555-5555');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M006', '조성진', '010-6666-6666');

select mem_id, mem_name, checkOut, overDue, mem_level 
from lib_member 
where mem_name LIKE '%'||?||'%' order by 1;

select mem_id, mem_name, checkOut, overDue, mem_level 
from lib_member 
where mem_name LIKE '%석%' order by 1;


select COUNT(h.code)
from lib_member m, book_history h
where m.mem_id = h.mem_id;



/*lib_book 도서 클래스*/
create table book (code varchar2(20),
                   title varchar2(100),
                   author varchar2(40),
                   publisher varchar2(30),
                   valid varchar2(15));
drop table book;                   

select *
from book;    

alter table book
modify title varchar2(100);

select *
from book
where title LIKE '%자바%'; --in자바 like '%'||?||'%'

insert into book
values ('I0001', '이것이 리눅스다', '우재남', '한빛미디어', '대출가능');
insert into book
values ('I0002', 'Do it! 웹 표준의 정석', '고경희', '이지스퍼블리싱', '대출가능');
insert into book
values ('I0003', '자바스크립트 파워북', '어포스트', 'apost', '대출가능');
insert into book
values ('I0004', '혼자 공부하는 자바', '신용권', '한빛미디어', '대출가능');
insert into book
values ('I0005', '혼자 공부하는 자바', '신용권', '한빛미디어', '대출가능');
insert into book
values ('I0006', '혼자 공부하는 자바', '신용권', '한빛미디어', '대출가능');
insert into book
values ('I0007', 'ORACLE SQL', '예담', 'YEDAM', '대출가능');
insert into book
values ('I008', '처음 해보는 Servlet "&" JSP', '오정임', '루비페이퍼', '대출가능');
insert into book
values ('I009', 'Node.js 프로젝트 투입 일주일 전', '고승원', '비제이퍼블릭', '대출가능');
insert into book
values ('I010', 'Vue.js 프로젝트 투입 일주일 전', '고승원', '비제이퍼블릭', '대출가능');
insert into book
values ('I011', '코드로 배우는 스프링 웹 프로젝트', '구멍가게 코딩단', '남가람북스', '대출가능');
insert into book
values ('I012', '스프링 부트와 AWS로 혼자 구현하는 웹 서비스', '이동욱', '프리렉', '대출가능');
insert into book
values ('A001', '어린왕자', '생떽쥐베리', '민음사', '대출가능');
insert into book
values ('A002', '나의 라임 오렌지나무', 'J.M 바스콘셀로스', '동녘', '대출가능');
insert into book
values ('A003', '나의 라임 오렌지나무', 'J.M 바스콘셀로스', '동녘', '대출가능');
insert into book
values ('A004', '오만과 편견', '제인 오스틴', '민음사', '대출가능');
insert into book
values ('A005', '물고기는 존재하지 않는다', '룰루 밀러/정지인', '곰출판', '대출가능');
insert into book
values ('E001', '정의란 무엇인가', '마이클 샌델', '와이즈베리', '대출가능');
insert into book
values ('E002', '불황의 경제학', '폴 크루그먼', '세종서적', '대출가능');
insert into book
values ('J001', '달리기를 말할 때 내가 하고 싶은 이야기', '무라카미 하루키', '문학사상', '대출가능');

          
/*도서 대출 히스토리*/                   
create table book_history ( out_return varchar2(10),
                            hst_date varchar2(30) default sysdate,
                            mem_id varchar2(15),
                            code varchar2(15));

drop table book_history;
                         
select *
from book_history;

select count(*) from book_history where mem_id LIKE 'M001';

select * from book_history where mem_id LIKE 'M001';



select COUNT(h.code) as "checkOut"
from book_history h
where;

select h.out_return, h.hst_date, h.code , b.title
from book_history h, book b 
where h.code = b.code(+) 
and h.mem_id LIKE 'M001' ;

select h.out_return, h.hst_date, h.code , b.title, h.mem_id
from book_history h, book b
where h.code = b.code(+)
and mem_id LIKE 'M001';

insert into book_history
values('대출', '23/01/15', 'M001', 'I001');
insert into book_history
values('반납', '23/01/26', 'M001', 'I001');
insert into book_history
values('대출', '23/12/18', 'M002', 'I004');
insert into book_history(seq, out_return, mem_id, code)
values('대출', 'M002', 'I005');
insert into book_history
values('대출', NVL(null,sysdate),'M002', 'I005');

select h.hst_date, h.code, b.title
from book_history h, book b
where h.code = b.code and h.out_return = '대출' and h.code = ? ;


/*회원 등급 기준 테이블 생성*/
create table level_standard ( check_number number(10),
                              check_level varchar2(10));
                     
select *
from level_standard;    
              


--book_history의 history_no 위한 시퀀스 생성
create SEQUENCE seq
        increment by 1
        start with 1
        nocycle;
        
drop sequence seq;        

--시퀀스 사용해서 board 테이블에 삽입
insert into board(bo_no, bo_writer, bo_title, bo_content)
values (seq.NEXTVAL, '김민수', '어린 왕자 후기', '너무 재미있었어요~~~');




--BookDAO=================================================================

--(2)대출
update lib_book 
set valid = '대출중'
where code = '';

insert into book_history(in_out, mem_id, code, hst_date)
values ('대출', 'm001', 'A001',  '23/12/01');





