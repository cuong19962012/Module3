-- Bước 1
create database demo;
-- Bước 2
use demo;
create table product(
id int,
productCode varchar(10),
productName varchar(50),
productPrice double,
productAmount int,
productDescription text,
productStatus bit,
primary key (id,productCode)  
);
insert into product
values (1,'P-001','Bánh Oreo',20000,10,'Bánh khá ngon',1),
(2,'P-002','Kẹo Bốn Mùa',10000,20,'Kẹo Không ngon',1),
(3,'P-003','Kem',15000,1,'Kem Khoai Môn',0);
-- Bước 3
create unique index product_index on product(productCode);

create index product_c_index on product(productName,productPrice);

explain select * from product where productname like'%Bánh%' and productprice<100000;

-- Bước 4
create view product_view as
select productcode,productname,productprice,productstatus
from product;

select *
from product_view;

create or replace view product_view as
select *
from product;

drop view product_view;

-- Bước 5

delimiter //
create procedure getAllProduct()
begin
	select *
    from product;
end//
delimiter ;
call getallproduct();

delimiter //
create procedure addProduct(in pra1 int,in pra2 varchar(10),in pra3 varchar(50), in pra4 double, in pra5 int,in pra6 text, in pra7 bit)
begin
	insert into product
    values (pra1,pra2,pra3,pra4,pra5,pra6,pra7);
end //
delimiter ;
call addProduct(4,'p-004','Bút Thiên Long',5000,1,'Bút Máy',1);

DELIMITER //
CREATE PROCEDURE updateProduct(IN pra1 int, IN pra2 varchar(10), IN pra3 varchar (50), IN pra4 double, IN pra5 int, in pra6 text,in pra7 bit)
BEGIN
	update product
    set productCode=pra2,productName=pra3,productPrice=pra4,productAmount=pra5,productDescription=pra6,productStatus=pra7
    where id=pra1;
END //
DELIMITER ;
call updateProduct(4,'p-004','Gạo',100000,10,'Gạo Thơm',1);

delimiter //
create procedure deleteProduct(in id int)
begin
	delete from product
    where product.id=id;
end//
delimiter ;
call deleteproduct(4);