# Joins

-- 1) Title & Genre 

SELECT 
	f.Title, 
    g.Genre 
FROM 
	movies.film f 
INNER JOIN 
	movies.genre g ON 
		f.genreid = g.genreid;

-- 2) Title Director 

SELECT 
	f.Title, 
    d.FullName 
FROM 
	movies.film f 
INNER JOIN 
	movies.director d ON 
		f.directorid = d.directorid;

-- 3) Title Country 

SELECT 
	f.Title, 
    c.Country 
FROM 
	movies.film f 
INNER JOIN 
	movies.country c ON 
		f.countryid = c.countryid;

-- 4) Title Certificate 

SELECT 
	f.Title, 
    c.certificate 
FROM 
	movies.film f 
INNER JOIN 
	movies.certificate c ON 
		f.CertificateID = c.CertificateID;


-- 5) Title Language 

SELECT 
	f.title, 
    l.language 
FROM 
	movies.film f 
INNER JOIN 
	movies.language l ON 
		f.languageid = l.languageid;

-- 6) Title, Genre, Director, Country, Certificate, Language

SELECT 
	f.Title, 
    g.Genre, 
    d.Fullname, 
    c.Country, 
    ct.Certificate, 
    l.language 
FROM 
	movies.film f 
INNER JOIN 
	movies.genre g ON 
		f.genreid = g.genreid 
INNER JOIN 
	movies.director d ON 
		f.directorid = d.directorid 
INNER JOIN 
	movies.country c ON 
		f.countryid = c.countryid 
INNER JOIN 
	movies.certificate ct ON 
		f.Certificateid = ct.Certificateid 
INNER JOIN 
	movies.language l ON 
		f.languageid = l.LanguageID;
			
           
# 1. Display Director Name ,Total Oscars won by Director,Avg Boxoffice of his movies

Select
FullName
,Sum(OscarWins) as TotalOscars
,Avg(BoxOfficeDollars) as AvgBO
from movies.film f inner join movies.Director d on f.DirectorId = d.DirectorId
Group by FullName ;

# 2. Display Avg runtime of each genre films ,Sort by highest avg to lowest avg

Select
Genre
,Avg(RunTimeMinutes) as AvgRunTime
from movies.film f inner join movies.Genre g on f.GenreId = g.GenreId
Group by Genre 
Order by AvgRunTime desc;

# 3. Which Director and Studio combination has more number of films together
# 4. Display the Players with most number of man of the matches
# 5. Which Director is more versatile (he should have done movies on different genres)
#      Director ,count of different genres he has directed

#   Steven Speilberg  4  Action,Mystery,Thriller,SciFi






        
        
        
