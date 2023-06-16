use quanlibanhang;
INSERT INTO customer
VALUES 
  (1,'Minh Quan',10),
  (2,'Ngoc Oanh',20),
  (3,'Hong Ha',50);
  
INSERT INTO `order`(o_id,c_id,o_date,o_total_price)
VALUES 
  (1,1,'2006-03-21',Null),
  (2,2,'2006-03-23',Null),
  (3,1,'2006-03-16',Null);
  
INSERT INTO product
VALUES 
  (1,'May Giat',3),
  (2,'Tu Lanh',5),
  (3,'Dieu Hoa',7),
  (4,'Quat',1),
  (5,'Bep Dien',2);
  
insert into order_detail
values
 (1,1,3), 
  (1,3,7),
  (1,4,2),
  (2,1,1),
  (3,1,8),
  (2,5,4),
  (2,3,3);
  
  
  
  select o_id,o_date,o_total_price
  from `order`;
  
  select customer.c_name,product.p_name
  from customer
  join `order` on customer.c_id=`order`.c_id
  join order_detail on `order`.o_id=order_detail.o_id
  join product on order_detail.p_id=product.p_id;
  
  select *
  from customer
  left join `order`
  on customer.c_id=`order`.c_id
  where `order`.c_id <=> null;
  
  select `order`.o_id,`order`.o_date,product.p_price*order_detail.od_qty as 'total'
  from product
  join order_detail on product.p_id=order_detail.p_id
  join `order` on order_detail.o_id=`order`.o_id;
  