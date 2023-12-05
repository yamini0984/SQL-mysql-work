
with ct as
(
Select
Year(Hiredate) as Year
,Count(*) as Number_of_Emp
from employees.employees
Group by Year 
)
Select
Year
,Number_of_Emp
,((Number_of_Emp - Lag(Number_of_Emp) over (Order by Year))/Lag(Number_of_Emp) over (Order by Year))*100 as py
from ct ;

# Year ,Quarter , % change in hiring compared to prev quarter in each year

with qt as
(
select quarter(Hiredate) as quarter,year(HireDate) as year
,count(*) as Number_of_Emp
from employees.employees
group by year,quarter
) 
select year,quarter,Number_of_Emp
,((number_of_Emp - lag(Number_of_Emp) over (order by Year,quarter))/lag(Number_of_Emp) over (order by year,quarter))*100 as py
from qt
order by year,quarter;

# Q1 from 2001 with Q1 from 2000

with qt as
(
select quarter(Hiredate) as quarter,year(HireDate) as year
,count(*) as Number_of_Emp
from employees.employees
group by year,quarter
) 
select 
year,
quarter,
Number_of_Emp
,lag(Number_of_Emp) over (order by Year) as py
from qt
order by year,quarter;

# Datetime functions

Select 
curdate() as today
,curtime() as now
,now() as dt
,Year(curdate()) as Yr
,Month(curdate()) as Month
,Quarter(curdate()) as Qtr
,MonthName(curdate()) as MN
,DayName(curdate()) as dy
,date_add(curdate(),Interval -3 Year) as da
,datediff('2024-6-28',curdate()) as df
,timestampdiff(Year,curdate(),'2024-6-28') as tm ;

# Display age of the movie in years and months format 

SELECT 
	Title, 
    Releasedate, 
    CONCAT(
		TIMESTAMPDIFF(YEAR,Releasedate,CURDATE()), 
        ' Years ',
		TIMESTAMPDIFF(MONTH,Releasedate,CURDATE()) % 12, 
        ' Months'
	) Age
FROM 
	movies.film;

SELECT 
	Title, 
    Releasedate, 
    CONCAT(
		TIMESTAMPDIFF(YEAR,Releasedate,CURDATE()), 
        ' Years ',
		TIMESTAMPDIFF(MONTH,Releasedate,CURDATE()) % 12, 
        ' Months'
	) Age
FROM 
	movies.film;
    
    
Select
Title
,ReleaseDate
,fnAge(ReleaseDate) as Age
from movies.film ;

Select
FullName
,Dob
,fnAge(Dob) as Age
from movies.actor ;

Select
FullName
,Dob
,fnAge(Dob) as Age
from movies.Director ;

# Delete the duplicate data(based on department) from employees 

Create table empdup as 
Select *
from employees.employees ;

set sql_safe_updates = 0 ;

with empdup as
(
Select
concat(First,' ',Last) as FullName
,Department
,Row_number() over (Partition by Department Order by Department) as rw
from employees.employees
)
Delete
from empdup
Where rw > 1 ;





