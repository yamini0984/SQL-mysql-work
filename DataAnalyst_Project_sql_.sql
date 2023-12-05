create database DAproject;

use DAproject;

# ORDERS,CUST,SALESPEOPLE

# 1.	Create the Salespeople as below screenshot.


drop table if exists Salespeople;
create table Salespeople (snum integer NOT NULL PRIMARY KEY auto_increment,
 sname varchar(50), city varchar(25), comm double);
select * from Salespeople; 
insert into Salespeople values(1001,'Peel','London',0.12);
insert into Salespeople values(1002,'Serres','San Jose',0.13);
insert into Salespeople values(1003,'Axelrod','New York',0.10);
insert into Salespeople values(1004,'Motika','London',0.11);
insert into Salespeople values(1007,'Rafkin','Barcelona',0.15);
insert into Salespeople (snum, sname, city, comm) values(null,null,null,null);

# 2 Create the Cust Table 

drop table if exists Cust;
create table Cust (cnum integer NOT NULL PRIMARY KEY auto_increment, 
cname varchar(50), city varchar(25), rating integer, snum integer);
select * from Cust; 
insert into Cust values(2001 , 'Hoffman', 'London', 100 , 1001);
insert into Cust values(2002 , 'Giovanne', 'Rome', 200 , 1003);
insert into Cust values(2003 , 'Liu', 'San Jose', 300 , 1002);
insert into Cust values(2004 , 'Grass', 'Berlin', 100 , 1002);
insert into Cust values(2006 , 'Clemens', 'London', 300 , 1007);
insert into Cust values(2007 , 'Pereira', 'Rome', 100 , 1004);
insert into Cust values(2008 , 'James', 'London', 200 , 1007);
insert into Cust ( cnum , cname , city , rating , snum ) values (null , null , null , null , null);

ALTER TABLE Cust ADD  CONSTRAINT FK_snum FOREIGN KEY(snum)
REFERENCES Salespeople (snum);

set sql_safe_updates=0;

drop table Salespeople;
drop table Cust;
alter table Salespeople ADD constraint 
FilmID int NOT NULL PRIMARY KEY auto_increment,

# 3	Create orders table 
create table orders ( onum integer NOT NULL PRIMARY KEY auto_increment,
 amt double , odate date , cnum integer , snum integer )
 
 ALTER TABLE orders ADD  CONSTRAINT FK_cnum FOREIGN KEY(cnum)
REFERENCES Cust (cnum);

 ALTER TABLE orders ADD  CONSTRAINT FK_snum FOREIGN KEY(snum)
REFERENCES Salespeople (snum);

select * from orders;
insert into orders values(3001 , 18.69 , '1994-10-03' , 2008 , 1007 )
insert into orders values(3002 , 1900.10 , '1994-10-03' , 2007 , 1004 )
insert into orders values(3003 , 767.19 , '1994-10-03' , 2001 , 1001 )
insert into orders values(3005 , 5160.45 , '1994-10-03' , 2003 , 1002 )
insert into orders values(3006 , 1098.16 , '1994-10-04' , 2008 , 1007 )
insert into orders values(3007 , 75.75 , '1994-10-05' , 2004 , 1002 )
insert into orders values(3008 , 4723.00 , '1994-10-05' , 2006 , 1001 )
insert into orders values(3009 , 1713.23 , '1994-10-04' , 2002 , 1003 )
insert into orders values(3010 , 1309.95 , '1994-10-06' , 2004 , 1002 )
insert into orders values(3011 , 9891.88 , '1994-10-06' , 2006 , 1001 )

# 4 Write a query to match the salespeople to the customers according to the city they are living.

SELECT Salespeople.sname AS salesperson_name, Cust.cname AS customer_name, Cust.city
FROM Salespeople
INNER JOIN Cust
ON Salespeople.snum = Cust.snum
WHERE Cust.city = Salespeople.city;

# 5 Write a query to select the names of customers and the salespersons who are providing service to them.

SELECT Cust.cname AS customer_name, Salespeople.sname AS salesperson_name
FROM Cust
INNER JOIN Salespeople
ON Cust.snum = Salespeople.snum;

# 6.Write a query to find out all orders by customers not located in the same cities as 
#  that of their salespeople

SELECT orders.onum, Cust.cname AS customer_name, Salespeople.sname AS salesperson_name,
Cust.city AS customer_city,
Salespeople.city AS salesperson_city
FROM orders
INNER JOIN Cust ON orders.cnum = Cust.cnum
INNER JOIN Salespeople ON Cust.snum = Salespeople.snum
WHERE Cust.city != Salespeople.city;

#  7.	Write a query that lists each order number followed by name of customer who made that order

SELECT orders.onum AS order_number, Cust.cname AS customer_name
FROM orders
INNER JOIN Cust
ON orders.cnum = Cust.cnum;

# 8 Write a query that finds all pairs of customers having the same rating………………

SELECT c1.cname AS customer1, c2.cname AS customer2, c1.rating
FROM Cust c1
INNER JOIN Cust c2 ON c1.rating = c2.rating AND c1.cnum < c2.cnum;

#  9 Write a query to find out all pairs of customers served by a single salesperson………………..

SELECT c1.cname AS customer1, c2.cname AS customer2, s.sname AS salesperson
FROM Cust c1
INNER JOIN Cust c2 ON c1.snum = c2.snum AND c1.cnum < c2.cnum
INNER JOIN salespeople s ON c1.snum = s.snum;


# 10 Write a query that produces all pairs of salespeople who are living in same city

SELECT s1.sname AS salesperson1, s2.sname AS salesperson2, s1.city
FROM Salespeople s1
INNER JOIN Salespeople s2 ON s1.city = s2.city AND s1.snum < s2.snum

# 11 Write a Query to find all orders credited to the same salesperson who services Customer 2008

SELECT o1.onum AS order1_id, o1.amt AS order_amount, o2.onum AS order2_id,
o2.amt AS order2_amount, s.sname AS salesperson
FROM orders o1
INNER JOIN orders o2 ON o1.snum = o2.snum AND o1.onum < o2.onum
INNER JOIN Cust c ON o1.cnum = c.cnum AND c.cnum = 2008
INNER JOIN Salespeople s ON o1.snum = s.snum;

# 12 Write a Query to find out all orders that are greater than the average for Oct 4th

SELECT *
FROM orders
WHERE odate = '1994-10-04' AND amt > (SELECT AVG(amt) FROM 
orders WHERE odate = '1994-10-04');

# 13.	Write a Query to find all orders attributed to salespeople in London.

SELECT o.onum AS order_id, o.amt, s.sname AS salesperson_name
FROM orders o
INNER JOIN Salespeople s ON o.snum = s.snum AND s.city = 'London'

#  14.	Write a query to find all the customers whose cnum is 1000 above the snum of Series. 


select cnum, cname 
 from cust 
 where cnum > ( select snum+1000  from salespeople where sname = 'Serres');

#  15.	Write a query to count customers with ratings above San Jose’s average rating.


select count(cnum)
 from cust
 where  rating > (select avg(rating) from cust where cname = 'Grass') ;


# 16.	Write a query to show each salesperson with multiple customers.

SELECT s.sname AS salesperson_name, COUNT(*) AS customer_count
FROM Salespeople s
INNER JOIN Cust c ON s.snum = c.snum
GROUP BY s.snum
HAVING COUNT(*) > 1

#   EMPLOYEE DEPARTMENT ANALYSIS

# 1.	Create the Employee Table 

create table employee (empno integer NOT NULL PRIMARY KEY auto_increment, ename varchar(25),
 job varchar (20) ,
 mgr integer, hiredate date,
 sal decimal(10,2),
 comm double, 
 deptno integer);
 
 #
 #CREATE TABLE employees (
 # id INT NOT NULL PRIMARY KEY,
 # name VARCHAR(50) NOT NULL,
 # salary DECIMAL(10, 2) NOT NULL CHECK (salary > 0)
#);

 #UPDATE employee SET sal > 0;

 ALTER TABLE employee ADD  CONSTRAINT FK_deptno FOREIGN KEY(deptno)
REFERENCES dept (deptno);

drop table if exists employee;

SELECT * from employee;
insert into employee values(7369, 'SMITH', 'CLERK', 7902, '1890-12-17', 800.00, NULL,20)
insert into employee values(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00,30)
insert into employee values(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00,30)
insert into employee values(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL,20)
insert into employee values(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00,30)
insert into employee values(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL,30)
insert into employee values(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL,10)
insert into employee values(7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000.00, NULL,20)
insert into employee values(7839, 'KING', 'PRECIDENT', NULL, '1981-11-17', 5000.00, NULL,10)
insert into employee values(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00,30)
insert into employee values(7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100.00, NULL,20)
insert into employee values(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL,30)
insert into employee values(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL,20)
insert into employee values(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL,10)


use DAproject;
# 2  Create the Dept Table 
drop table if exists dept;
create table dept (deptno integer NOT NULL PRIMARY KEY auto_increment, dname varchar (25), loc varchar (25));
insert into dept values(10, 'OPERATIONS' ,  'BOSTON')
insert into dept values(20, 'RESEARCH', 'DALLAS' )
insert into dept values(30,'SALES','CHICAGO')
insert into dept values(40,'ACCOUNTING','NEW YORK')
select * from dept;

#  3.	List the Names and salary of the employee whose salary is greater than 1000

SELECT ename, sal FROM employee WHERE sal > 1000;

#  4.	List the details of the employees who have joined before end of September 81.

SELECT * FROM employee WHERE hiredate <= '1981-09-30';


#  5.	List Employee Names having I as second character.

SELECT ename FROM employee WHERE SUBSTRING(ename, 2, 1) = 'I';

#  6.	List Employee Name, Salary, Allowances (40% of Sal), P.F. (10 % of Sal) and Net Salary. 
# Also assign the alias name for the columns

SELECT 
  ename AS Employee_Name, 
  sal AS Basic_Salary, 
  sal * 0.4 AS Allowances, 
  sal * 0.1 AS PF, 
  sal * 0.5 AS Net_Salary
FROM employee;

#  7 List Employee Names with designations who does not report to anybody

SELECT e.ename AS Employee_Name, d.dname AS dept
FROM employee e
JOIN dept d ON e.deptno = d.deptno
WHERE e.deptno NOT IN (SELECT mgr FROM employee WHERE mgr IS NOT NULL);

#  8.	List Empno, Ename and Salary in the ascending order of salary.

SELECT empno, ename, sal
FROM employee
ORDER BY sal ASC;

# 9.	How many jobs are available in the Organization ?

SELECT COUNT(*) AS job_count
FROM employee;


#   10.	Determine total payable salary of salesman category

SELECT SUM(sal) AS total_payable_salary
FROM employee
WHERE job = 'salesman';

# 11.	List average monthly salary for each job within each department   

SELECT d.dname AS department_name, e.job AS job_title, AVG(e.sal/12) AS avg_monthly_salary
FROM employee e
JOIN employee e ON e.empno = d.deptno
#JOIN dept d ON e.empno = d.deptno
GROUP BY d.dname, e.job;

#  12.	Use the Same EMP and DEPT table used in the Case study to Display EMPNAME, SALARY
#  and DEPTNAME in which the employee is working.

SELECT e.ename AS EMPNAME, e.sal AS SALARY, d.dname AS DEPTNAME
FROM employee e
JOIN dept d ON e.deptno = d.deptno;

#  13  Create the Job Grades Table 
use DAproject;

drop table if exists jobgrades;
create table jobgrades (grade varchar(2),
 lowest_sal integer, highest_sal integer);
select * from jobgrades;
insert into jobgrades values('A' , 0 , 999);
insert into jobgrades values('B' , 1000 , 1999);
insert into jobgrades values('C' , 2000 , 2999);
insert into jobgrades values('D' , 3000 , 3999);
insert into jobgrades values('E' , 4000 , 5000);

#  14.	Display the last name, salary and  Corresponding Grade.

SELECT ename, sal, 
CASE 
    WHEN sal < 1000 THEN 'A'
    WHEN sal < 2000 THEN 'B'
    WHEN sal < 3000 THEN 'C'
    when sal < 4000 then 'D'
    ELSE 'E'
END AS grade
FROM employee
ORDER BY ename;

# 15.	Display the Emp name and the Manager name under whom the Employee works in the below format .

# Emp Report to Mgr.


SELECT CONCAT(e.ename, ' Report to ', e.mgr, '.') AS 'Emp Report to Mgr.'
FROM employee e
JOIN dept d ON e.deptno = d.deptno;

#  16.	Display Empname and Total sal where Total Sal (sal + Comm)

SELECT ename, (sal + IFNULL(comm, 0)) AS 'Total Sal'
FROM employee;

# 17.	Display Empname and Sal whose empno is a odd number

SELECT ename, sal
FROM employee
WHERE empno % 2 != 0;

# 18.	Display Empname , Rank of sal in Organisation , Rank of Sal in their department

SELECT ename,
    (SELECT COUNT(*) FROM employee WHERE sal >= e.sal) AS 'Organization Sal Rank',
    (SELECT COUNT(*) FROM employee WHERE deptno = e.deptno AND sal >= e.sal) AS 'Dept Sal Rank'
FROM employee e;

# 19.	Display Top 3 Empnames based on their Salary

SELECT ename, sal
FROM employee
ORDER BY sal DESC
LIMIT 3;

# 20 Display Empname who has highest Salary in Each Department.

SELECT ename, deptno, sal
FROM employee e1
WHERE sal = (SELECT MAX(sal) FROM employee e2 WHERE e1.deptno = e2.deptno);






















 







