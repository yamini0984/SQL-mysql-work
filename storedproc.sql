SELECT * FROM app.users;

use app;

# Updated student table column through status

create table app.student(
studentID int,
  Name varchar(255),
  Marks int,
  status varchar(20));
 
 drop table student;
 
insert into app.student (studentID, Name, Marks, status) values(1,'Ira',25,null),
(2,'Isha',60,null),(3,'Imli',85,null),(4,'Imu',75,null);

set sql_safe_updates=0;

update table student set status = null;

insert into student values(5,'ila',45, null);
insert into student values(6,'Ika',20,null);
select * from app.student;