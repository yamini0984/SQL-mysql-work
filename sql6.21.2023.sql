# Create database by name APP

Create database App ;
Use App ;

# Create table Users(UserId,UserName,LoginId(text),Password,Email,CountryId,PlanId,Rating)

Create table App.Users
(
UserId int primary key auto_increment
,UserName varchar(500)
,LoginId char(6)
,Password varchar(500)
,Email varchar(500)
,CountryId int
,PlanId int
,Rating int 
) ;

# Create table Plan(PlanId,Plan)

Create table App.Plan(PlanId int primary key auto_increment,Plan varchar(100));

Alter table app.Plan
modify column Plan char(1);

# Create table Country(CountryId,Country,RegionId)

Create table App.Country(CountryId int primary key auto_increment,Country varchar(100),RegionId int);

# Create table Region (RegionId,Region)

Create table App.Region(RegionId int primary key auto_increment,Region varchar(500));

# Fk - CountryId,PlanId .. RegionId in Country

Alter table App.Users
add constraint Fk_Users_PlanId
FOREIGN KEY(PlanId) references Plan(PlanId);

Alter table App.Users
add constraint Fk_Users_CountryId
FOREIGN KEY(CountryId) references Country(CountryId);

Alter table App.Country
add constraint Fk_Country_RegionId
FOREIGN KEY(RegionId) references Region(RegionId);

# Unique - LoginId,Password,Email

Alter table App.Users
add constraint UK_Users_LoginId
Unique(LoginId) ;

Alter table App.Users
add constraint UK_Users_Password
Unique(Password) ;

Alter table App.Users
add constraint UK_Users_Email
Unique(Email) ;

# Plan in plan table should have values A - D
ALTER table app.plan
add constraint CK_Plan_Plan
Check(Plan regexp '[A-D]');

# Password should be having min length 6 chars and contain atleast one number,one text and one special character

Alter table app.Users
add constraint Ck_Users_Password
Check(Length(Password) >= 6 and Password regexp '[0-9]' and Password regexp '[A-Z]' and 
(Password regexp '[~!@#%&*()_+\/]' or Password like '%$%' or Password like '%^%' or Password like '%-%'));

# LoginId should be six characters exactly, first 3 characters should be numbers,last three characters should be text

Alter table app.Users
add constraint Ck_LoginId
Check(Length(LoginId) = 6 and LoginId regexp '^[0-9]{3}[A-Z]{3}$');

Alter table app.Users
drop constraint Ck_LoginId ;

# Rating should be 1-5 only

Alter table app.Users
add constraint Ck_Users_Rating
Check(Rating between 1 and 5);

# Insert data into all tables and check whether constraints are working

# Inserting data

Insert into Region(Region)
Values('SouthWest');

INSERT INTO Region VALUES
(DEFAULT, 'East'), 
(DEFAULT, 'West'), 
(DEFAULT, 'North'), 
(DEFAULT, 'South');

SELECT * FROM region;

INSERT INTO country VALUES 
(DEFAULT, 'India', 1), 
(DEFAULT, 'Germany', 3), 
(DEFAULT, 'Australia', 4), 
(DEFAULT, 'USA', 2), 
(DEFAULT, 'Israel', 3), 
(DEFAULT, 'France', 2), 
(DEFAULT, 'Antarctica', 4);

SELECT * FROM country;

INSERT INTO Plan VALUES
(DEFAULT, 'A'), 
(DEFAULT, 'B'), 
(DEFAULT, 'C'), 
(DEFAULT, 'D');

SELECT * FROM plan;

INSERT INTO users VALUES
(DEFAULT, 'Hitesh Sir', '111aaa', '1#Hite', 'Hitesh_Sir@exe.com', 1, 1, 5),
(DEFAULT, 'Krishna Nadar', '112aaa', '1#Kris', 'Krishna@exe.com', 2, 4, 4), 
(DEFAULT, 'Alen XP', '113aaa', '1#Alen', 'Alen@exe.com', 4, 2, 5), 
(DEFAULT, 'John Cartwell', '114aaa', '1#John', 'John@exe.com', 5, 2, 2);

SELECT * FROM users;

# Inserting wrong values for loginid
INSERT INTO users VALUES
(DEFAULT, 'Grobler', 'aaa111', '1#Grob', 'Grobler@exe.com', 1, 1, 5);

# Inserting wrong values for Plan
INSERT INTO Plan VALUES 
(DEFAULT, 'Z');

# Inserting wrong values for Password
INSERT INTO users VALUES
(DEFAULT, 'Krishna Nadar', '112aaa', 'Krish1', 'Krishna@exe.com', 2, 4, 4);

# Update query to modify data

Create table movies.filmcopy as
Select *
from movies.film ;

Create table employees.empcopy as
Select *
from employees.employees ;

Create table movies.filmblank as
Select *
from movies.film 
where 1 = 2;

# Data Analyst
# Data Scientist 
# Data Engineer

# Excel,PowerBI,SQL,

# Python,ETL Tools,Data Science




