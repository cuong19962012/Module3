use quanlisinhvien;

-- 1
select *
from subject
where credit=(select max(credit) from subject);

-- 2
select subject.subid,subject.subname,subject.credit,subject.status,mark.mark
from subject
left join mark on subject.subid=mark.subid
where mark.mark=(select max(mark) from mark);

-- 3

select student.studentid,student.studentname,avg(mark.mark)
from student
left join mark on mark.studentid=student.studentid
group by student.studentid;
 