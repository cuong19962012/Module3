use  `student-management`;
drop table class,teacher;
create table class(
id int primary key ,
name varchar(50)
);
create table teacher(
id int primary key,
name  varchar(50),
age int,
country varchar(50)
);
