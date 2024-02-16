USE sakila;
SELECT * FROM sys_config;

USE sys;
SELECT * FROM sys_config;





/* 24-01-31 */

USE dev;

CREATE TABLE `dev`.`customers` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `phone` VARCHAR(45) NOT NULL,
    `address` VARCHAR(100) NULL,
    PRIMARY KEY (`id`)
);

SELECT id
	   , name
       , email
       , phone
       , address
 FROM customers;

DESC customers;

INSERT INTO customers
		(
          id
         , name
         , email
         , phone
         , address
         )
         VALUES
         (
           1
          , 'John Doe'
          , 'john@mail.com'
          , '010-000-000'
          , '' /* 널이 아니라 공백 */
          );
          
COMMIT;


/* dev계정 생성*/
CREATE USER 'dev01'@'%' IDENTIFIED WITH MYSQL_NATIVE_PASSWORD BY '1234';
GRANT ALL PRIVILEGES ON dev.* to 'dev01'@'%' WITH GRANT OPTION;
flush privileges;  -- 재시작 하지 않고 방금한 내용을 바로 적용하겠다




USE sakila;

SELECT *
FROM customer;