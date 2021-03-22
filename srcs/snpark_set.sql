use mysql;
update user set plugin='' where user='root';
create database if not exists wordpress;
create user if not exists 'snpark'@'localhost' identified by '1111';
grant all privileges on wordpress.* to 'snpark'@'localhost' with grant option;
flush privileges;
