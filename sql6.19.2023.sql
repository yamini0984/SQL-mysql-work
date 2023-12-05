# Aggregate functions (Avg,Count,Max,Min,Sum)

Select
Count(*) as Number_of_Films
,Count(BoxofficeDollars) as CountBO
,Count(case when BoxofficeDollars > BudgetDollars then 1 end) as Hits
,Count(case when BoxofficeDollars < BudgetDollars then 1 end) as Flops
,Count(case when BoxofficeDollars is null or BudgetDollars is null then 1 end) as CountNulls
,Count(case when OscarWins > 0 then 1 end) as CountOscars
,Avg(BoxofficeDollars) as AvgBO
,Max(BoxofficeDollars) as MaxBO
,Sum(OscarWins) as TotalOscars
,Count(OscarWins) as Countall
from Movies.Film ;

# Count only oscar winning films

Select *
from movies.film 
Where BoxofficeDollars is null;

Select
Title
,BoxofficeDollars
,BudgetDollars
,OscarWins
,case
when BoxofficeDollars > BudgetDollars then 1
end as Hit
,case
when BoxofficeDollars < BudgetDollars then 1
end as Flop
,Case
when BoxofficeDollars is null or BudgetDollars is null then 1
end as checknull
,Case
when OscarWins > 0 then 1
end as  Oscars
from movies.film ;

# Find out the list of films which has highest number of oscars in the table

Select
Title,OscarWins
from movies.film
Where OscarWins = 11 ; 

Select
Title,OscarWins
from movies.film
Where OscarWins = (Select Max(OscarWins) from movies.film) ;

# Display the list of films with runtime more than average runtime of all films

Select
Title,RunTimeMinutes
from movies.film
Where RunTimeMinutes > (Select Avg(RunTimeMinutes) from movies.film) ;

# Display the list of actors who are younger than the youngest Director

# Youngest Director - 30 Years
# Actors < 30 Years

Select
concat(FirstName,' ',FamilyName) as FullName
,Dob
from movies.actor
Where Dob > (Select Max(Dob) from movies.Director) ;

Select
Department
,Count(*) as Number_of_Emp
,Avg(Salary) as AvgSalary
from employees.employees
Group by Department
Order by Department asc ;

Select
Department
,Status
,Count(*) as Number_of_Emp
,Avg(Salary) as AvgSalary
from employees.employees
Group by Department,Status
Order by Department ;

# Display the count of all employees,Count of permanent employees,count of temp emp in each dept

Select
Department
,Count(*) as Number_of_Emp
,Count(case when status = 'Full Time' then 1 end) as PermanentEmp
,Count(case when status != 'Full Time' then 1 end) as TemporaryEmp
from employees.employees
Group by Department ;

Select
Department
,Count(*) as Number_of_Emp
,Count(case when status = 'Full Time' then 'P' else 'T' end) as PermanentEmp
from employees.employees
Group by Department ;

Select
Department
,Status
,case when status = 'Full Time' then 'P' else 'T' end as PermanentEmp
from employees.employees ;

# Avg Salary of Permanent Employees and Avg Salary of Temporary employees by Dept

Select
Department
,Avg(case when Status = 'Full Time' then Salary end) as Avgp
,Avg(case when Status != 'Full Time' then Salary end) as Avgt
from employees.employees
Group by Department
Order by Department asc ;

# Final account balance of each UserId


