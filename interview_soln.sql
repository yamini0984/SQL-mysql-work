with test as
(
Select distinct year as yr
from record
)
,test2 as
(Select 
DISTINCT yr,person
from test cross join record
)
Select 
t.person,
Avg(coalesce(r.salary,0)) as Salary
from test2 t left join record r on concat(t.yr,t.person) = concat(r.year,r.person)
where t.Yr > 2018
Group by t.Person ;

