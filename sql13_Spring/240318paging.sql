select * from ( select rownum as rn, a.* from ( 
	
 		SELECT EMPLOYEE_ID
				,FIRST_NAME
				,LAST_NAME
				,EMAIL
				,DEPARTMENT_ID
 		  FROM employees e		
 		 ORDER BY first_name
 			
 	) a where rownum <=10 ) b where rn >= 1;
    
    
    
--hint 사용

    select * from (
          select /* +INDEX_ASC( employees EMP_EMAIL_UK) */ 
                rownum rn
                ,EMPLOYEE_ID
				,FIRST_NAME
				,LAST_NAME
				,EMAIL
				,DEPARTMENT_ID
 		  FROM employees
          WHERE rownum <= 10
    ) where rn>= 10;
    
    
    select * from departments
    order by department_id;
    
    select * from employees;
    
    
    
--p377 댓글처리
select * from board
order by board_no;

create table tbl_reply(
    rno number(10, 0),
    board_no number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
    );

select * from tbl_reply;
drop table tbl_reply;
    
create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board
foreign key (board_no) references board(board_no);

select * from tbl_reply
where board_no = ?;

insert into (board_no, reply, replyer, replydate, updatedate)
values ();


insert into tbl_reply (rno,
							   board_no,
							   reply, 
							   replyer
					 			)
		values (seq_reply.nextval,
				1,
				'댓글댓글',
				'나나나'
				);
                
                
                
                
create table tbl_sample1( col1 varchar2(500));

create table tbl_sample2( col2 varchar2(10));

select * from tbl_sample1;
select * from tbl_sample2;

delete tbl_sample1;
delete tbl_sample2;

select * from employees;