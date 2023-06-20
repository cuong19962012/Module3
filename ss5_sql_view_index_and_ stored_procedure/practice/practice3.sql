DELIMITER //

CREATE PROCEDURE getCusById

(IN cusNum INT(11))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;
call getCusById(175);
DELIMITER //
create procedure getcustomercountbycity(in in_city varchar(50),out total int)
begin
	select count(customername)
    into total
    from customers
    where city=in_city;
END //
DELIMITER ;



call getcustomercountbycity('lyon',@total);
select @total;

delimiter //
create procedure setcounter(inout counter int, in inc int)
begin
set counter =counter+inc;
end//
delimiter ;

set @counter=1;
call setcounter(@counter,1);
call setcounter(@counter,1);
call setcounter(@counter,5);
select @counter;
call setcounter(@counter,1);

