# order by
# ascending sort, descending sort, multiple column sort, custom sort

# order by

use employees;
select
concat(First, ' ' ,Last) as fullname
,Status
, Salary
from employees.employees
order by Salary desc limit 5;



select
concat(First, ' ' ,Last) as fullname
,Status
, Salary
from employees.employees
order by Salary desc limit 1 offset 5;

# offset is used to fetch 3rd,4th highest salary,sales cost
# Union used here, it is used between two quaries , it combines and fetch the record as result

select
concat(First, ' ' ,Last) as fullname
,Status
, Salary
from employees.employees
where Status = 'Full time'
union
select
concat(First, ' ' ,Last) as fullname
,Status
, Salary
from employees.employees
where status = 'Contract';

# multiple sort

select
concat(First, ' ' ,Last) as fullname
,Status
, Salary
from employees.employees
order by Department asc, Salary desc; 
# first it will sort department by ascending and  then salary column in descending order

# sort can do by using order by
# sort full time,contract,half-time,hourly

select
concat(First, ' ' ,Last) as fullname
,Status
,case
when Status = 'full time' then 1
when Status = 'contract' then 2
when Status = 'half-time' then 3
else 4
end as sort
from employees.employees
order by sort desc;

select
concat(First, ' ' ,Last) as fullname
,Status
,case
when Status = 'full time' then 1
when Status = 'contract' then 2
when Status = 'half-time' then 3
else 4
end as sort
from employees.employees
order by sort;            # by default sort by ascending order

select
concat(First, ' ' ,Last) as fullname
,Status
,Salary
from employees.employees           # here we removed the sort above query 
order by case                           # column and output will be shown under status 
when Status = 'full time' then 1
when Status = 'contract' then 2
when Status = 'half-time' then 3
else 4
end asc, Salary desc;

# display top 10 highest grossing films (based on boxofficedollars)

select
Title
,BoxOfficeDollars
from movies.film order by BoxOfficeDollars desc Limit 10;

# display top 10 youngest players from India (Country_Name =1)

select 
Player_Name,
Dob from ipl.Player where Country_Name =1 order by Dob desc Limit 10;


select
concat(First, ' ' ,Last) as fullname
,Status
,JobRating
,Salary
from employees.employees
order by case
when Status = 'full time' then 1
when Status = 'contract' then 2
when Status = 'half-time' then 3
else 4
end asc, JobRating asc, Salary desc;

# sort by highest to lowest oscars and then by boxofficedollars in desc

Select
Title
,BoxOfficeDollars,OscarWins
from movies.film
order by OscarWins desc,  BoxOfficeDollars desc


# sort by text title and then alphanumeric title and then by numeric title within each group,
# sort by title again


 Select
Title
from movies.film
order by case
when title not regexp '[0-9]' then 1
when title regexp '[A-Z]' then 2
else 3 
end asc, Title asc;


select 
concat(First, ' ', Last) as Fullname
,Status
,Salary
from employees.employees
order by Salary asc
Limit 1 offset 1;

# 2nd highest and 2nd lowest by row number function 

with ty as
(
select 
concat(First, ' ', Last) as Fullname
,Status
,Salary
,row_number() over (order by Salary asc) as rw
,row_number() over (order by Salary desc) as rh
from employees.employees
)
select * from ty
where rw = 2 or rh = 2;

# column alias we cannot give in where clause
# column alias we can give in group by, order by, having clause

# group by use to get categorywize subtotal, columns.
# sql is used for relational database
#no sql is used for non relational data base

# interview asked questions
# difference between joins and cte[column table expressions]
#group by, having,where to use group by, clusterindex,non-clustered index ,constraints, primay ,foregin key
# joins, windows(),sub query,group by, how to write stored procedure
# how u going to optimized ur query.

#Aggregate function [sum,avg,count,max,min] 

select
count(*) as Number_of_film
, count(BoxOfficeDollars) as CountBO   # this will provide without non null vaues.
from movies.film ;

# count will count only non-null values
# count * will count all values in table column. 

select * from movies.film where BoxOfficeDollars is null;

select
Title,BoxOfficeDollars,BudgetDollars,
case
when BoxOfficeDollars < BudgetDollars then 1
end as status
,BoxOfficeDollars > BudgetDollars as test 
from movies.film;

 select
 Title,BoxOfficeDollars,BudgetDollars,
case
when BoxOfficeDollars >  BudgetDollars then 'hit'
else 'flop'
end as status 
from movies.film;

select
Count(*) as Number_of_films
,Count(BoxOfficeDollars) as countBO
,count(case when BoxOfficeDollars > BudgetDollars then 1 end ) as hits
from movies.film;

select
Count(*) as Number_of_films
,Count(BoxOfficeDollars) as countBO
,count(case when BoxOfficeDollars > BudgetDollars then 1 end ) as hits
,count(case when BoxOfficeDollars < BudgetDollars then 1 end ) as flops
from movies.film;

# here checking null values count from column
select
Count(*) as Number_of_films
,Count(BoxOfficeDollars) as countBO
,count(case when BoxOfficeDollars > BudgetDollars then 1 end ) as hits
,count(case when BoxOfficeDollars < BudgetDollars then 1 end ) as flops
,count(case when BoxOfficeDollars is null or BudgetDollars is null then 1 end) as countNulls
from movies.film;

# count oscar winning films

select
Count(*) as Number_of_films
,Count(BoxOfficeDollars) as countBO
,count(case when BoxOfficeDollars > BudgetDollars then 1 end ) as hits
,count(case when BoxOfficeDollars < BudgetDollars then 1 end ) as flops
,count(case when BoxOfficeDollars is null or BudgetDollars is null then 1 end) as countNulls
,count(case when OscarWins > 0 then 1 end) as countoscars
from movies.film;




use movies;

select 
Title
,BoxOfficeDollars
,BudgetDollars
,case 
when BoxOfficeDollars > BudgetDollars then 1
 end as hit
 ,case when BoxOfficeDollars < BudgetDollars then 1
 end as flop
 ,case when BoxOfficeDollars is null or BudgetDollars is null then 1   # here checking null values
 end as checknull
 , case when OscarWins > 0 then 1 end as oscarwinsfilms
 , avg(BoxOfficeDollars) as avgBO
 , max(BoxOfficeDollars) as maxBO
 , sum(OscarWins) as TotalOscars
from movies.film;

# SUB - QUERY
# we combine 1 or more querries in single query

# find out the list of films which has highest number of oscars in the table 

select max(OscarWins) from movies.film;

select 
Title
,OscarWins
from movies.film
where
OscarWins = (select max(OscarWins) from movies.film);


# display the list of films with runtime more thand average runtime of all films

select 
Title
,RunTimeMinutes
from movies.film
where RunTimeMinutes > (select avg(RunTimeMinutes) from movies.film);


select avg(RunTimeMinutes) from movies.film;

select 
Title
,RunTimeMinutes
,case
when RunTimeMinutes > avg(RunTimeMinutes) then 1
end as avgruntime
from movies.film

# display the list of actors who are younger than the youngest director

# youngest director > 30 years
# actors < 30 years

select 
concat(FirstName, ' ', FamilyName) as fullname
,Dob from movies.actor
where Dob > (select max(Dob) from movies.director);

select 
Department
,Status
,count(*) as Number_of_Emp
from employees.employees
Group by Department           # group by gives unique list of department 
order by Department asc;  

select 
Department
,Status
,count(*) as Number_of_Emp
,avg(Salary) as avgsalary
from employees.employees
Group by Department, Status
order by Department asc;

#filter more than 20 in above

#  filtering is possible for aggregate column in having clause not in where clause

select 
Department
,Status
,count(*) as Number_of_Emp
,avg(Salary) as avgsalary
from employees.employees
Group by Department, Status
having Number_of_Emp > 20
order by Department asc;

# display the count of all employees, count of permanent employees, count of temp emp in each dept

select 
Department
,count(*) as Number_of_Emp
,count(case when status = 'full time' then 1 end) as permanent
,count(case when status != 'full time' then 1 end) as temporay
from employees.employees
group by Department;

select 
Department
,count(*) as Number_of_Emp
,count(case when Status = 'Full Time' then 'P' else 'T' end) as employeestatus
from employees.employees
group by Department;

select count(*) as Number_of_Emp from employees.employees where Status = 'full time' ;

select 
Department
,Status
,case when Status = 'Full Time' then 'P' else 'T' end as employeestatus
from employees.employees;

# average salary of permanent employees and avg salary of temporary employees 

# apart from aggregate column ,rest columns should be in group by clause

select 
Department
,Avg(case when status = 'full time' then Salary end) as Avgpermanent
,Avg(case when status != 'full time' then Salary end) as Avgtemporay
from employees.employees
group by Department
order by Department asc;

 # final account balance of each userId
 
select
UserId, Transactiontype, sum(Amount) as Previous_Balance
,sum(case when Transactiontype = 'Deposit' then Amount else 0 end) -
(sum(case when Transactiontype = 'Withdraw' then Amount else 0 end)) as Updated_Balance
from paypal.accountmaster
Group by UserId;

select
UserId, Transactiontype,
sum(case when Transactiontype = 'Deposit' then Amount else - Amount end) as Balance
from paypal.accountmaster
Group by UserId;

SELECT * FROM movies.film;

select Title, Boxofficedollars,RunTimeMinutes,OscarWins
from movies.film;

select Title,BoxOfficeDollars
from movies.film
where BoxOfficeDollars > 1e9;

select Title, BoxOfficeDollars
from movies.film
where OscarWins >=5;

select Title, BoxOfficeDollars
from movies.film
where BoxOfficeDollars > 1e9 and OscarWins >=0;

select Title, CertificateID
from movies.film
where CertificateID = 1 or certificateid = 2;

select Title, CertificateID
from movies.film
where CertificateID in (1, 2);

#1. display the list of hit films which won oscars also 

select Title, BoxOfficeDollars,BudgetDollars,OscarWins
from movies.film
where BoxOfficeDollars > BudgetDollars and OscarWins > 0;


#2. display the list of films with boxofficedollar > 1e9 and oscars > 0 and certificateid = 1,2

select 
Title, BoxOfficeDollars,BudgetDollars,OscarWins,CertificateID
from movies.film
where BoxOfficeDollars > 1e9 and OscarWins > 0 and CertificateID in (1,2);

#3. display the list of films which has either won oscars or made boxoffice collection more than 1e9

select
Title,BoxOfficeDollars,OscarWins
from movies.film
where BoxOfficeDollars > 1e9 or OscarWins > 0;

#4. display the list of all films except with certificateid 1, 2 and oscarswins > 0

select 
Title,CertificateID,OscarWins
from movies.film
where CertificateID not in (1,2) and OscarWins > 0;

select 
Title,RunTimeMinutes
from movies.film
where RunTimeMinutes between 200 and 250;

select 
Title,RunTimeMinutes
from movies.film
where RunTimeMinutes >= 200 and RunTimeMinutes <= 250;

# like operator ( match patterns, its like contains filter in excel)
# % (zero or any number of character)
# - (single character)

select 
Title
from movies.film
where Title like '%Star%' ;

select 
Title
from movies.film
where Title like '%_a_%' ;

#1. use IPL Display the list of players with word singh in their name and born after 1980

select 
Player_Name, DOB
from ipl.player
where Player_Name like '%singh%' and DOB >= 1980 ;


#2. display the list of flims with exactly four characters in the title

select 
Title from movies.film
where Title like '____' ;

#3. display the list of films which is second part of that movie series

select 
Title
from movies.film
where Title like '%II%' ;

use employees

#4. use employees database, display the list of non full time employees hired between 2000-1-1 to 2000-12-31
#              with salary more than 80000

select 
 First,Last, Status, HireDate,Salary
 from employees.employees
 where Status != 'Full Time' and HireDate between '2000-1-1' and '2000-12-31' and Salary > 80000 ;

#5. display the list of films not containing the word, star, king, die

use movies
select
Title
from movies.film
where Title not like '%star%' and Title not like '%king%' and Title not like '%die%';

#6. display the list of films start with e and ending with e

select
Title
from movies.film
where Title like 'E%E';

#7. display the list of films start with c or h but end with od
select
Title
from movies.film
where Title like 'C%od' or Title like 'H%od';

select
Title
from movies.film
where (Title like 'C%od' or Title like 'H%od') and Title like '%od';


#8. display the list of all full time employees and only those contract employees with jobrating 1

select First, Last, Status, Jobrating
from employees.employees
where Status = 'Full Time' or (Status ='Contract' and Jobrating = 1) ;

# Regexp (pattern matching, it is like contains filter in excel)

# ^ ( starts with )
# $ ( ends with  )
# | ( or )
# [] ( range of values)
# {} (repeat n times)

select 
Title
from movies.film
where Title regexp 'Star' ;

select 
Title
from movies.film
where Title regexp '^Star' ;

select 
Title
from movies.film
where Title regexp 'Stars$' ;

select 
Title
from movies.film
where Title regexp 'Star|King|die' ;

select 
Title
from movies.film
where Title regexp 'Star|King$|^die' ;

select 
Title
from movies.film
where Title regexp '[xyz]' ;  # square brackets letters it will search

select 
Title
from movies.film
where Title regexp 'and' ; # inside quotes it will search for and serially

select 
Title
from movies.film
where Title regexp '[0-9]' ; 


select 
Title
from movies.film
where Title regexp 'r{2}' ;  # letter r reapeated 2 number of times 

# use ipl, display the list of players with the word singh and birthdate after 1980

use ipl

select 
Player_Name, Dob
from ipl.Player
where Player_Name like '%singh%' and Dob >= '1980-01-01' ;

# display the list of films with exactly four characters in the title 

select
Title
from movies.film
where 'Title'  like '%____%' ;


# display the list of second part of that movie
select
Title
from movies.film
where Title like '% 2%' or ( Title like '%II%' or Title not like '% III%' );

#

select 
Title
from movies.film
where Title regexp '[xyz]$' ;  

select 
Title
from movies.film
where Title regexp '2{2}' ;  # 2 repeated as 22


# display the list of films starting with vowels  but not ending with vowels

Select
Title
from movies.film
where Title regexp '^[aeiou]' and Title not regexp '[aeiou]$' ;


# display the list of films containing only numbers

Select
Title
from movies.film
where Title regexp '[0-9]' ;

Select
Title
from movies.film
where Title regexp '[A-Z]' ;

# display the list of hit films with 0 repeated atleast 2 times in a word

 Select
Title
from movies.film
where Title regexp '0{2}' and BoxOfficeDollars > BudgetDollars;

# display the list of films that starting with c or h but ends with od

Select
Title
from movies.film
where Title regexp '^[cḥ]' and Title not regexp '[od]$' ;

# display the list of films that starting with numbers but not ending with numbers

Select
Title
from movies.film
where Title regexp '^[0-9]' and Title not regexp '[0-9]$' ;

# display the list of films that starting with numbers or ending with x,y,z  or containing the word king

Select
Title
from movies.film
where Title regexp '^[0-9]|[xyz]$|king' ;


# ************ if case when - conditional statements in sql 

 

# alter table and add column with datatype
Alter table movies.film
add profit double after BudgetDollars ;

# update table with new column with profit cost 

 use movies
select * from movies.film;

set sql_safe_updates=0;

Update table movies.film
set profit = BoxOfficeDollars-BudgetDollars ;

alter table movies.film
drop column profit ;

# find reminder 

select
Title, RunTimeMinutes,
RunTimeMinutes/60 as hour,
round(RunTimeMinutes/60) as rhour, # converted into whole number
Floor(RunTimeMinutes/60) as fhour, # floor gives number before decimal
ceil(RunTimeMinutes/60) as chour,   # ceil gives number after decimal
RunTimeMinutes % 60 as remainingminutes  # ' % ' mod operator gives reminder number
from movies.film;

# how to concatenate column
select
Title, RunTimeMinutes,
concat(Floor(RunTimeMinutes/60), ' Hours', ' ',
RunTimeMinutes % 60, ' minutes') as Duration      # here where clause is not used, it is not filtering only 
from movies.film;                                  # where clause can filter records from table and gives result

# how to concatenate column

# here where clause is not used, it is not filtering only 
 # where clause can filter records from table and gives result
 
select 
concat (First, ' ' , Last) as FullName,
Status,
If(Status = 'Full Time','Permanent','Temporary') as EmpType  
from employees.employees limit 10;

use employees

select 
concat (First, ' ' , Last) as FullName,
Status,
Salary,
If(Status = 'Full Time',Salary * 1.1, Salary) as NewSalary  
from employees.employees ;

Select Title, Oscarwins,
If(Oscarwins = 0, 'Average Film', If(Oscarwins <= 5, 'Great Film', 'Classic Film')) as MovieType
from movies.film;

# Hike the salary by 10% for all full time employees and only those contract employees with jobrating 1

select 
concat (First, ' ' , Last) as FullName,
Status,
JobRating,
Salary,
If(Status = 'Full Time' or (Status = 'Contract' and jobrating = 1), Salary * 1.1, Salary) as NewSalary  
from employees.employees ;

# hike the salary by 10% for only full time employees hired before 2000 year

select 
concat (First, ' ' , Last) as FullName,
Status,
HireDate,
Salary,
If(Status = 'Full Time' and  hiredate <  2000-1-1 , Salary * 1.1, Salary) as hike 
from employees.employees ; 

# display as classic blockbluster if boxofficedollars more than 1e9 and oscarwins more than zero, else others 

select Title, BoxOfficeDollars, OscarWins,
If(BoxOfficeDollars > 1e9 and OscarWins > 0, 'classic blockbluster' , 'others') as Movietype
from movies.film ;

#  display the text title if title contains only text , else alphanumeric title

select Title,
IF(Title not regexp '[0-9]','text title','alphanumeric') as Movietype
from movies.film ;

# hike the salary by 10% if jobrating is 4 or more, by 5% if jobrating is 2-3 , else same salary

use employees ;
select 
concat(First, ' ', Last) as FullName, JobRating,
IF(JobRating =>4,Salary*1.1,IF(JobRating >=2,Salary*1.05,Salary)) as NewSalary
from employees.employee ;

# display old actor if actor dob before 1970, middle aged actor if actor dob 1970-1990, else young actor 

select
concat(FirstName, ' ', FamilyName) as fullname
, Dob,
if(DoB < '1970-1-1','old actor',if(DoB < '1990-1-1','middle aged actor', 'young actor')) as agestatus
from movies.actor ;


# display the short film if RunTimeMinutes less than 100, Avg Length film if RunTimeMinutes 100-160, else long film

use movies;

Select Title, RunTimeMinutes, 
IF(RunTimeMinutes < 100, 'Short Film', IF(RunTimeMinutes< 160, 'short film','Long Film')) as MovieType
from movies.film;

 in my sql - full join is not work in mysql


create database HR;
use HR;
create table hr.employees
(
EmployeeId int primary key auto_increment,
Employee varchar(500),
GenderId int,
DepartmentId int,
CityId int,
Hiredate datetime,
phone char(10),
Email varchar(500),
Salary double
);

create table hr.Gender
(
GenderId int primary key auto_increment,
Gender varchar(500)
);

create table hr.City
(
CityId int primary key auto_increment,
City varchar(500)
);

create table hr.Department
(
DepartmentId int primary key auto_increment,
Department varchar(500)
);

alter table hr.employees
add constraint FK_employees_GenderId
foreign key(GenderId) references Gender(GenderId);

alter table hr.employees
add constraint FK_employees_CityId
foreign key(CityId) references City(CityId);

alter table hr.employees
add constraint FK_employees_DepartmentId
foreign key(DepartmentId) references Department(DepartmentId);

# make phone and email columns unique by creating constraint

alter table hr.employees
add constraint UK_Employees_phone
unique(phone);

alter table hr.employees
add constraint UK_Employees_Email
unique(Email);

# ensure that the phonenumber will take 10 characters only (no alphabets)

alter table hr.employees
add constraint CK_Employees_phone
Check(length(phone) = 10 and phone not regexp '[A-Z]');

# email should have @ and gmail.com 

alter table hr.employees
add constraint CK_Employees_Email
Check(Email)

create database by name APP

create database APP;
use APP;

create table users(userid, username,loginid(text),password, email,countryid, planid, rating)

create table APP.Users
(
UserID int primary key auto_increment,
UserName varchar (500),
LoginId char(6),
Password varchar(500),
Email varchar (500),
CountryId int,
PlanId int,
RatingId int
);

create table plan(planid, plan)

create table APP.Plan(
PlanId int primary key auto_increment,
Plan varchar (500)
);

create table APP.Country(
CountryId int primary key auto_increment,
Country varchar(500),
RegionID int  
);

create table APP.Region(
RegionId int primary key auto_increment,
Region varchar(500));

alter table APP.Users
add constraint fk_Users_PlanId
foreign key(PlanId) references Plan(PlanId) ;

alter table APP.Users
add constraint FK_Users_CountryId
foreign key(CountryId) references Country(CountryId) ;

alter table APP.Country
add constraint FK_Country_RegionId
foreign key(RegionId) references Country(RegionId) ;

Unique - email, passward, loginid

alter table APP.Users
add constraint UK_Users_LoginId
unique(LoginId) ;

alter table APP.Users
add constraint UK_Users_Password
unique(Password) ;

alter table APP.Users
add constraint UK_Users_Email
unique(Email) ;

# plan table should have A- D

alter table APP.Plan
drop constraint CK_Plan_Plan;

alter table APP.Plan
add constraint CK_Plan_Plan
check(Plan regexp '[A-Z]') ;

# password should have minimum lenth 6 characters and contain atleast one number, one text, and
# one special character

alter table APP.Users
add constraint CK_Users_Password
Check(length(Password) >=6 and Password regexp '[0-9]' and password regexp '[A-Z]' and 
(Password regexp '[~!@#%&*()_+\/]' or password like '%$%' or password like '%^%' or password like '%-%' ));
 
 # loginid should be six characters exactly, first 3 characters should be numbers, 
 # last three characters should be text
 
alter table app.Users
add constraint CK_LoginId
check(Length(LoginId)=6 and LoginId regexp '^[0-9]{3}[A-Z]{3}$');

alter table app.Users
drop constraint CK_LoginId

# rating should be 1-5 only

alter table app.Users
add constraint ck_Users_Rating
check(Rating between 1 and 5);

# insert data into tables and check whether the constraints are working

use APP;
(userid, username,loginid(text),password, email,countryid, planid, rating)

#

INSERT INTO APP.users VALUES(1, 'Krishna Nadar', '111aaZ', '0Krish!45', 'Krishna@gmail.com', 1, 1, 4),
(4, 'Prisha', '222aaZ', 'Raj@5545', 'prisha@gmail.com', 2, 2, 5)
(5, 'Pranjal', '333aaZ', 'Sham*0005', 'pranjal@gmail.com', 3, 2, 5);


insert into region(RegionId, Region) values (1,"India"),(2,"Hydrabad"),(3,"Gujrat"),(4,"Rajastan");


insert into plan(PlanId,Plan) values(default,'prepaid'),(default,'postpaid');

insert into Country values(default,'India',1),(default,'Turkey',2),(default,'Bangladesh',3);
