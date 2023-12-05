# case statement

when condition1 is true then result1
when condition2 is true then result2
else result
end

select
concat(First, ' ',Last) as fullname
,Status,
case
when Status = 'Full Time' Then 'Permanent'
when Status = 'Contract' Then 'Contract'
else 'Terminated'
end as EmpType
from employees.employees ;

select
concat(First, ' ',Last) as fullname
,Status,
case
when Status = 'Full Time' Then Salary*1.1
when Status = 'Contract' Then Salary*1.05
else Salary
end as NewSalary
from employees.employees ;

# hike the salary by 10% for all full time employees and only those contract employees with jobrating 1

select
concat(First, ' ',Last) as fullname
,Status,Salary, JobRating,
case
when Status = 'Full Time' or (Status = 'Contract' and JobRating =1) Then Salary*1.1
else Salary
end as NewSalary
from employees.employees;

# Hike the salary by 10% for only full time employees hired before 2000

select
concat(First, ' ', Last) as fullname
,Status,Salary,HireDate,
case
when Status ='Full Time' and HireDate < '2000-1-1' Then Salary*1.1
else Salary
end as hikesalary
from employees.employees;

# display the classic blockbuster if boxofficedollars more than 1e9 and oscarwins more than zero else others

select
Title, BoxOfficeDollars,OscarWins,
case
when BoxOfficeDollars > '1e9' and OscarWins > '0' Then 'Classic blockbuster'
else 'others' 
end as movietype
from movies.film;

# display the text title if title contains only text, else aphanumeric title

select
Title,
case
when Title not regexp '[0-9]' Then 'Text title'
else 'alphanumeric title'
end as movietype
from movies.film;

# hike the salary by 10% if jobrating is 4 or more, by 5% if jobrating is 2-3, else same salary

select
concat(First, ' ', Last) as fullname
,JobRating,Salary,
case
when JobRating >=4 then Salary*1.1
when JobRating >=2 then Salary*1.05
else Salary
end as newsalary
from employees.employees;

# display text title if title  contains only text, alphanumeric title if it contains text and number,else numeric title

select
Title,
case
when Title not regexp '[0-9]' then 'text title'
when Title regexp '[A-Z]' then 'alpha numeric title'
else 'numeric title'
end as movietype
from movies.film;

#
# without oscar else other

select
Title,
BoxOfficeDollars,
OscarWins,
case
when BoxOfficeDollars > '1e9' and OscarWins >0 then 'classic blockbuster'
when BoxOfficeDollars > '1e9' then 'blockbuster'
else 'others'
end as movietype
from movies.film;

# 

select
concat(First, ' ', Last) as fullname
,HireDate,
case
when HireDate < '1970-1-1' then 'old actor'
when HireDate < '1990-1-1' then 'middle age actor'
else 'young actor'
end as actortype
from employees.employees;
























