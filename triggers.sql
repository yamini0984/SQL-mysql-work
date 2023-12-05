/*

event i u d table  --->table2 

before after 

new old 
*/
use scott;
show tables;
select * from medicines;
create table medicines (med_id int,name char(22),qty int);
insert into medicines values (101,'CROSIN',100);
insert into medicines values (102,'DOLO 650',100);#update  after we sell the medicine
update medicines set qty=100;#
create table orders (med_id int,order_date datetime);#i
update medicines set qty=20 where med_id=101;

/*

if new.qty<30  then
insert into orders values (new.med_id,now());
end if;
*/
