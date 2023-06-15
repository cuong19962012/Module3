create database codegym_management;
use codegym_management;
create table student(
id int primary key,
name varchar(50),
birthday varchar(20),
gender bit,
email varchar(255),
scorce int,
id_class int,
foreign key (id_class) references class(id)
);
create table jame(
id int primary key,
account varchar(50),
password varchar(50),
foreign key(id) references student(id)
);
create table class(
id int primary key,
name varchar(50),
number_of_students int
);
create table teacher(
id int primary key,
name varchar(50),
birthday varchar(20),
salary int 
);
create table class_classify(
id_teacher int,
id_class int,
primary key (id_teacher,id_class), 
foreign key (id_teacher) references teacher(id),
foreign key (id_class) references class(id)
);