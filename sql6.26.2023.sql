
-- 4) Display Players who captained most number of matches 

Select 
Player_Name
,Count(*) as CaptainedMatches
from 
ipl.player_match pm inner join ipl.player p on pm.Player_Id = p.Player_Id
inner join ipl.rolee r on pm.role_id = r.role_id 
where Role_Desc regexp 'Captain'
Group by Player_Name
Order by CaptainedMatches desc ;

# Which Team Produced most captains ,display team name and captains list

Select 
Team_Name
,Count(distinct Player_Name) as CaptainedMatches
,GROUP_CONCAT(distinct Player_Name) as CaptainList
from 
ipl.player_match pm inner join ipl.player p on pm.Player_Id = p.Player_Id
inner join ipl.rolee r on pm.role_id = r.role_id 
inner join ipl.Team t on pm.Team_Id = t.Team_Id
where Role_Desc regexp 'Captain'
Group by Team_Name
Order by CaptainedMatches desc ;

Select 
Team_Name
,Player_Name
,Role_Desc
from 
ipl.player_match pm inner join ipl.player p on pm.Player_Id = p.Player_Id
inner join ipl.rolee r on pm.role_id = r.role_id 
inner join ipl.Team t on pm.Team_Id = t.Team_Id
where Role_Desc regexp 'Captain' ;

# highest runscoring players in IPL

Select
Player_Name
,sum(Runs_scored) as TotalRuns
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on 
b.match_id = bs.match_id and b.over_id = bs.over_id and b.innings_no = bs.innings_no
and b.ball_id = bs.ball_id 
inner join ipl.player p on b.striker = p.player_id
Group by Player_Name 
Order by TotalRuns desc ;

# highest runscoring matches in IPL
#  Output should contain Match_date,Teams Played,Match Score

Select
Match_Date
,t.Team_Name as TeamA
,t2.Team_Name as TeamB
,Sum(Runs_Scored) as TotalRuns
from ipl.batsman_scored bs inner join ipl.match m on bs.match_id = m.match_id
inner join ipl.Team t on m.Team_1 = t.Team_Id
inner join ipl.Team t2 on m.Team_2 = t2.Team_Id
Group by Match_Date,TeamA,TeamB
Order by TotalRuns desc ;

# Display the players who scored most number of sixes in IPL 

Select
Player_Name
,Count(Runs_scored) as Number_of_Sixes
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on 
b.match_id = bs.match_id and b.over_id = bs.over_id and b.innings_no = bs.innings_no
and b.ball_id = bs.ball_id 
inner join ipl.player p on b.striker = p.player_id
Where Runs_Scored = 6
Group by Player_Name 
Order by Number_of_Sixes desc ;

# Department , Highest Salary in that Department ,Employee name who got highest salary

Select
Department
,Max(Salary) as MaxSalary
from employees.employees
Group by Department ;

# Window Functions (Used to find Best in category values)
# Any function used with Over Clause

# Aggregate Functions (Sum,Avg,Count,Max,Min)
# Ranking Functions (Row_number,Rank,Dense_Rank)
# Analytical Functions (Lead,Lag,first_value)

Select
concat(First,' ',Last) as FullName
,Department
,Salary
,Row_number() over (Order by Salary desc) as rw
from employees.employees ;

with dmax as
(
Select
concat(First,' ',Last) as FullName
,Department
,Salary
,Row_number() over (Partition by Department Order by Salary desc) as rw
from employees.employees 
)
Select FullName,Department,Salary
from dmax
where rw = 1;

with ds as
(
Select
concat(First,' ',Last) as FullName
,Department
,Status
,Salary
,Row_number() over (Partition by Department,Status Order by Salary desc) as rw
from employees.employees 
)
Select *
from ds
where rw = 1 ;

# 1. Display the highest grossing movie of every Director along with its title
# 2. Display the highest and lowest salaried employee details of each Department
# 3. Display the youngest player from each country in IPL
# 4. Display 3 longest runtime films in every genre




