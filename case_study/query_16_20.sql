drop database furuma_management2;
create database furuma_management2;
use furuma_management2;
CREATE TABLE job_position (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE literacy (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE accompanied_service (
    id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    price DOUBLE NOT NULL,
    unit VARCHAR(10) NOT NULL,
    status VARCHAR(45)
);
CREATE TABLE kind_of_customer (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE kind_of_service (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE kind_of_rent (
    id INT PRIMARY KEY,
    name VARCHAR(45)
);
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    birtday DATE NOT NULL,
    identity_number VARCHAR(45) NOT NULL,
    salary INT NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    id_job_position INT not null,
    id_literacy INT not null,
    id_department INT not null,
    FOREIGN KEY (id_job_position)
        REFERENCES job_position (id),
    FOREIGN KEY (id_literacy)
        REFERENCES literacy (id),
    FOREIGN KEY (id_department)
        REFERENCES department (id)
);
CREATE TABLE customer (
    id INT PRIMARY KEY,
    id_kind_of_customer INT not null,
    name VARCHAR(45) NOT NULL,
    birthday DATE NOT NULL,
    gender BIT NOT NULL,
    identity_number VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(45),
    foreign key (id_kind_of_customer) references kind_of_customer(id)
);
CREATE TABLE service (
    id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    use_area INT,
    costs DOUBLE NOT NULL,
    max_person INT,
    id_kind_of_rent INT not null,
    id_kind_of_service INT not null,
    room_standard VARCHAR(45),
    description VARCHAR(45),
    pool_area DOUBLE,
    number_of_floor INT,
    FOREIGN KEY (id_kind_of_rent)
        REFERENCES kind_of_rent (id),
    FOREIGN KEY (id_kind_of_service)
        REFERENCES kind_of_service (id)
);
CREATE TABLE contract (
    id INT PRIMARY KEY,
    date_contract DATETIME NOT NULL,
    date_end DATETIME NOT NULL,
    deposit DOUBLE NOT NULL,
    id_employee INT not null,
    id_customer INT not null,
    id_service INT not null,
    FOREIGN KEY (id_employee)
        REFERENCES employee (id),
    FOREIGN KEY (id_customer)
        REFERENCES customer (id),
    FOREIGN KEY (id_service)
        REFERENCES service (id)
);
CREATE TABLE contract_detail (
    id INT PRIMARY KEY,
    id_contract INT not null,
    id_accompanied_service INT not null,
    quantity INT NOT NULL,
    FOREIGN KEY (id_contract)
        REFERENCES contract (id),
    FOREIGN KEY (id_accompanied_service)
        REFERENCES accompanied_service (id)
);

insert into job_position
values (1,"Quản Lý"),(2,"Nhân Viên");
insert into literacy
values (1,"Trung Cấp"),(2,"Cao Đẳng"),(3,"Đại Học"),(4,"Sau Đại Học");
insert into department
values (1,"Sale-Marketing"),(2,"Hành chính"),(3,"Phục vụ"),(4,"Quản lý");
insert into kind_of_customer
VALUES (1,"Diamond"),(2,"Platinium"),(3,"Gold"),(4,"Silver"),(5,"Member");
INSERT INTO kind_of_rent
VALUES
  (1,"year"),
  (2,"month"),
  (3,"day"),
  (4,"hour");
INSERT INTO kind_of_service
VALUES
  (1,"Villa"),
  (2,"House"),
  (3,"Room");
insert into accompanied_service
  VALUES
  (1,"Karaoke",10000,"giờ","tiện nghi, hiện tại"),
  (2,"Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
  (3,"Thuê xe đạp",20000,"chiếc","tốt"),
  (4,"Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
  (5,"Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
  (6,"Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");

INSERT INTO employee
VALUES
  (1,"Nguyễn Văn An","1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
  (2,"Lê Văn Bình","1997-04-09","654231234",7000000,"0934212314","binhlv@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2),
  (3,"Hồ Thị Yến","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
  (4,"Võ Công Toản","1980-04-04","123231365",17000000,"0374443232","toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
  (5,"Nguyễn Bỉnh Phát","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
  (6,"Khúc Nguyễn An Nghi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
  (7,"Nguyễn Hữu Hà","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
  (8,"Nguyễn Hà Đông","1989-09-03","234414123",9000000,"0642123111","donghanguyen@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
  (9,"Tòng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
  (10,"Nguyễn Công Đạo","1994-01-08","755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);
  
  insert into customer(id,name,birthday,gender,identity_number,phone_number,email,address,id_kind_of_customer)
  VALUES
  (1,"Nguyễn Thị Hào","1970-11-07",0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng",5),
  (2,"Phạm Xuân Diệu","1992-08-08",1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị",3),
  (3,"Trương Đình Nghệ","1990-02-27",1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh",1),
  (4,"Dương Văn Quan","1981-07-08",1,"543432111","0490039241","duongquan@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1),
  (5,"Hoàng Trần Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai",4),
  (6,"Tôn Nữ Mộc Châu","2005-12-06",0,"732434215","0988888844","tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng",4),
  (7,"Nguyễn Mỹ Kim","1984-04-08",0,"856453123","0912345698","kimcuong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1),
  (8,"Nguyễn Thị Hào","1999-04-08",0,"965656433","0763212345","haohao99@gmail.com","55 Nguyễn Văn Linh, Kon Tum",3),
  (9,"Trần Đại Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi",1),
  (10,"Nguyễn Tâm Đắc","1989-07-01",1,"344343432","0987654321","dactam@gmail.com","22 Ngô Quyền, Đà Nẵng",2);
insert into service(id,name,use_area,costs,max_person,room_standard,description,pool_area,number_of_floor,id_kind_of_rent,id_kind_of_service)
VALUES
  (1,"Villa Beach Front",25000,10000000,10,"vip","Có hồ bơi",500,4,3,1),
  (2,"House Princess 01",14000,5000000,7,"vip","Có thêm bếp nướng",null,3,2,2),
  (3,"Room Twin 01",5000,1000000,2,"normal","Có tivi",null,null,4,3),
  (4,"Villa No Beach Front",22000,9000000,8,"normal","Có hồ bơi",300,3,3,1),
  (5,"House Princess 02",10000,4000000,5,"normal","Có thêm bếp nướng",null,2,3,2),
  (6,"Room Twin 02",3000,900000,2,"normal","Có tivi",null,null,4,3);
  
INSERT INTO contract
VALUES
  (1,"2020-12-08","2020-12-08",0,3,1,3),
  (2,"2020-07-14","2020-07-21",200000,7,3,1),
  (3,"2021-03-15","2021-03-17",50000,3,4,2),
  (4,"2021-01-14","2021-01-18",100000,7,5,5),
  (5,"2021-07-14","2021-07-15",0,7,2,6),
  (6,"2021-06-01","2021-06-03",0,7,7,6),
  (7,"2021-09-02","2021-09-05",100000,7,4,4),
  (8,"2021-06-17","2021-06-18",150000,3,4,1),
  (9,"2020-11-19","2020-11-19",0,3,4,3),
  (10,"2021-04-12","2021-04-14",0,10,3,5),
  (11,"2021-04-25","2021-04-25",0,2,2,1),
  (12,"2021-05-25","2021-05-27",0,7,10,1);
  INSERT INTO contract_detail(id,quantity,id_contract,id_accompanied_service)
VALUES
  (1,5,2,4),
  (2,8,2,5),
  (3,15,2,6),
  (4,1,3,1),
  (5,11,3,2),
  (6,1,1,3),
  (7,2,1,2),
  (8,2,12,2);
  
 --  16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
 start transaction;
delete employee from employee
left join contract on contract.id_employee = employee.id
where employee.id not in (
select contract.id_employee
from contract
where year(contract.date_contract) between 2019 and 2021
);
commit;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update customer
set customer.id_kind_of_customer=1
where customer.id = (select *
					from(select customer.id
						from customer
						join contract on contract.id_customer=customer.id
						join service on contract.id_service=service.id
						join contract_detail on contract_detail.id_contract=contract.id
						join accompanied_service on accompanied_service.id = contract_detail.id_accompanied_service
						where year(contract.date_contract)=2021 and customer.id_kind_of_customer=2
						group by customer.id
						having sum(service.costs+contract_detail.quantity*accompanied_service.price)>10000000) as t
					);
                    
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET FOREIGN_KEY_CHECKS=0; -- to disable them
delete customer from (
	select customer.id as id
    from customer
    join contract on contract.id_customer=customer.id
    where year(contract.date_contract)<2021
) as t
join customer on t.id=customer.id
where customer.id=t.id;
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update accompanied_service 
join (select accompanied_service.id 
from accompanied_service
join contract_detail on contract_detail.id_accompanied_service=accompanied_service.id
join contract on contract_detail.id_contract=contract.id
where year(contract.date_contract)=2020 
group by accompanied_service.id
having sum(contract_detail.quantity)>10
) as t on t.id=accompanied_service.id
set accompanied_service.price=accompanied_service.price*2;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select id,name,email,phone_number,birtday,address
from employee
union all
select id,name,email,phone_number,birthday,address
from customer;
