--------------------------------------------------------
--  파일이 생성됨 - 목요일-3월-14-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BOARD_NO" NUMBER, 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(500), 
	"WRITER" VARCHAR2(50), 
	"WRITE_DATE" DATE DEFAULT sysdate, 
	"CLICK_CNT" NUMBER DEFAULT 0, 
	"IMAGE" VARCHAR2(100)
   ) ;
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (9,'4번째 시간','이것만 끝나면 점심^^','홍길동',to_date('23/12/27','RR/MM/DD'),4,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (17,'사진등록','합니다','홍길동',to_date('23/12/27','RR/MM/DD'),8,'레드향.jpg');
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (13,'아이바오','귀여웡','홍길동',to_date('23/12/27','RR/MM/DD'),20,'아이바오2.jpg');
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (21,'스프링수정','어렵다구','신신신',to_date('24/03/13','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (1,'첫번째 글','JSP 열심히 공부하자','홍길동',to_date('23/12/22','RR/MM/DD'),194,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (2,'오늘은 금요일','불코딩하자','김박사',to_date('23/12/22','RR/MM/DD'),17,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (3,'우리반 화이팅!!!','열심히 공부','김막내',to_date('23/12/22','RR/MM/DD'),83,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (12,'글등록','힘들어요','김철수',to_date('23/12/27','RR/MM/DD'),2,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (11,'오늘 뭐 먹지?','맛있는 거','김철수',to_date('23/12/27','RR/MM/DD'),14,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (15,'푸바오는 귀여워','정말 귀여워','홍길동',to_date('23/12/27','RR/MM/DD'),10,'푸바오1.jpg');
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (16,'푸바오야','안녕','홍길동',to_date('23/12/27','RR/MM/DD'),4,'푸바오2.jpg');
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (14,'푸바오','귀여워~','홍길동',to_date('23/12/27','RR/MM/DD'),3,'푸바오.jpg');
--------------------------------------------------------
--  DDL for Index SYS_C007061
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007061" ON "BOARD" ("BOARD_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD PRIMARY KEY ("BOARD_NO") ENABLE;
  ALTER TABLE "BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("TITLE" NOT NULL ENABLE);


select * from employees
ORDER BY employee_id DESC;

ALTER TABLE employees
ADD photo VARCHAR2(1000);

DESC employees;