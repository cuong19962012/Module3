create database order_management;
use order_management;
create table order_unit(
id int primary key,
unit_name varchar(50) not null,
address varchar(250) not null,
phone_number int not null
);
create table customer_unit(
id int primary key,
unit_name varchar(50) not null,
address varchar(250) not null
);
create table product_unit(
id int primary key,
unit_name varchar(50) not null,
calculate_unit varchar(20) not null,
unit_description text not null
);
alter table product 
rename column unit_name to name

f
