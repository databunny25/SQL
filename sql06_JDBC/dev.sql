select * from tab;

create table student(
    student_number varchar2(10) primary key,
    student_name varchar2(100) not null,
    english_score number default 80,
    mathmatic_score number default 70
);

drop table student;

-- ���, ����, ����, �ܰ���ȸ, ���
insert into student
values ('23-001', 'ȫ�浿', 70, 75);

insert into student -- stu_eng, stu_mat
values ('23-002', '��μ�', 80, 90);

insert into student-- stu_eng, stu_mat
values ('23-008', '��μ�', 77, 33);

insert into  student-- stu_eng, stu_mat
values ('23-007', '��μ�', 56, 24);

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
values ('B001', '�̰����ڹٴ�', '�ſ��', '�Ѻ��̵��', 25000);

insert into book(bookCode, bookTitle, author, press, price)
values ('B002', '�̰���SQL�̴�', '��ö��', '�Ѻ��̵��', 35000);

insert into book(bookCode, bookTitle, price)
values ('B003', '�̰���HTML�̴�', 15000);

update book
set price = '�ھ�'
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

--�Խ��� �����

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
values(board_seq.nextval, 'ù��° ��', 'ȫ�浿', 'JSP ������ ��������');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '������ �ݿ���', '��ڻ�', '���ڵ�����');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '�츮�� ȭ����!!!', '�踷��', '������ ����');


select * from board order by 1;

delete from board
where board_no = 5;



/* member ���̺� ���� */
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

insert into member values('user1', '1111', 'ȫ�浿', 'User');
insert into member values('user2', '2222', '��ö��', 'User');
insert into member values('user3', '3333', '������', 'Admin');
insert into member values('user4', '4444', '�ڹα�', 'User');
insert into member values('user5', '5555', '����', 'User');
insert into member values('user6', '6666', '������', 'User');
commit;






/*240105 AJAX*/
-- ���(��۹�ȣ, �Խñ۹�ȣ, ����, �ۼ���, �ۼ��Ͻ�)
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
values(reply_seq.nextval, 1, '1����� �׽�Ʈ��~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, '1���� 2������Դϴ�', 'user2');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, '2���� 1������̴�', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, '2���� 2������̴� �׽�Ʈ��~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, '3���� 1����� �׽�Ʈ��~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, '3���� 2����� �׽�Ʈ��~', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test��۵�', 'user2');

insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 1, 'test��۵�', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 2, 'test��۵�', 'user1');
insert into reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 3, 'test��۵�', 'user1');

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



-- ��� ����¡
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
 
 
 
 
 
 
 
 
 
 
 --��Ʈ
 
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
values( 'P12301289', '�̰��� �ڹٴ�', 'ȫ����', '�������ǻ�', 25000);

select *
from book;

drop table book;
