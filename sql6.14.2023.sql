# 3. Display the list of films which is second part of that movie series

Select
Title
from movies.film 
Where Title like '% 2%' or (Title like '% II%' and Title not like '% III%') ;

# 4. Use Employees Database,display the list of non full time employees hired between 2000-1-1 to 2000-12-31 with
#       Salary more than 80000

Select
First,Last,Status,HireDate,Salary
from employees.employees
Where Status != 'Full Time' and HireDate between '2000-1-1' and '2000-12-31' and Salary > 80000;

# 5. Display the list of films not containing the words star,king,die

Select
Title
from movies.film
where Title not like '%Star%' and Title not like '%King%' and Title not like '%Die%' ;

# 6. Display the list of films starting with E and ending with E

Select
Title
from movies.film
Where Title like 'E%E' ;

# 7. Display the list of films starting with C or H but end with od

Select
Title
from movies.film
where Title like 'C%od' or Title like 'H%od' ;

Select
Title
from movies.film
where (Title like 'C%' or Title like 'H%') and Title like '%od' ;

# 8. Display the list of all full time employees and only those contract employees with Jobrating 1

Select
First,Last,Status,Jobrating
from employees.employees
Where Status = 'Full Time' or (Status = 'Contract' and Jobrating = 1);

Select
First,Last,Status
from employees.employees
Where Status in ('Full Time','Contract');

Select
First,Last,Status
from employees.employees
Where Department like '%Time%' or Status like '%H%' ;

# Regexp (pattern matching, it is like contains filter in excel)

# ^ (Starts with)
# $ (ends with)
# | (or)
# [] (range of values)
# {} (repeat n times)

Select
Title
from movies.film
Where Title regexp 'Star' ;

Select
Title
from movies.film
Where Title regexp '^Star' ;

Select
Title
from movies.film
Where Title regexp 'Stars$' ;

Select
Title
from movies.film
Where Title regexp 'Star|King|Die' ;

Select
Title
from movies.film
Where Title regexp 'Star|King$|^Die' ;

Select
Title
from movies.film
where Title regexp 'x|y|z' ;

Select
Title
from movies.film
where Title regexp '[xyz]' ;

Select
Title
from movies.film
where Title regexp '[uvwxyz]' ;

Select
Title
from movies.film
where Title regexp '[u-z]' ;

Select
Title
from movies.film
where Title regexp 'Star' ;

Select
Title
from movies.film
where Title regexp '[Star]' ;

Select
Title
from movies.film
where Title regexp '[0-9]';

Select
Title
from movies.film
where Title regexp '[xyz]$' ;

Select
Title
from movies.film
where Title regexp 'r{2}';

# 1. Display the list of films starting with vowels (aeiou) but not ending with vowels(aeiou)

Select
Title
from movies.film
Where Title regexp '^[aeiou]' and Title not regexp '[aeiou]$' ;

# 2. Display the list of films containing only numbers

Select
Title
from movies.film
where Title not regexp '[A-Z]' ;

# 3. Display the list of Hit films with 0 repeated atleast 2 times in a word

Select
Title
from movies.film
where Title regexp '0{2}' and BoxOfficeDollars > BudgetDollars ;

# 4. Display the list of films starting with c or h but ending with od

Select
Title
from movies.film
where Title regexp '^[ch]' and Title regexp 'od$' ;

# 5. Display the list of films starting with number but not ending with number

Select
Title
from movies.film
where Title regexp '^[0-9]' and Title not regexp '[0-9]$';

# 6. Display the list of films starting with number or ending with x,y,z or containing the word King

Select
Title
from movies.film
where Title regexp '^[0-9]|[xyz]$|King' ;





