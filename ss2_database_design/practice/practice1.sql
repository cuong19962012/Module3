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
alter table customer_unit
add column id_order_unit int;
alter table customer_unit
add column id_receive__person int;
alter table customer_unit
rename column id_receive__person to id_receive_person;
alter table customer_unit
add foreign key (id_receive_person) references receive_person(id);
alter table customer_unit
add foreign key (id_order_unit) references order_unit(id);
create table product(
id int primary key,
name varchar(50) not null,
calculate_unit varchar(20) not null,
unit_description text not null
);
create table order_person(
id int primary key,
person_name varchar(50) not null
);
create table delivery_place(
	id int primary key,
    delivery_place_name varchar(250) not null
);
create table receive_person(
id int primary key,
name varchar(50) not null
);
create table delivery_person(
id int primary key,
name varchar(50) not null
);
create table delivery_bill(

);