--dev 계정 만들기
create user dev identified by dev
default tablespace users;

grant connect, resource to dev;