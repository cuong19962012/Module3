use quanlisinhvien;

select *
from student
where studentname like "h%";

select *
from class
where month(startdate)=12;

SELECT 
    *
FROM
    subject
WHERE
    credit >= 3 and credit<= 5;

SET SQL_SAFE_UPDATES = 0;
update student
set classid=2
where studentname="hung";
SET SQL_SAFE_UPDATES = 1;

select student.studentname,subject.subname,mark.mark
from student
join mark
on student.studentid=mark.markid
join subject
on mark.subid=subject.subid
order by mark.mark desc,student.studentname;
