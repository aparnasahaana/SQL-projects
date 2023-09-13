CREATE DATABASE breakDown;
use breakDown;
create table member (MemberID varchar(10) primary key, MFName varchar(20), MLName varchar(20), MLoc varchar(20));
select * from member;
drop table Vehicle;
create table Vehicle(VehReg varchar(10) primary key, VehMake varchar(10),VehModel varchar(10),MemberID varchar(10));
desc Vehicle;
select * from member;

alter table Vehicle add foreign key(MemberID) references member(MemberID);
create table Engineer (EngID int primary key, EFName varchar(10), ELName varchar(10));
desc Engineer;
create table EngVan(VanReg varchar(10) primary key, vanMake varchar(10),VanModel varchar(10), EngID int, vMileage int); 
alter table EngVan add foreign key(EngID) references Engineer(EngID);
desc EngVan;
create table breakDown(BDID int primary key, VehReg varchar(10),foreign key(VehReg) references Vehicle(VehReg));
alter table breakdown add column(VanReg varchar(10));

desc breakDown;
alter table breakDown add foreign key(VanReg) references EngVan(VanReg);
----Task 2---
insert into member values('M111', 'Arpana', 'Magesh','London'),('M112','Whaley','Bhatt','London'),('M113', 'Jansi', 'Ben','Birmingham'),('M114','White','Victor','Wembley');
insert into member values('M115','Nivan','Shayan','London');
insert into member values('M116', 'Vivaan', 'Shan','Liverpool'),('M117','Nabbya','Patel','Reading'),('M118', 'Neev', 'MaheshKumar','London'),('M119','Trishika','Crunch','Reading');
select * from member;
 show tables;
 desc engineer;
 insert into engineer values(1111,'Nihaal','kukuran'),(1112,'Nihali','karen'),(1113,'Divansh','Sharma'),(1114,'Virali','Ram'),(1115,'Parin','Kumar'),(1116,'AAksh','Rishi'),(1117,'IVAIN','Tamilmani');
 select * from engineer;
desc Vehicle;
insert into Vehicle values('ZB23 CDE','Nissan','Micra','M115'),('AB79 CDE','Nissan','Micra','M111'),('AB59 TYR','Toyota','Avalon','M115'),('ES89 FDS','Ford','E-Transit ','M115'),('DF35 GHF','Honda','Brio','M117');
insert into Vehicle values('SS13 CDE','Nissan','Altima','M116'),('AB33 CDE','Nissan','Micra','M112'),('AB55 TYR','Toyota','Belta','M115'),('ASGS FYT','Ford','Ford GT','M115'),('DFRE GHF','Honda','City','M117');
insert into Vehicle values('ER13 CDE','Nissan','Altima','M111'),('AC33 CDE','Nissan','Micra','M112'),('AC55 TYR','Toyota','bZ3','M115'),('ASKS FGT','Ford','F-150 ','M115'),('DFPE GHF','Honda','Brio','M117');

drop table Vehicle;
select * from Vehicle;
update Vehicle set VehModel='Belta' where VehReg='AB56 TYR' ;
update Vehicle set VehModel='City' where VehReg='DF35 GHF' ;
update Vehicle set VehModel='Ford GT' where VehReg='ASDS ERT' ;
DESC EngVan;
insert into EngVan VALUES('VA34 FGH','Kia','Bongo',1111,1000),('VB84 LOH','Kia','Pregio',1112,80005),('VY34 TYH','Kia','Karnival',1112,800),('VZ34 THH','Hyundai','Grace',1113,2000),('VO64 TGF','Hyundai','H350',1114,3050),('VD64 TGF','Hyundai','Matrix',1115,3750),('VB64 ERF','Tempo','Rapid',1116,2050),('VE23 TRF','Tempo','Wiking',1117,8090),('VC94 KIF','Tempo','Rapid',1117,2050);
select * from EngVan;
DESC breakDown;
select * from Vehicle;
select * from breakDown;
-----Task 3-------
----Perform the following queries----
----1.	The names of members who live in a location e.g. London.-----
select CONCAT(MFName,' ',MLName)AS 'Members' from Member where MLoc = 'London';
2.	All cars registered with the company e.g. all Nissan cars.
select VehReg, VehMake from Vehicle where VehMake='Nissan';
3.	The number of engineers that work for the company.
select count(*) from Engineer;
4.	The number of members registered.
select count(*) from member;
---5.All the breakdown after a particular date-----
select * from breakDown where BDDATE >='2002-10-01';

---6.All the breakdown between 2 dates---------
---******select * from breakDown where BDDATE BETWEEN '2022-01-01' AND '2023-01-01';-    -
select * from breakDown where ( BDDATE >='2002-10-01' AND BDDATE <='2023-10-01');

-----------7.	The number of time a particular vehicle has broken down--------
SELECT COUNT(*),VehReg as 'Vehicle' FROM breakDown group by VehReg;
---------8.	The number of vehicles broken down more than once--------
SELECT COUNT(*) AS 'Total number of Breakdown',VehReg as 'Vehicle' FROM breakDown group by VehReg HAVING (COUNT(*)>1);



-----------------TASK4---------------------------- 
-----------Create the following table:  MshipType: •	MTID(PK), int •	MType, varchar(6), •	MPrice, decimal(4, 2)  
Enter the following data •	1, Gold, 99.99 •	2, Silver, 59.99 	3, Bronze, 39.99--------
CREATE TABLE MshipType(MTID int PRIMARY KEY, MType VARCHAR(6), MPrice decimal(4,2));
desc MshipType;
INSERT INTO MshipType VALUES(1, 'Gold', 99.99),(2, 'Silver', 59.99),(3, 'Bronze', 39.99);
SHOW databases;
USE breakDown;
select * from MshipType;
------TASK 5-------------
------TASK 6-------------
----1.	All the vehicles a member owns.-----
 select * from engineer;
 SELECT VehReg,VehMake,VehModel,member.MFName,member.MLName FROM vehicle INNER JOIN member  ON member.MemberID=vehicle.MemberID where (member.MFName='Arpana' AND member.MLName='Magesh');
----2.	The number of vehicles for each member in descending order.-----
SELECT COUNT(*) AS 'TOTAL NUMBER OF VEHICLE',member.MFName,member.MLName FROM vehicle INNER JOIN member  ON member.MemberID=vehicle.MemberID GROUP BY member.MemberID ORDER BY member.MFName DESC;

3.	The number of vans driven by a particular engineer.
SELECT COUNT(*) AS 'TOTAL NUMBER OF Vans',engineer.EFName,engineer.ELName FROM engvan INNER JOIN engineer  ON engineer.EngID=engvan.EngID GROUP BY engineer.EngID Having (engineer.EFName='Nihali' and engineer.ELName='Karen');

4.	All vehicles that have broken down in a particular location along with member details.
SELECT * FROM breakDown;
SELECT vehicle.VehReg,VehMake,VehModel,member.MFName,member.MLName,breakDown.BDLoc from vehicle join breakDown ON vehicle.VehReg=breakDown.vehReg join member on member.MemberID=vehicle.MemberID where breakDown.BDLoc='Wembley';
insert into breakDown values(5014,'SS13 CDE','VZ34 THH', '2023-01-03','03:10:20','Wembley');
5.	A list of all vehicles that broke down along with the member details and the engineer who attended

SELECT vehicle.VehReg,member.MFName,member.MLName,engineer.EFName,engineer.ELName from breakDown 
INNER JOIN vehicle ON breakDown.VehReg=vehicle.VehReg 
INNER JOIN member on member.MemberID=vehicle.MemberID 
INNER JOIN engvan ON breakDown.VanReg=engvan.VanReg 
INNER JOIN engineer ON engvan.EngID=engineer.EngID; 


----short cut----
SELECT b.BDID,v.VehReg,m.MFName,m.MLName,e.EFName,e.ELName from breakDown b
INNER JOIN vehicle v ON b.VehReg=v.VehReg 
INNER JOIN member m on m.MemberID=v.MemberID 
INNER JOIN engvan ON b.VanReg=engvan.VanReg 
INNER JOIN engineer e ON engvan.EngID=e.EngID; 

6.	A list of all breakdown along with member and engineer details between two dates.
SELECT b.BDID,b.BDDATE,v.VehReg,m.MFName,m.MLName,e.EFName,e.ELName from breakDown b 
INNER JOIN vehicle v ON b.VehReg=v.VehReg 
INNER JOIN member m on m.MemberID=v.MemberID 
INNER JOIN engvan ON b.VanReg=engvan.VanReg 
INNER JOIN engineer e ON engvan.EngID=e.EngID  HAVING ( BDDATE >='2002-10-01' AND BDDATE <='2023-10-01'); 
UPDATE breakDown  SET YEAR(BDDATE)='2022' WHERE YEAR(BDDATE)='2002';

7.	A further 3 relational queries of your choice that are meaningful to the company.
select * from engvan;
ALL THE VAN DETAILS ASSIGNED TO given ENGINEER.
SELECT * FROM engvan ev LEFT JOIN engineer e on ev.EngID=e.EngID WHERE e.EFName='Nihali' and e.ELName='Karen';
TOTAL NUMBER OF MILEAGE DRIVEN BY A GIVEN ENGINEER.
SELECT SUM(VMileage) AS 'TOTAL NUMBER OF MILEAGE',e.EFName,e.ELName FROM engvan ev LEFT JOIN engineer e on ev.EngID=e.EngID GROUP BY e.EngID;
TOTAL NUMBER OF TIME ATTEMPTED BY THE VAN IN BETWEEN GIVEN DATES
----not working----
SELECT COUNT(ev.VanReg) AS 'total number of time the van used',b.VanReg,ev.VanReg,ev.VanMake,ev.VanModel FROM breakDown b
INNER JOIN  engvan ev ON b.VanReg=ev.VanReg group by ev.VanReg HAVING b.BDDATE >='2002-10-01' AND b.BDDATE <='2023-10-01';
------TASK 7-------------
create database explain AVG,SUM,MIN AND MAX.
CREATE DATABASE gym;
USE gym;
drop table member;
create table member(mID int primary key, MFName varchar(15),MLName varchar(15));
Alter table member ADD COLUMN sDate DATE AFTER MLName;
desc member;
INSERT INTO member VALUES(1111,'Aparna','Shankar','2021-11-13'),(1112,'Sahaana','Krish','2022-10-22');
INSERT INTO member VALUES(1113,'Arpan','Singh','2020-01-23'),(1114,'Shayan','Krish','2023-05-22'),(1115,'Arun','Mahesh','2019-05-05');
INSERT INTO member VALUES   (1116,'Meena','Sandru','2022-11-13'),(1117,'Nirvan','Neev','2018-10-22');
----Total number of members registed within the GYM-----
SELECT COUNT(*) FROM member;



drop table trainer;
create table trainer(tID int primary key,tFName varchar(15),tLName varchar(15),tSalary decimal(7,2));
create table class(cID varchar(6) primary key,tID int, foreign key (tID) references trainer(tID) ON DELETE CASCADE,cDate DATE, cTime TIME);
desc trainer;
------TASK 8-------------

show tables;
