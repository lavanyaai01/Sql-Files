use ai_lavanya;
show databases;
create table AD_User_Reg 
(User_Id int not null primary key Auto_Increment, First_Name varchar(200) not null, Middle_Name varchar(50), Last_Name varchar (50) not null, DOB date,Phone_No long, User_Name varchar(10) not null unique, Password varchar(18) not null);
show tables;
create table AD_User_Login
(Login_id int not null primary key, User_Name varchar(10) not null unique, Password varchar(18) not null, New_Password varchar(18), User_Id int not null,foreign key (User_Id) references AD_User_Reg (User_Id));
show tables;
create table AD_User_Order
(Order_id int not null primary key, Product_Name varchar(100) not null, Product_Price double not null, Product_Quantity int not null, Delivery_Address varchar(255) not null, User_Id int not null, Login_Id int not null, foreign key (User_Id) references AD_User_Reg (User_Id), foreign key (Login_Id) references AD_User_Login(Login_Id));
show tables;
insert into AD_User_Reg values (5,'Hari','','Durai','2003-11-24','9215687315','hari11','password11');
select * from AD_User_Reg;
insert into AD_User_Login values (10,'archana12','password12','password08',1),(11,'deepa12','password07','password08',2),(12,'karthick10','password10','',3),(13,'nithya04','password04','',4),(14,'hari11','password11','password24',5);
select * from AD_User_Login;
insert into AD_User_Order values (100,'Mobile',30000,1,'Chidambaram',1,10),(101,'Watch',1000.505,1,'Chennai',2,11),(102,'Saree',10000,5,'Madurai',3,12),(103,'Earings',300,10,'Trichy',4,13),(104,'Sofa',6700,1,'Pudhukottai',5,14);
select * from AD_User_Order; 
select * from AD_User_Reg left join AD_User_Login on AD_User_Reg. User_Id = AD_User_Login. User_Id;   
alter table AD_User_Order add column created_by varchar (50), add column modify_by varchar (50), add column created_on date;
update AD_User_Order set Product_price = 6700 where Order_Id=104;
select * from AD_User_Reg U1, AD_User_Login L1;
select * from AD_User_Reg U1 left join AD_User_Login L1 on U1.User_Id = L1.User_Id;
select * from AD_User_Login L1, AD_User_Order O1;
select * from AD_User_Login L1 left join AD_User_Order O1 on L1.User_Id = O1.User_Id;
update AD_User_Order set modify_by =
case Order_id
when 100 then 'Archana'
when 101 then 'Deepa'
when 102 then 'Karthick'
when 103 then 'Divya'
when 104 then 'Nithya'
end, 
update AD_User_Order set created_on =
case Order_id
when 100 then '2023-12-28'
when 101 then '2022-05-30'
when 102 then '2023-11-25'
when 103 then '2023-10-31'
when 104 then '2023-09-16'
end
alter table AD_User_Order add column modified_on date;
update AD_User_Order set modified_on = 
case Order_id
when 100 then '2023-12-28'
when 101 then '2022-05-30'
when 102 then '2023-11-25'
when 103 then '2023-10-31'
when 104 then '2023-09-16'
end
describe AD_User_Login; 
                           