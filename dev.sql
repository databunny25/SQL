select * from tab;

create table student(
    student_number varchar2(10) primary key,
    student_name varchar2(100) not null,
    english_score number default 80,
    mathmatic_score number default 70
);

drop table student;

-- 등록, 수정, 삭제, 단건조회, 목록
insert into student
values ('23-001', '홍길동', 70, 75);

insert into student -- stu_eng, stu_mat
values ('23-002', '김민수', 80, 90);

insert into student-- stu_eng, stu_mat
values ('23-008', '김민수', 77, 33);

insert into  student-- stu_eng, stu_mat
values ('23-007', '김민수', 56, 24);

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
values ('B001', '이것이자바다', '신용권', '한빛미디어', 25000);

insert into book(bookCode, bookTitle, author, press, price)
values ('B002', '이것이SQL이다', '김철수', '한빛미디어', 35000);

insert into book(bookCode, bookTitle, price)
values ('B003', '이것이HTML이다', 15000);

update book
set price = '박씨'
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

--게시판 만들기

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
values(board_seq.nextval, '첫번째 글', '홍길동', 'JSP 열심히 공부하자');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '오늘은 금요일', '김박사', '불코딩하자');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '우리반 화이팅!!!', '김막내', '열심히 공부');


select * from board order by 1;
