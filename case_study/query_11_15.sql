use furuma_management;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select distinct accompanied_service.id,accompanied_service.name
from accompanied_service
left join contract_detail on contract_detail.id_accompanied_service=accompanied_service.id
left join contract on contract.id=contract_detail.id_contract
left join customer on customer.id=contract.id_customer
left join kind_of_customer on kind_of_customer.id=customer.id_kind_of_customer
where (customer.address like "%Vinh%" or customer.address like "%Quảng Ngãi%") and kind_of_customer.name="Diamond" ;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select contract.id,employee.name,customer.name,customer.phone_number,service.name,sum(contract_detail.quantity) as 'quantity accompanied_service',contract.deposit
from contract
left join service on contract.id_service=service.id
left join employee on contract.id_employee=employee.id
left join customer on contract.id_customer=customer.id
left join contract_detail on contract_detail.id_contract=contract.id
where ((month(contract.date_contract) between 10 and 12) and year(contract.date_contract)=2020) and not ((month(contract.date_contract) between 1 and 6) and year(contract.date_contract)=2021)
group by contract.id;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select accompanied_service.id,accompanied_service.name , sum(contract_detail.quantity)
from accompanied_service
join contract_detail on accompanied_service.id= contract_detail.id_accompanied_service
group by accompanied_service.id
having sum(contract_detail.quantity)=(select max(max)
from (select sum(contract_detail.quantity) as max from accompanied_service join contract_detail on accompanied_service.id=contract_detail.id_accompanied_service group by accompanied_service.id) s);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
-- chưa làm đc
select distinctrow contract.id,kind_of_service.name,accompanied_service.name-- ,count(contract_detail.id_accompanied_service)
from accompanied_service
join contract_detail on accompanied_service.id=contract_detail.id_accompanied_service
join contract on contract.id=contract_detail.id_contract
join service on service.id=contract.id_service
join kind_of_service on kind_of_service.id=service.id_kind_of_service
group by accompanied_service.id and accompanied_service.name;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select employee.id,employee.name,literacy.name,department.name,employee.phone_number,employee.address
from employee
join literacy on employee.id_literacy=literacy.id
join department on employee.id_department=department.id
join contract on contract.id_employee=employee.id
group by employee.id
having count(contract.id)<=3;

