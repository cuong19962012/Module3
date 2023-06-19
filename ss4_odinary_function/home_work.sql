use ss2;
select class.id,class.name,count(student.id) as 'number of student'
from class
left join student on student.class_id=class.id
group by class.id;

select class.id,class.name, max(student.point)
from class
join student on student.class_id=class.id
group by class.id;

select class.id,class.name, avg(student.point)
from class
left join student on student.class_id=class.id
group by class.id;

select student.name,student.birthday
from student
union
select instructor.name,instructor.birthday
from instructor;

select student.id,student.name,student.point
from student
order by student.point desc limit 3;

select student.id,student.name,student.point
from student
where student.point = (select max(student.point) from student);