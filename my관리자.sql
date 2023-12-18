/*lib_member 회원 클래스*/
create table lib_member (mem_id varchar2(30) primary key,
                         mem_name      varchar2(50),
                         mem_phone     varchar2(20),
                         checkOut      number(10),
                         overDue       varchar2(20),
                         mem_level     varchar2(20));

drop table lib_member;


select *
from lib_member
order by 1;  

insert into lib_member (mem_id, mem_name, mem_phone)
values('M001', '유재석', '010-1111-1111');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M002', '김연아', '010-2222-2222');
insert into lib_member (mem_id, mem_name, mem_phone)
values('M003', '김연경', '010-3333-3333');

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
                   title varchar2(50),
                   author varchar2(40),
                   publisher varchar2(30),
                   valid varchar2(15));
drop table book;                   

select *
from book;    

select *
from book
where title LIKE '%자바%'; --in자바 like '%'||?||'%'

insert into book
values ('A001', '어린왕자', '생떽쥐베리', '민음사', '대출가능');
          
/*도서 대출 히스토리*/                   
create table book_history ( out_return varchar2(10),
                            hst_date varchar2(30),
                            mem_id varchar2(15),
                            code varchar2(15));

drop table book_history;
                         
select *
from book_history;

insert into book_history
values('대출', '23/11/01', 'M001', 'A001');

select h.hst_date, h.code, b.title
from book_history h, book b
where h.code = b.code and h.out_return = '대출' and h.code = ? ;


/*회원 등급 기준 테이블 생성*/
create table level_standard ( check_number number(10),
                              check_level varchar2(10));
                     
select *
from level_standard;    
              
/*board 게시판 생성*/       
create table board ( b_no number primary key,
                     b_writer varchar2(30),
                     b_title varchar2(50),
                     b_content varchar2(100),
                     b_date varchar2(30) default sysdate);
                   
select *
from board;

drop table board;

--board의 bo_no 위한 시퀀스 생성
create SEQUENCE seq
        increment by 1
        start with 1
        nocycle;
        
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





