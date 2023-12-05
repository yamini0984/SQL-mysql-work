# Final account balance of each UserId

Select
UserId
,Sum(case when TransactionType = 'Deposit' then Amount else 0 end) - 
(Sum(case when TransactionType = 'Withdraw' then Amount else 0 end)) as Balance
from paypal.accountmaster
Group by UserId ;

Select
UserId
,Sum(case when TransactionType = 'Deposit' then Amount else -Amount end) as Balance
from paypal.accountmaster
Group by UserId ;

# Inner join
# Left join
# Right Join
# Full Join
# Cross Join

Create database HR ;

Use HR ;

Create table hr.employees
(
EmployeeId int primary key AUTO_INCREMENT
,Employee varchar(500)
,GenderId int
,DepartmentId int
,CityId int
,HireDate datetime
,Phone char(10)
,Email varchar(500)
,Salary double
) ;

Create table hr.Gender
(
GenderId int primary key auto_increment
,Gender varchar(500)
) ;

Create table hr.City
(
CityId int primary key auto_increment
,City varchar(500)
) ;

Create table hr.Department
(
DepartmentId int primary key auto_increment
,Department varchar(500)
);

Alter table hr.employees
add constraint Fk_Employees_GenderId
Foreign key(GenderId) REFERENCES Gender(GenderId);

Alter table hr.employees
add constraint Fk_Employees_CityId
Foreign key(CityId) REFERENCES City(CityId);

Alter table hr.employees
add constraint Fk_Employees_DepartmentId
Foreign key(DepartmentId) REFERENCES Department(DepartmentId);

# Make Phone and email columns unique by creating constraint

Alter table hr.employees
add constraint UK_Employees_Phone
Unique(Phone) ;

Alter table hr.employees
add constraint UK_Employees_Email
Unique(Email) ;

# Ensure that phonenumber will take 10 characters only (no alphabets)

Alter table hr.employees
add constraint Ck_Employees_Phone
Check(Length(Phone) = 10 and Phone not regexp '[A-Z]');

# Email should have @ and gmail.com 

Alter table hr.employees
add constraint Ck_Employees_Email
Check(Email like '%@gmail.com');

Alter table hr.employees
drop constraint Ck_Employees_Email ;

# Create database by name APP
# Create table Users(UserId,UserName,LoginId(text),Password,Email,CountryId,PlanId,Rating)
# Create table Plan(PlanId,Plan)
# Create table Country(CountryId,Country,RegionId)
# Create table Region (RegionId,Region)
# Fk - CountryId,PlanId .. RegionId in Country
# Unique - LoginId,Password,Email
# Plan in plan table should have values A - D
# Password should be having min length 6 chars and contain atleast one number,one text and one special character
# LoginId should be six characters exactly, first 3 characters should be numbers,last three characters should be text
# Rating should be 1-5 only


