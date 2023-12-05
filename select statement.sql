
use scott;
select * from emp;#all the columns of the table only once
desc emp;
select ename,sal from emp;#specific values
#display the name salary and job role of all the employees

select ename,sal,job from emp;

#display the name and annual salary of all employees
select ename,sal*12 from emp;
#display the name and annual salary of all employees after a deduction of 100 only once
select ename,sal*12-100 from emp;

#display the name and annual salary of all employees after a deduction of 100 every month
select ename,(sal-100)*12 as "annual income" from emp;
#ALIAS
select ename as name,sal as salary from emp;
select ename,(sal-100)*12 "annual income" from emp;

select distinct deptno from emp;
select distinct deptno,job from emp;





/*
+ - * /

*/

#800-100-->700*12


#DISPLAY THE NAME ,MONTHLY SALARY ,500 ,BALANCE_AMT
SELECT ENAME,SAL AS MONTHLY_SAL, 500 AS  PAID_AMT ,SAL-500 AS BALANCE_AMT FROM EMP;
SELECT ename,sal,comm,sal+comm as total from emp;
select ename,sal,comm ,sal+ifnull(comm,0) as total from emp;


select 'renu' as name;

select 12*12 ;

select ename,sal from emp;#all (14 rows)

/*
DQL 
SELECT [DISTINCT] * ,column_name [[AS] ALIAS],column_name,.... 
[FROM <table_name>]
[WHERE CONDITION(S)];
COMPARISION OPERATORS: =,<,>,<=,>=,!=,<> -->one value
IN (SET)

like 

% -->zero or more characters

_  -->only one character


is null 
1=0  FALSE    2<1  -->FALSE   0<1 -->TRUE
*/
SELECT * FROM EMP WHERE ENAME='SCOTT';
select * from emp where sal>1250;
select * from emp where sal<1250;
select * from emp where sal=1250;
select * from emp where deptno<>30;

clerk salesman;

select * from emp where job IN ('clerk','salesman');
select * from emp where deptno in (10,20);
#name start with an s 
select ename from emp where ename like 's%';

#name ends with an s 
select ename from emp where ename like '%s';

#name contains an s 
select ename from emp where ename like '%s%';

#name with m in second position

select ename from emp where ename like '_m%';

#name with e as second last character

select ename from emp where ename like '%e_';

#display the names of all those employees whos name contains atleast two a 


ankita priyanka  adams aann
select ename from emp where ename like '%a%a%';

select ename from emp where ename like 'aa';


/*
ht:
1)display those employees who were hired on December month

*/
select * from emp where comm is null;

#null=null  null<>null



