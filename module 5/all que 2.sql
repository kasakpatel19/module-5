create table history1
(id int not null,
name varchar(23)
);
INSERT INTO history1 VALUES
(1,'KASAK');
INSERT INTO history1 VALUES
(2,'KAVYA');
INSERT INTO history1 VALUES
(3,'MOXA');
INSERT INTO history1 VALUES
(4,'MAULI');
select * from history1;
set auto_commit = off;
insert into history1 values(4,"pavan");

commit;
rollback;
select * from employees;
delimiter &&

create procedure get_information()
begin
declare cu_id int;
declare cu_name varchar(100);
declare cu_finished int default 0;
declare c2 cursor for select id,name from history1;
declare continue handler for not found set cu_finished=1;
open c2;
get_data1:LOOP
fetch c2 into cu_id,cu_name;
select concat(cu_id,concat(' - ',cu_name));
if cu_finished =1 then 
leave get_data1;
end if;
end loop get_data1;
close c2;
end &&

call get_imformation;
