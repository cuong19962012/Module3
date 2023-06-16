use furuma_management;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from employee
where (substring_index(name," ",-1) like "h%") or (substring_index(name," ",-1) like "k%") or (substring_index(name," ",-1) like "t%") ;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from customer
where (TIMESTAMPDIFF(YEAR,birthday, CURDATE())>=18 and TIMESTAMPDIFF(YEAR,birthday, CURDATE())<=50) and (address like "%Đà Nẵng%" or address like "%Quảng Trị%");

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select customer.name,count(contract.id) as "count_booking"
from customer
join contract on customer.id=contract.id_customer
join kind_of_customer on customer.id_kind_of_customer=kind_of_customer.id
where kind_of_customer.name="Diamond"
group by customer.name
order by count_booking;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 


select customer.id,customer.name,kind_of_customer.name,contract.id,service.name,contract.date_contract,contract.date_end,service.costs+(contract_detail.quantity*accompanied_service.price) as "total_price"
from customer
join 