use ipl;

Select
Team_Name
,Count(distinct Player_name) as Count_of_Captains
,group_concat(distinct Player_Name) as Captainlist
from ipl.Player_match pm inner join ipl.Player p on pm.Player_Id = p.Player_Id
inner join ipl.Rolee r on pm.Role_Id = r.Role_Id
inner join ipl.Team t on pm.Team_Id = t.Team_Id
Where Role_Desc like '%Caption%'
Group by Team_Name
Order by Count_of_Captains desc;

# display total runs scored by player

Select
Player_Name
,Sum(Runs_scored) as TotalRuns
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on
b.Ball_Id = bs.Ball_Id and b.Match_Id = bs.Match_Id and b.Over_Id = bs.Over_Id and
b.Innings_No = bs.Innings_No
inner join Player p on b.Striker = p.Player_Id
Group by Player_Name
Order by TotalRuns desc;

# display player names with most number of sixes
Select
Player_Name
,Count(Runs_scored) as Number_of_Sixes
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on
b.Ball_Id = bs.Ball_Id and b.Match_Id = bs.Match_Id and b.Over_Id = bs.Over_Id and
b.Innings_No = bs.Innings_No
inner join Player p on b.Striker = p.Player_Id
Where Runs_Scored = 6
group by Player_Name
order by Number_of_Sixes desc;

# display highest scoring match details in ipl

Select
Match_Date
,t.Team_Name as TeamA
,t2.Team_Name as TeamB
,Sum(Runs_Scored) as TotalRuns
from ipl.batsman_scored bs inner join ipl.match m on bs.Match_Id =m.Match_Id
inner join ipl.Team t on m.Team_1 = t.Team_Id
inner join ipl.Team t2 on m.Team_2 = t2.Team_Id
group by match_Date,TeamA,TeamB
order by TotalRuns desc;


