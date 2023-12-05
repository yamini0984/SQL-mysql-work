declare v_ename char(12);
declare v_sal int;
select ename,sal into v_ename,v_sal from emp where empno=empid;
if v_sal>1000 then 
select concat(v_ename,' good salary') as msg;
else select concat(v_ename,' bad salary') as msg;
end if;