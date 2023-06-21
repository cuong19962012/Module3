-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_cap_nhat_hop_dong 
before update on contract for each row
begin
	if(datediff(new.date_end,new.date_contract) < 2) then
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày";
    end if;
end //
delimiter ;
SET SQL_SAFE_UPDATES = 0;
update contract
set contract.date_end='2023-06-22'
where contract.id=13;
SET SQL_SAFE_UPDATES = 1;
drop trigger tr_cap_nhat_hop_dong ;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.

delimiter //
create function func_diem_dich_vu()
returns int
deterministic
begin
	declare count int;
	select count(*) into count 
    from(select service.id
		from service
        join contract on contract.id_service=service.id
        join contract_detail on contract_detail.id_contract=contract.id
        join accompanied_service on accompanied_service.id=contract_detail.id_accompanied_service
        where service.costs+contract_detail.quantity*accompanied_service.price>2000000
        group by service.id
		) as t;
        return count;
end //
delimiter ;





-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.
delimiter //
	create function func_tinh_thoi_gian_hop_dong(customer_id int)
    returns int
    deterministic
    begin
		declare between_day int;
        select max(c) into between_day 
        from (
			select datediff(contract.date_end,contract.date_contract) as c
            from contract
            join customer on contract.id_customer=customer.id
            where customer.id = customer_id
        ) as t;
        return between_day;
    end //
delimiter ;

select id,name, func_tinh_thoi_gian_hop_dong(customer.id)
from customer;

-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

delimiter //
	create procedure sp_xoa_dich_vu_va_hd_room()
    begin
    SET FOREIGN_KEY_CHECKS=0;
        delete service,contract,contract_detail
        from ( select service.id as id
			from contract
			join service on service.id=contract.id_service
            join kind_of_service on service.id_kind_of_service=kind_of_service.id
			where kind_of_service.id=3 and (year(contract.date_contract) between 2015 and 2019)
			) as t
		join service on service.id=t.id
		join contract on contract.id_service=service.id
        join contract_detail on contract_detail.id_contract=contract.id
        where service.id=t.id;
        SET FOREIGN_KEY_CHECKS=1;
    end //
delimiter ;

call sp_xoa_dich_vu_va_hd_room();

drop procedure sp_xoa_dich_vu_va_hd_room;