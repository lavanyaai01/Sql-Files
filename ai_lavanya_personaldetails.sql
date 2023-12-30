use ai_lavanya;
create table personal_details(
S_No int not null primary key auto_increment,
Name varchar (50),
location varchar(50)
);
select * from personal_details;
delimiter $$
drop procedure if exists personal_details;$$
create procedure personal_details (
in Nameparam varchar(50),
in locationparam varchar(50)
)
begin
insert into personal_details(Name,location) value (Nameparam,locationparam);
end $$
call personal_details('Lavanya','Trichy');

delimiter //
drop procedure if exists singleupdate;//
create procedure singleupdate(
in tablename varchar(200),
in columnname varchar(50),
in valuechange int,
in idname varchar (50),
in idparam varchar(50)
)
begin 
set @statement=concat("update ",tablename," set ",columnname,"=\' ",valuechange,"\' "," where ",idname,"=",idparam);
prepare stmt from @statement;                                        
execute stmt;
end//
delimiter ;
call singleupdate('personal_details','Name','Deepa','S_No',1);
call singleupdate('personal_details','S_No',3,'location','Trichy');
select * from personal_details;
delimiter ##   
drop procedure if exists singledelete;##
create procedure singledelete(
in tablename varchar(50),
in idname varchar(50),
in idparam int 
)
begin
set @statement=concat('delete ','from ',tablename,' where ',idname,'=',idparam);
prepare stmt from @statement;
execute stmt;
end ##
delimiter ;
call singledelete('personal_details','S_No',3);
select * from personal_details;
delimiter &&
drop procedure if exists singleulter;&&
create procedure singleulter(
in tablename varchar(50),
in columnname varchar(50)
)
begin
set @statement=concat('alter table ',tablename,' drop column ',columnname);
prepare stmt from @statement;
execute stmt;
end &&
delimiter ;
call singleulter('personal_details','DOB');
delimiter //
drop procedure if exists singleadd;//
create procedure singleadd(
in tablename varchar(50),
in columnname varchar(50)
)
begin
set @statement=concat('alter table ',tablename,' add column ',columnname,' varchar\ (50\)');
prepare stmt from @statement;
execute stmt;
end //
delimiter ;
 call singleadd('personal_details','location');
select * from personal_details;