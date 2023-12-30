use ai_lavanya;
create table student_table (Reg_no int not null primary key, Name varchar (50),Age int,Location varchar (50),Gender varchar(50));
show tables;
insert into student_table (Reg_no,Name,Age,Location,Gender) values (101,'Hari',20,'Banglore','Male'),(102,'Divya',19,'VNR','Female'),(103,'Archana',18,'Chidambaram','Female'),(104,'Karthick',16,'Madurai','Male'),(105,'Deepa',16,'VNR','Female');
select * from student_table;
alter table student_table add column Phone_no long;
update student_table set Phone_no =
case Reg_no
when 101 then '9845637850'
when 102 then '8945812357'
when 103 then '9988256874'
when 104 then '9215781369'
when 105 then '8549235782'
end 
select * from student_table where location = 'VNR';
select * from student_table where Age between 14 and 18;
delimiter //
create procedure s1 ()
begin
select * from student_table;
end //
select * from student_table order by Name ASC;
call s1 ()
select min(Age) from student_table;
select * from student_table where Location = 'VNR' or name like 'K%';
select * from student_table where Location = 'VNR' and name like 'K%';
select * from student_table where Age > 18;

select * from student_table where Location !='Madurai';
select * from student_table where Age not in (16);