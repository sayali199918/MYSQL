create database Program_SQL;
use Program_SQL;
/*3. Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) and vice 
versa. The required formulae are:- C= (F-32)*5/9 
F= 9/5*C + 32*/
create table tempp
(
fir int,
sec char(15)
);
delimiter $$
create procedure abc()
begin
	declare x  int default 1;
    declare y float ;
    declare z float;
    set x=42;
    set y=9/5*x+32;
    set z=(x-32)*5/9;
    insert into tempp values(y,'Fahrenheit');
      insert into tempp values(z,'celcius');
end; $$
delimiter ;

call abc();
select * from tempp;

#Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) and vice versa. The required formulae are:- C= (F-32)*5/9
#F= 9/5*C + 32

create table temp
(First float ,Second char(10));

select * from temp;
desc temp;
alter table temp modify Second varchar(50);
delimiter //

create procedure convert_To_Celcius(F float)
begin
	
    declare C float;
   set C = ((F-32) *5/9);
   insert into temp values (C , 'Cel');
end; // 

delimiter ;

drop procedure convert_To_Celcius;

call convert_To_Celcius(10);
call convert_To_Celcius(10.10);
call convert_To_Celcius(42);
call convert_To_Celcius(107.6);

select * from temp;

drop procedure abc;
