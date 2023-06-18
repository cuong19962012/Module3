use quanlisinhvien;

select address,count(studentid) as `số lượng học viên`
from student
group by address;

select s.studentid,s.studentname,avg(m.mark)
from student s join mark m on s.studentid=m.studentid
group by s.studentid,s.studentname;

select s.studentid,s.studentname,avg(Mark)
from student s join mark m on s.studentid=m.studentid
group by s.studentid,s.studentname
having avg(Mark) >15;

select s.studentid,s.studentname,avg(m.mark)
from student s join mark m on s.studentid=m.studentid
group by s.studentid,s.studentname
having avg(m.mark) >= all(select avg(mark) from mark group by mark.studentid);

