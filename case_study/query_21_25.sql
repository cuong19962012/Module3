-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as
select * 
from employee
where employee.id in (select employee.id
from employee
join contract on contract.id_employee=employee.id
where contract.date_contract = '2019-12-12' and (employee.address like "%Hải Châu%")
);

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
create or replace view v_nhan_vien as
select * 
from employee
where employee.id in (select employee.id
from employee
join contract on contract.id_employee=employee.id
where contract.date_contract = '2019-12-12' and (employee.address like "%Liên Chiểu%")
);

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang(id int)
begin
	SET FOREIGN_KEY_CHECKS=0;
	delete from customer
    where customer.id=id;
    SET FOREIGN_KEY_CHECKS=1;
end //
delimiter ;

call sp_xoa_khach_hang(10);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
	create procedure sp_them_moi_hop_dong( id int,date_contract datetime,date_end datetime,deposit int, id_employee int, id_customer int,id_service int)
	begin
		if(id not in (select contract.id from contract)) then
			if(id_employee in(select employee.id from employee)) then
				if(id_customer in (select customer.id from customer)) then
					if(id_service in (select service.id from service)) then
						insert into contract values (id,date_contract,date_end,deposit,id_employee,id_customer,id_service);
					end if;
				end if;
			end if;
		end if;
    end //
delimiter ;

call sp_them_moi_hop_dong(13,'2023-06-20','2023-06-21',1000000,3,3,3);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_xoa_hop_dong 
after delete on contract for each row
begin
	declare quantity int;
    declare msg varchar(255);
    select count(contract.id) into quantity
    from contract;
	set msg=concat("Số Hợp Đồng còn lại ",quantity);
    signal sqlstate '48000' set message_text=msg;
end //
delimiter ;

delete from contract
where contract.id=13;


drop trigger tr_xoa_hop_dong;
