create database leisure;
use leisure;
create table Course(courseID int primary key, cLevel int, sessions varchar(15), instructor varchar(30), startDate date, lessonTime time);
Drop table Course;
create table Lessons (lessonsID int primary key, courseID int not null,  foreign key (courseID) references  Course(courseID), memberID int not null,  foreign key (memberID) references  Members(memberID) );
create table Members(memberID int primary key, firstName varchar(15), surName varChar(15), DOB date, address varchar(50), city varchar(20));
use leisure;
show tables;
desc lessons;
desc Course;
drop table Lessons;
drop table Members;

_
insert into Course values(1,2,'morning','Aparna Shankar','2023-08-08', '09:30:30');
SELECT instructor as Firstname from Course where string_split(instructor, ' ');
SELECT Split (instructor, ",", 1) AS SplitString , courseID from Course;
insert into Course values(4,3,'afternoon','Sahaana Shankar','2023-09-08', '12:30:30');
insert into Course values(2,2,'afternoon','Vignesh Shan','2023-10-08', '01:30:30');
insert into Course values(3,2,'morning','Viswa Sridar','2024-08-08', '11:30:30');
insert into Course values(6,2,'morning','Nithyasree Ganesh','2022-08-08', '09:30:30');
insert into Course values(10,6,'morning','Aparna Shankar','2023-09-08', '09:30:30');
insert into Course values(11,4,'afternoon','Aparna Shankar','2024-10-08', '12:30:30');

insert into Course values(7,3,'evening','Viswa Naga','2024-08-08', '17:30:30');
insert into Course values(8,3,'evening','Nithyasree Ganesh','2024-08-08', '17:30:30');

select * from Course;
use leisure;
select * FROM Members;
insert IGNORE into Members values('s988','Kavitha','Kavyan','1992-07-19','12, Brompton road','Neasden'),(1015,'Ruth','Shiv','1982-09-16','18, Chruch road','Alperton');
insert into Members values(1003,'Nithima','Ganesh','2003-07-16','15, Temple road','Kailash');
insert into Members values(1020,'Ram','Raj','1998-10-16','45, Crompton road','Croydon');
insert into Members values(1000,'Shiv','Thandav','1986-09-16','22, Chaplin road','Wembley');
insert into Members values(1009,'Krish','Ram','1989-07-16','25, Ranelagugh road','Wembley');
insert into Members values(1011,'John','Arphan','1982-07-26','19, Napier Road','Wembley');
insert into Members values(1012,'Krish','Arun','1989-07-16','25, Ranelagugh road','Wembley');
insert into Members values(1013,'John','Thoppa','1982-07-26','19, Napier Road','Wembley');


select * from Members;
desc lessons;
insert into lessons values(5001,2,1004), (5002,1,1002),(5003,2,1004),(5004,1,1002),(5005,3,1003),(5006,3,1005);
select * from lessons;
------A.1.select courseID <5 and name of any of instructor-------
select * from Course where courseID < 5 and instructor='Aparna Shankar';

-----2.where course id equals to above 5 and lesson time in the morning or afternoon.------
select * from Course where courseID>5 and (sessions='morning' or sessions='afternoon');

------B.1.order by start date in course table-----
select * from Course order by startDate asc;
------order by memberid in Members table;-------
select * from Members order by memberID asc;
Desc Members;
----C.UPDATE-----
------1.Members table change the address of any three members------
 UPDATE Members SET  address = '34, Swinderby road', city='Wembley' WHERE MemberID= 1001;
  UPDATE Members SET  address = '68, Napier road', city='Eastham' WHERE MemberID= 1004;
 UPDATE Members SET  address = '98, Norton road', city='Croydon' WHERE MemberID= 1006;

-------2.Change startdate and lesson time for three of the sessions---------

UPDATE Course SET startDate  = '2023-09-09', lessonTime='09:00:00' WHERE sessions='morning';
UPDATE Course SET startDate  = '2023-10-01', lessonTime='12:00:00' WHERE sessions='afternoon';
UPDATE Course SET startDate  = '2023-10-05', lessonTime='17:00:00' WHERE sessions='evening';

 
------D. Use the sql min() and max() functions to return the smallest and largest value -----
-------1.of the lessonid column in the lesson table--------
select min(lessonsID) as 'mininum of lesson ID', max(lessonsID) as 'maximum of lessonID' from lessons;
-------2. of the memberid column in the member table--------
select min(memberID) as 'mininum of Member ID', max(memberID) as 'maximum of MemberID' from Members;

---E. Use the sql count(),AVG(),and sum() function for these------
---1.count the total number of members in the members table-----
select count(*) as 'total number of members' from Members;
---2..count the total number of sessions in the members table-----
select  count(distinct sessions) as 'total number of sessions' from Course;
---3.Find the average session time for all sessions in course table-----
select * from Course;
Select count(sessions) as 'session time',sessions from Course group by sessions ;
--Find all people from the members table whose last name starts with A---
select concat(firstNAme,surName) as 'Members' from Members where surName like 'A%';
--Find all people from the members table whose last name ends with A---
select * from Members;
select * from lessons;
select concat(firstNAme,surName) as 'Members' from Members where surName like '%a';
--Find all people from the members table whose have ab in any in the last name---
select concat(firstNAme,surName) as 'Members' from Members where surName like '%ab%';
--Find all people from the members table whose have b in the second position in the first name ---
select concat(firstNAme,surName) as 'Members' from Members where  firstName like '_b%';

--Find all people from the members table whose last name starts with A and are atleast 3 characters in length---
select concat(firstNAme,surName) as 'Members' from Members where surName like 'a__%';
Find all people from the members table whose last name starts with A and end with y---
select concat(firstNAme,surName) as 'Members' from Members where surName like 'a%y';
--Find all people from the members table whose last name ends with A---
--Find all people from the members table whose last name ends with A---
Find all people from the members table whose last name does not starts with A and end with y---
select concat(firstNAme,surName) as 'Members' from Members where surName not like 'a%y';
--what do you understand by left and right join explain with an example----
--leftJoin--
----The LEFT JOIN command returns all rows from the left table, and the matching rows from the right table. The result is NULL from the right side, if there is no match.---
select Course.courseID,sessions,instructor, startDate,lessonsID from Course left join  lessons on Course.courseID=lessons.courseID;
--returns all the data from course table and the matching field in lesson table.---

--Right Join--
----The Right JOIN command returns all rows from the right table, and the matching rows from the left table. The result is NULL from the left side, if there is no match.---

select lessons.lessonsID,lessons.memberID,Course.courseID from lessons right join  Course on lessons.courseID=Course.courseID;
--returns all the courseID from course table and the matching field in lesson table.---


