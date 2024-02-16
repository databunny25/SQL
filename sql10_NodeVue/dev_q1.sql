USE dev;

DESC customers;

SELECT id
		, name
        , email
        , phone
        , address
FROM customers;

COMMIT;

INSERT INTO customers
SET id = 100, name="Hong", phone="010-1234-1234";

INSERT INTO customers
SET ? -- ?는 객체 (여러 개일 수 있다)
WHERE id =?; -- id에 들어가는 특정한 한 개이다 (객체 아님)

INSERT INTO customers
SET name = ?, email = ? -- ?앞에 특정한 칼럼이 지정되어 있다( not 객체)
WHERE id = ?;








CREATE TABLE `t_users` (
	`user_no` INT AUTO_INCREMENT,
    `user_id` VARCHAR(100) NOT NULL UNIQUE, -- PK는 아니지만 얘를 식별자로 써야함!
    `user_pwd` VARCHAR(100) NOT NULL,
    `user_name` VARCHAR(100) NOT NULL,
    `user_gender` CHAR(1) CHECK( user_gender IN ('M', 'F')),
    `user_age` INT,
    `join_date` DATE,
    PRIMARY KEY(`user_no`)
);

DROP TABLE `t_users`;

ALTER TABLE t_users
DROP COLUMN `user_id`;

ALTER TABLE t_users
ADD CONSTRAINT t_user_id_uni UNIQUE (`user_id`);

DESC t_users;

SELECT * FROM `t_users`;

UPDATE t_users
SET user_gender = 'M',
	join_date = '2024-01-10'
WHERE user_id = 'user01';

COMMIT;

