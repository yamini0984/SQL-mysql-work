-- RANKING FUNCTION

-- row_number()
-- rank()
-- dense_rank()

CREATE TABLE order_table(
orderid INT,
prodname VARCHAR2(100),
amount INT,
country VARCHAR2(100),
);

INSERT INTO order_table VALUES(1,'Laptop',70000,'India');--,
INSERT INTO order_table VALUES(2,'Mobile',80000,'India');
INSERT INTO order_table VALUES(3,'Desktop',90000,'India');
INSERT INTO order_table VALUES(4,'Others',90000,'India');
INSERT INTO order_table VALUES(1,'Laptop',50000,'USA');
INSERT INTO order_table VALUES(2,'Mobile',40000,'USA');
INSERT INTO order_table VALUES(3,'Desktop',50000,'USA');
INSERT INTO order_table VALUES(1,'Laptop',60000,'Canada');
INSERT INTO order_table VALUES(2,'Mobile',80000,'Canada');
INSERT INTO order_table VALUES(3,'Desktop',50000,'Canada');
INSERT INTO order_table VALUES(1,'Laptop',90000,'Singapore');
INSERT INTO order_table VALUES(2,'Mobile',50000,'Singapore');
INSERT INTO order_table VALUES(3,'Desktop',80000,'Singapore');
INSERT INTO order_table VALUES(1,'Laptop',70000,'Australia');
INSERT INTO order_table VALUES(2,'Mobile',70000,'Australia');
INSERT INTO order_table VALUES(3,'Desktop',70000,'Australia');
INSERT INTO order_table VALUES(3,'Desktop',70000,'Australia');



SELECT * FROM order_table;

SELECT orderid,prodname,amount,country,row_number() OVER (partition by country order by amount DESC) rnk FROM order_table;

SELECT orderid, prodname, amount, country, rnk FROM (
SELECT orderid,prodname,amount,country,row_number() OVER (partition by country order by amount DESC) rnk FROM order_table) abc 
WHERE rnk=1;

SELECT orderid,prodname,amount,country,rank() OVER ( order by amount DESC) rnk FROM order_table; 

SELECT orderid,prodname,amount,country,rank() OVER (partition by country order by amount DESC) rnk FROM order_table; 


SELECT orderid, prodname, amount, country, rnk FROM (
SELECT orderid,prodname,amount,country,rank() OVER (partition by country order by amount DESC) rnk FROM order_table) abc 
WHERE rnk=1;

SELECT orderid,prodname,amount,country,dense_rank() OVER (order by amount DESC) rnk FROM order_table; 

SELECT orderid,prodname,amount,country,dense_rank() OVER (partition by country order by amount DESC) rnk FROM order_table; 


SELECT orderid, prodname, amount, country, rnk FROM (
SELECT orderid,prodname,amount,country,dense_rank() OVER (partition by country order by amount ) rnk FROM order_table) abc 
WHERE rnk <=2;


SELECT orderid, prodname, amount, country, rnk FROM (
SELECT orderid,prodname,amount,country,row_number() OVER (partition by country ,prodname, amount order by amount DESC) rnk FROM order_table) abc 
WHERE rnk=1;

SELECT prodname, country, amount, row_number() over ( order by amount DESC) rnk
FROM order_table;

SELECT prodname, country, amount, rank() over ( order by amount DESC) rnk
FROM order_table;

SELECT prodname, country, amount, dense_rank() over ( order by amount DESC) rnk
FROM order_table;