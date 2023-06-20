
use furuma_management;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select distinct service.id,service.name,service.use_area,service.costs,kind_of_service.name
from service
left join contract on contract.id_service=service.id
left join kind_of_service on service.id_kind_of_service=kind_of_service.id
where service.id not in (
select service.id
from service
left join contract on contract.id_service=service.id
where (month(contract.date_contract) between 1 and 3) and year(contract.date_contract)=2021
)
order by service.name desc;


-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select service.id,service.name,service.use_area, service.max_person,service.costs,kind_of_service.name
from service
left join kind_of_service on service.id_kind_of_service=kind_of_service.id 
left join contract on service.id=contract.id_service
where service.id not in (
select service.id
from service
left join contract on service.id=contract.id_service
where not year(contract.date_contract)=2020 and year(contract.date_contract)=2021
)
group by service.id;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

select distinct customer.name 
from customer;

select distinct customer.name
from kind_of_customer
right join customer on customer.id_kind_of_customer=kind_of_customer.id;

select distinct customer.name
from contract
right join customer on contract.id_customer=customer.id
group by customer.id;

--  9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
-- select month(contract.date_contract), count(contract.id_customer)
select m.month as 'tháng',count(contract.id_customer) as 'số lần đặt'
from (
                      SELECT 1 AS MONTH
                       UNION SELECT 2 AS MONTH
                       UNION SELECT 3 AS MONTH
                       UNION SELECT 4 AS MONTH
                       UNION SELECT 5 AS MONTH
                       UNION SELECT 6 AS MONTH
                       UNION SELECT 7 AS MONTH
                       UNION SELECT 8 AS MONTH
                       UNION SELECT 9 AS MONTH
                       UNION SELECT 10 AS MONTH
                       UNION SELECT 11 AS MONTH
                       UNION SELECT 12 AS MONTH
) as m
left join contract on m.month=month(contract.date_contract) and year(contract.date_contract)=2021
left join customer on customer.id=contract.id_customer 
group by m.month
order by m.month;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select contract.id,contract.date_contract,contract.date_end,contract.deposit,sum(contract_detail.quantity)
from contract
left join contract_detail on contract.id=contract_detail.id_contract
group by contract.id;

