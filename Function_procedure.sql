create database Function_pro;
use Function_pro;

create table temp
(First int,
	Second varchar(20)
);

delimiter //

create function abc()
returns int 
deterministic
begin
	return 10;
end; //

delimiter ;

delimiter //

create procedure pqrs()
begin
		declare x int ;
        set x = abc();
        
        insert into temp values(x , 'after abc '); 
end; //

delimiter ;
call pqrs();
select * from temp;
drop function abc;


-- Farenheit to celicius using  Store FUNCTION


drop table tempp;
show tables;
  create table tempp1
  (
	first float,
    second char(25)
  
  );
  select * from tempp1;
  
  delimiter $$
  create function FtoC()
  returns float
  deterministic
  begin
		declare F float;
       set F = 106;
       return ((F-32)*5/9);
  end; $$
  
  delimiter  ;
  
  delimiter $$
  create procedure call1()
  begin
		declare X float;
		set X =  FtoC();
        
        insert into tempp1 values(x,'fer to celc');
        
  end; $$
  
  delimiter ;
  
  
   call call1();
   select * from tempp1;
  DROP procedure call1;
  
  
  -- celicius to Farenheit using  Store FUNCTION

use test;
drop table tempp;
show tables;
  create table tempp2
  (
	first float,
    second char(25)
  
  );
  select * from tempp2;
  
  delimiter $$
  create function CtoF()
  returns float
  deterministic
  begin
		declare C float;
       set C = 106;
       return (9/5*C + 32);
  end; $$
  
  delimiter  ;
  
  drop function CtoF;
  
  delimiter $$
  create procedure call2()
  begin
		declare X float;
		set X =  CtoF();
        
        insert into tempp2 values(x,'celc to fer');
        
  end; $$
  
  delimiter ;
  
  
   call call2();
   select * from tempp2;
drop procedure call2;



