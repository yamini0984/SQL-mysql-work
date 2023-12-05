declare cnt int default 0;
myloop:while cnt<3 do
set cnt=cnt+1;
select concat('hello',cnt) as msg;
end while;