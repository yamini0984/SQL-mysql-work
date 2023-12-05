# 1. Display the highest grossing movie of every Director along with its title

with dmax as
(
Select 
FullName,
title,
Boxofficedollars,
Row_number() over (Partition by fullname order by Boxofficedollars desc) as Rw
from movies.director d inner join movies.film f
on d.directorID = f.directorID
)
Select FullName,
title,
Boxofficedollars
from dmax
where rw = 1
Order by BoxofficeDollars desc;

# 2. Display the highest and lowest salaried employee details of each Department

with dr as
(
Select 
concat(first," ",last) as FullName,
Department,
Salary,
Row_number() over (Partition by Department order by Salary desc) as RH
,Row_number() over (Partition by Department Order by Salary asc) as RL
from employees.employees
)
Select 
FullName,
Department,
Salary
from dr
where rh = 1 or rl = 1 ;

# 3. Display the youngest player from each country in IPL

with cy as
(
Select p.player_name,
p.DOB as Youngest,
c.Country_name,
Row_number() over (Partition by Country_Name order by DOB desc) as RY
from ipl.player p inner join ipl.country c
on p.country_name = c.Country_ID
)
Select *
from cy
where ry = 1;

# 4. Display 3 longest runtime films in every genre
with DRRTM as 
(
Select
Genre
,Title
,Runtimeminutes
,Row_number() over (Partition by Genre order by Runtimeminutes desc) as Rw
from movies.film f inner join movies.genre g
on f.genreID = g.GenreID
)
Select * from DRRTM Where Rw <=3;

# Display Top 3 highest runscoring players from every country in IPL

Delete from movies.film
where BoxofficeDollars is null ;

with nt as
(
Select
Player_Name
,c.Country_Name 
,Sum(Runs_scored) as TotalRuns
,Row_number() over (PARTITION BY c.Country_Name Order by Sum(Runs_Scored) desc) as rw
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on 
b.match_id = bs.match_id and b.over_id = bs.over_id and b.innings_no = bs.innings_no
and b.ball_id = bs.ball_id 
inner join ipl.player p on b.striker = p.player_id
inner join ipl.Country c on p.Country_Name = c.Country_Id
Group by Player_Name,c.Country_Name
) 
Select *
from nt
where rw <=3 ;
# Playername ,TotalRunscored,Country

# Difference between row_number ,rank and dense_Rank

with tie as
(
Select 
concat(First,' ',Last) as FullName
,Salary
,Row_number() over (Order by Salary desc) as rw
,Rank() over (Order by Salary desc) as rnk
,Dense_Rank() over (Order by salary desc) as drnk
from employees.employees
Order by salary desc 
)
Select *
from tie
where drnk <=3 ;

# Display the list of films in each genre with runtime more than avg runtimeminutes of all films in that genre

with gt as
(
Select
Title
,Genre
,RunTimeMinutes
,Avg(RunTimeMinutes) over (Partition by Genre) as AvgRunTime
from movies.film f inner join movies.Genre g on f.GenreId = g.GenreID 
)
Select *
from gt
where RunTimeMinutes > AvgRunTime ;

# Display the list of films in each year with runtime more than avg runtimeminutes of all films in that year

with gt as
(
Select
Year(ReleaseDate) as Year
,RunTimeMinutes
,Avg(RunTimeMinutes) over (Partition by Year(ReleaseDate)) as AvgRunTime
from movies.film
)
Select *
from gt
where RunTimeMinutes > AvgRunTime ;

# display Year wise % change in hiring

# 2008     100
# 2009     200    100%
# 2010     300    70%

Select
EmployeeId
,concat(First,' ',Last) as FullName
,Salary
,Lead(Salary) over (Order by EmployeeId) as ld
from employees.employees ;

Select
EmployeeId
,concat(First,' ',Last) as FullName
,Salary
,Lag(Salary) over (Order by EmployeeId) as ld
from employees.employees ;



