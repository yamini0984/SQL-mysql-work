CREATE TABLE `film` (
  `FilmID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `ReleaseDate` datetime DEFAULT NULL,
  `DirectorID` int DEFAULT NULL,
  `StudioID` int DEFAULT NULL,
  `Review` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CountryID` int DEFAULT NULL,
  `LanguageID` int DEFAULT NULL,
  `GenreID` int DEFAULT NULL,
  `RunTimeMinutes` smallint DEFAULT NULL,
  `CertificateID` int DEFAULT NULL,
  `BudgetDollars` bigint DEFAULT NULL,
  `BoxOfficeDollars` bigint DEFAULT NULL,
  `OscarNominations` tinyint DEFAULT NULL,
  `OscarWins` tinyint DEFAULT NULL,
  PRIMARY KEY (`FilmID`),
  KEY `FK_Film_Certificate` (`CertificateID`),
  KEY `FK_Film_Country` (`CountryID`),
  KEY `FK_Film_Director` (`DirectorID`),
  KEY `FK_Film_Genre` (`GenreID`),
  KEY `FK_Film_Language` (`LanguageID`),
  KEY `FK_Film_Studio` (`StudioID`),
  CONSTRAINT `FK_Film_Certificate` FOREIGN KEY (`CertificateID`) REFERENCES `certificate` (`CertificateID`),
  CONSTRAINT `FK_Film_Country` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`),
  CONSTRAINT `FK_Film_Director` FOREIGN KEY (`DirectorID`) REFERENCES `director` (`DirectorID`),
  CONSTRAINT `FK_Film_Genre` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`),
  CONSTRAINT `FK_Film_Language` FOREIGN KEY (`LanguageID`) REFERENCES `language` (`LanguageID`),
  CONSTRAINT `FK_Film_Studio` FOREIGN KEY (`StudioID`) REFERENCES `studio` (`StudioID`)
) ENGINE=InnoDB AUTO_INCREMENT=1678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#  ********** JOIN ***********  

select * from movies.film f join movies.language l on(f.CertificateID = l.LanguageID);

# join all table

select * from movies.film f
join movies.genre g on (f.GenreID = g.GenreID)
join movies.director d on (f.DirectorID = d.DirectorID)
join movies.country c on (f.CountryID = c.CountryID)
join movies.certificate ca on (f.CertificateID = ca.CertificateID)
join movies.language l on (f.LanguageID = l.LanguageID);


# 1. display director names, total oscars won by director, avg boxoffice of his movies

select 
Fullname()
,OscarsWins as TotalOscar
,Avg(BoxOfficeDollars)


