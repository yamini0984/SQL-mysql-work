# Q4. Display the list of Bowlers(Top5) who conceeded more extras in IPL 
# Q5. Display the list of most expensive overs in IPL
#      Match Date,Teams Played,Bowlername and TotalRuns should be in the Output
# Q6. Display the list of films which released multiple times with same title
#     Output should be in Format -    Title     OldReleaseDate     NewReleaseDate
# Q7. Use BookStore Database,Display BookName,Prequel BookName and Sequel BookName

Create table tblbook
(BookId int
,BookName varchar(100)
,SequelBookId int) ;

Insert into tblbook
Values(1,'The Fellowship of the Ring',4)
,(2,'The Girl with the Draggon Tattoo',5)
,(3,'The Hobbit',1)
,(4,'The Two Towers',6)
,(5,'The Girl who Played with Fire',10)
,(7,'Harry Potter''s and the Philosopher''s Stone',8) ;


Insert into tblbook(BookId,BookName)
Values(9,'The Life of Pi')
,(8,'Harry Potter and the Prisoner of Azkabhan')
,(6,'The Return of the King')
,(10,'The Girl who Kicked the Hornet''s Nest') ;

# Q8. Display the list of Products which were unsold on any given date
#     Output should contain - SalesDate ProductName TotalQty  TotalSales 

CREATE TABLE Product (ID int, 
                      ProductName varchar(100),
                      Cost Double);
CREATE TABLE SalesItem (ID int, 
                        SalesDate datetime, 
                        ProductID int, 
                        Qty int, 
						TotalSalesAmt double);
INSERT INTO Product 
VALUES (1,'Widget',21.99),
       (2,'Thingamajig',5.38), 
   (3,'Watchamacallit',1.96);
   
INSERT INTO SalesItem
VALUES (1,'2014-10-1',1,1,21.99),
       (2,'2014-10-2',3,1,1.96),
       (3,'2014-10-3',3,10,19.60),
       (4,'2014-10-3',1,2,43.98),
       (5,'2014-10-3',1,2,43.98);