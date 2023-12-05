use scott;
SELECT * FROM emp_info;
insert into emp_info values (123,'Sam',20);#
create view emp_info as select empno,ename,deptno from emp where deptno=10;

alter view emp_info as select empno,ename,deptno from emp where deptno=10 with check option; 
insert into emp_info values (124,'Sunny',20);

#alter view emp_info as select empno,ename,job,deptno from emp where deptno=10 with check option; 

create or replace view emp_info as select empno,ename,job,deptno from emp where deptno=10 with check option; 

#########################################
/*sequence -->1,2,3,4,5....
*/
create table sample (sample_id int auto_increment primary key ,sname char(12))  ;


insert into sample(sname) values ('Sample A');
select * from sample;
insert into sample(sname) values ('Sample B');

create table sample2 (sample_id int auto_increment primary key ,sname char(12))  ;
alter table sample2 auto_increment=101;
insert into sample2(sname) values ('Sample A');
select * from sample2;
alter table sample2 auto_increment=1001;
insert into sample2(sname) values ('Sample B');
insert into sample2 values (102,'Sample c');#102-->103
insert into sample2(sname) values ('Sample d');
insert into sample2 values (1006,'Sample e');
insert into sample2(sname) values ('Sample f');

#######################################
/*

types of subquery :
1)non correlated subquery
2)correlated subquery
*/
select sal from emp where ename='scott';


select ename from emp where sal>(select sal from emp where ename='scott');#subquery|inner |nested 
#outer |main query

select * from emp;
#name of those employees to whom other employee report .
select ename as manager_name from emp where empno in (select mgr from emp);
#name of those employees to whom  no other employees report #14-6-->8
select ename as simple_name from emp where empno not in (select mgr from emp where mgr is not null);#

select ename as manger_employee from emp o where exists (select mgr from emp i where o.empno=i.mgr );

select ename as simple_employee from emp o where not exists (select mgr from emp i where o.empno=i.mgr );

#123<>null-->true
select ename as manager_name from emp where empno <> (100);#
#renu  200 -->condition-->evaluate the condition with (sal=100)-->t;

select ename,sal from emp where empno not in (800,1250,null);#

select empno,mgr from emp;


#diplay those employees working in Accounting department(joins)





select * from emp where deptno=(select deptno from dept where dname='accounting');

#display that department where none of the employees are working

select * from dept where deptno not in(select deptno from emp);#no rows selected-->
select * from dept where deptno not in (10,20,30);

#display those employees who works in a job role as smith but earns more than him

select * from emp where job=(select job from emp where ename='smith') 
and 
sal>(Select sal from emp where ename='smith');
select ename,sal,job from emp where ename='smith';

#joins-->display -->self join outer join


/*
procedures:
*/


select * from emp;
select * from dept;



