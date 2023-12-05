
use scott;
SELECT ENAME,SAL,DNAME FROM EMP E FULL JOIN DEPT D ON (E.DEPTNO=D.DEPTNO);



/*
PRODUCTS(PID,PNAME)
         101  AD
         102  BC

SALES(PID,SALE_AMT,CUST_ID)
      101   40000  C122

PRODUCT WHICH WERE NEVER SOLD?


SELECT                 FROM SALES RIGHT JOIN PRODUCT ON (PID=PID) ;





SELECT                 FROM PRODUCT LEFT JOIN SALES ON (PID=PID) ;

EMPLOYEES (ID ,NAME,JOB,         SAL,  hiredate,DEPTNO)
            1   renu salesman  30000 04-08-22  20
            2    alex
            3    sam
JOB_HISTORY (ID,JOB,     START DATE,END DATE,DEPTID)
              1  clerk     2-03-22  3-08-22  20
			  2 
HAVE HAVE CHANGED THEIR JOB? do we need alex?(no)
select name from emp e join job_history jh on (e.id=jh.id)



HAVE HAVE never CHANGED THEIR JOB?(sam)
select name from emp e left outer join job_history jh on (e.id=jh.id)

/*
JOINS:display data from multiple table

INNER JOIN-->common data|rows which satisfies the condition 
OUTER JOIN -->USED TO DISPLAY MATCHED AS WELL AS NOT MATCHING ROW (=)
RIGHT [OUTER] JOIN -->  TABLE1   RIGHT JOIN TABLE2(ALL ROWS)
LEFT [OUTER] JOIN --->TABLE1(ALL ROWS)  LEFT  JOIN TABLE2 
FULL [OUTER] JOIN  -->
cross join
*/
 select count(empno) from emp;
 
 select count(deptno) from dept;
 
 select ename,dname from emp cross join dept;
 
 
 SELECT ENAME,DNAME,E.DEPTNO  AS EMPLOYEES_DEPTID
 FROM EMP E JOIN DEPT D ON (E.DEPTNO=D.DEPTNO);
 SELECT * FROM EMP;
 
 CREATE TABLE CUSTOMERS (CUST_ID INT,CUST_NAME CHAR(22),CITY CHAR(22));
 insert into customers values (101,'King','Boston');
 insert into customers values (102,'Alex','Seattle');
 insert into customers values (103,'Ben','Boston');
 insert into customers values (102,'Alex','Seattle');
 select * from customers;
 #city in which we have two different customers
 select c1.cust_name,c1.city 
 from customers c1 inner join customers c2 on (c1.city=c2.city) and c1.cust_id<>c2.cust_id;
 /*
 
 home task
 
 
 display the below statement
 
 report
 ----------
 smith report to ford
 allen report  to blake
 
 */
 
############################################################################
/*

INDEX-->BOOK--->WHY?-->locate chapter -->

-->pk unique

we are creating the index with create cmd  --->MYSQL is using to get data
*/

select * from emp where ename='scott';#1.65

create index idf on emp(ename);#CREATE INDEX <index_name> on TABLE_NAME (column);

 phone_no unqiue
 
 
 name -->renu