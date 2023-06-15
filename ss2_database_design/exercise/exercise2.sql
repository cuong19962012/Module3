create database quanlibanhang;
use quanlibanhang;
create table product(
p_id int primary key,
p_name varchar(50),
p_price int
);
create table oder_detail(
o_id int,
p_id int ,
od_qty int,
primary key (o_id,p_id),
foreign key(p_id) references product(p_id),
foreign key(o_id) references `order`(o_id)
);
create table `order`(
o_id int primary key,
c_id int,
o_date datetime ,
o_total_price int,
foreign key (o_id) references customer(c_id)
);
create table customer(
c_id int primary key,
c_name varchar(50),
c_age int 
);