select * from tab;

create table student(
    student_number varchar2(10) primary key,
    student_name varchar2(100) not null,
    english_score number default 80,
    mathmatic_score number default 70
);

drop table student;

-- µî·Ï, ¼öÁ¤, »èÁ¦, ´Ü°ÇÁ¶È¸, ¸ñ·Ï
insert into student
values ('23-001', 'È«±æµ¿', 70, 75);

insert into student -- stu_eng, stu_mat
values ('23-002', '±è¹Î¼ö', 80, 90);

insert into student-- stu_eng, stu_mat
values ('23-008', '±è¹Î¼ö', 77, 33);

insert into  student-- stu_eng, stu_mat
values ('23-007', '±è¹Î¼ö', 56, 24);

select *
from student order by 1;

update student
set stu_eng = 85, stu_mat = 75
where stu_no = '23-002';

delete student
where stu_name = '';

select *from student
where stu_no = '23-002';

create table book(
    bookCode varchar2(10) primary key,
    bookTitle varchar2(100) not null,
    author varchar2(10),
    press varchar2(20),
    price number
);

insert into book(bookCode, bookTitle, author, press, price)
values ('B001', 'ÀÌ°ÍÀÌÀÚ¹Ù´Ù', '½Å¿ë±Ç', 'ÇÑºû¹Ìµğ¾î', 25000);

insert into book(bookCode, bookTitle, author, press, price)
values ('B002', 'ÀÌ°ÍÀÌSQLÀÌ´Ù', '±èÃ¶¼ö', 'ÇÑºû¹Ìµğ¾î', 35000);

insert into book(bookCode, bookTitle, price)
values ('B003', 'ÀÌ°ÍÀÌHTMLÀÌ´Ù', 15000);

update book
set price = '¹Ú¾¾'
where bookCode = 'B003';

delete book
where bookCode = 'B003';

select *
from book;

select *
from book
where bookCode = 'B003';

drop table book;

drop table student;








/* Mybatis */

--°Ô½ÃÆÇ ¸¸µé±â

create table board (
    board_no number primary key,
    title varchar2(100) not null,
    content varchar2(500) not null,
    writer varchar2(50) not null,
    write_date date default sysdate,
    click_cnt number default 0,
    image varchar2(100)
);

create sequence board_seq;

insert into board (board_no, title, writer, content)
values(board_seq.nextval, 'Ã¹¹øÂ° ±Û', 'È«±æµ¿', 'JSP ¿­½ÉÈ÷ °øºÎÇÏÀÚ');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '¿À´ÃÀº ±İ¿äÀÏ', '±è¹Ú»ç', 'ºÒÄÚµùÇÏÀÚ');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '¿ì¸®¹İ È­ÀÌÆÃ!!!', '±è¸·³»', '¿­½ÉÈ÷ °øºÎ');


select * from board order by 1;

delete from board
where board_no = 5;



/* member Å×ÀÌºí »ı¼º */
create table member(
    id varchar2(20) primary key,
    pw varchar2(10) not null,
    name varchar2(100) not null,
    responsibility varchar2(10) default 'User' --Admin/User
);

alter table member add image varchar2(100);

select * from member order by 1;

delete from member where id='user9';

drop table member;

insert into member values('user1', '1111', 'È«±æµ¿', 'User');
insert into member values('user2', '2222', '±èÃ¶¼ö', 'User');
insert into member values('user3', '3333', '°ü¸®ÀÚ', 'Admin');
insert into member values('user4', '4444', '¹Ú¹Î±Ô', 'User');
insert into member values('user5', '5555', '±è»ç¶û', 'User');
insert into member values('user6', '6666', '±èÀ°¹ø', 'User');
commit;






/*240105 AJAX*/
-- ´ñ±Û(´ñ±Û¹øÈ£, °Ô½Ã±Û¹øÈ£, ³»¿ë, ÀÛ¼ºÀÚ, ÀÛ¼ºÀÏ½Ã)
create table reply (
    reply_no number primary key,
    board_no number not null,
    reply varchar2(100) not null,
    replyer varchar2(30) not null,
    reply_date date default sysdate
);
create sequence reply_seq;
drop sequence reply_seq;

drop table reply;


insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, '1¹ø´ñ±Û Å×½ºÆ®Áß~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, '1¹ø±Û 2¹ø´ñ±ÛÀÔ´Ï´ç', 'user2');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, '2¹ø±Û 1¹ø´ñ±ÛÀÌ´ç', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, '2¹ø±Û 2¹ø´ñ±ÛÀÌ´ç Å×½ºÆ®Áß~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, '3¹ø±Û 1¹ø´ñ±Û Å×½ºÆ®Áß~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, '3¹ø±Û 2¹ø´ñ±Û Å×½ºÆ®Áß~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test´ñ±Ûµé', 'user2');

insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, 'test´ñ±Ûµé', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, 'test´ñ±Ûµé', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test´ñ±Ûµé', 'user1');

insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, 'test', 'user3');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, 'test', 'user3');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test', 'user3');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, 'test', 'user4');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, 'test', 'user4');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test', 'user4');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, 'test', 'user5');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, 'test', 'user5');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test', 'user5');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, 'test', 'user6');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, 'test', 'user6');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test', 'user6');

select *
from reply
where board_no = 1;
select *
from reply
where board_no = 2;
select *
from reply
where board_no = 3;


select r.*, m.name name
from reply r join member m
on r.replyer = m.id;

select *
from reply;



-- ´ñ±Û ÆäÀÌÂ¡
 select b.* from 
( select rownum rn, a.* from
 ( select r.*, m.name name
    from reply r 
    join member m
    on r.replyer = m.id
    where board_no = 3
    order by 1
    ) a ) b
 where b.rn > (2-1)*5 and b.rn <= 2*5;
 
 
 
 
 
 
 
 
 
 
 --Â÷Æ®
 
 select * from reply;
 
 select name, count(*)
 from reply r
 join member m
 on r.replyer = m.id
 group by name;
 
 
 
 
 
 
 
 
 /* 20240110 Test*/
  
 create table book (
 book_code varchar2(10) primary key,
 book_name varchar2(100) not null,
 book_author varchar2(100) not null,
 book_press varchar2(100) not null,
 book_price number not null
);


insert into book
values( 'P12301289', 'ÀÌ°ÍÀÌ ÀÚ¹Ù´Ù', 'È«¼º¹®', '½ÅÈïÃâÆÇ»ç', 25000);

select *
from book;

drop table book;
