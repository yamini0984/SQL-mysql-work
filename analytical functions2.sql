/*
analytical function

*/
use scott;
select rank() over(order by sal desc) as rank_value,ename,sal from emp;

select rank() over (partition by deptno order by sal desc) as rank_value,ename,sal,deptno from emp
where rank() over (partition by deptno order by sal desc)=2;

select dense_rank() over(order by sal desc) as rank_value,ename,sal from emp;

select lag(sal,1,0) over(order by sal desc) as previous_value,ename,sal current_sal from emp;-- lookup

select lead(sal,1,0) over(order by sal desc) as next_value,ename,sal current_sal from emp;

select row_number() over() ,ename,sal,deptno from emp;

select percent_rank() over(order by sal) ,ename,sal from emp; -- rank in terms of percent

select round(percent_rank() over(order by sal),2) ,ename,sal from emp;

.csv
/*
rules on data -->CONSTRAINTS
UNIQUE
NOT NULL -->CAN'T BE EMPTY
PRIMARY KEY (U+NN)
check(condition)  -->check(salary>0)
foreign key |referential integrity constraint 
*/
