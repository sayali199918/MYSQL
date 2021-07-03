create database plprogram;
use plprogram;

create table op(f int, s char(20));
#1
/*1. Write a program that computes the perimeter and the area of a rectangle. Define 
your own values for the length and width. (Assuming that L and W are the length 
and width of the rectangle, Perimeter = 2*(L+W) and Area = L*W.*/
-- procedure 
delimiter //
create procedure  areaofractangle()
begin 
	declare l float default 10.2;
    declare w float default 20.2;
    declare area float;
    declare perimeter float;
    
    set area = l*w;
    set perimeter = 2*(l+w);
    insert into op values(area, 'AREA');
    insert into op values(perimeter, 'PERIMETER');
end; //
delimiter ;

-- calling the procedure
call areaofractangle();
-- showing out in the form of table op

select * from op;



#2
/*
Write a program that declares an integer variable called num, assigns a value to it, 
and computes and inserts into the tempp table the value of the variable itself, its 
square, and its cube
*/
-- procedure
delimiter //
create procedure number(num int)
begin 
	/* 
    declare num int;
    declare sqr int;
    declare cb int;
    set num = 10;
	set sqr = num*num;
    set cb = num*num*num;
    insert into op values(sqr,'SQUARE'),(cb,'CUBE');
    */
    set num = num*num;
    insert into op values(num, 'SQUARE');
    set num = num * num;
    insert into op values(num, 'CUBES');
end; //
delimiter ;
-- ----------------------------------------
-- calling procedure
call number(10);

-- op 
select * from op;
-- ---------------------------------------

#3
/*
Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) and vice 
versa. The required formulae are:- C= (F-32)*5/9 
F= 9/5*C + 32
*/
delimiter //
create procedure abc2()
begin
     declare C float default 98;
     declare F float default 35;
     declare C1 float ;
     declare F1 float ;
     set C1= (F-32)*5/9 ;
     set F1= 9/5*C + 32 ;
     insert into op values(C1,'CelsiusE'),(F1,' Fahrenheit');
end;//
delimiter ;
call abc2();
select * from op;

/*4. Convert a number of inches into yards, feet, and inches.
 For example, 124 inches equals 3 yards, 1 foot, and 4 inches.*/

delimiter //
create procedure abc3(x float)
begin
declare inch float ;
declare yard float;
declare foot float;
set yard = x / 36;
set foot = mod(x,36)/12;
set inch = mod(mod(x,36),12);
insert into op values(round(inch),'inch');
insert into op values(round(foot),'foot');
insert into op values(round(yard),'yard');
end ; //
delimiter ;
drop procedure abc3;
call abc3(124);
select * from op;

/*5. Write a program that enables a user to 
input an integer. The program should then state
 whether the integer is evenly divisible by 5.*/

delimiter //
create procedure example5(x int)
begin
      if mod(x,5)=0 then
             insert into op values(x,'divisible by 5');
	  else
			 insert into op values(x,'not divisible 5');
	  end if;
end ; //
delimiter ;
call example5(20);
call example5(21);
select * from op;

/*6. Your block should read in two real numbers and 
tell whether the product of the two numbers is equal
to or greater than 100.*/

delimiter //
create procedure example6(x int,y int)
begin
declare z int;
set z=x*y;
if z>= 100 then
			insert into op values(z,'greater than =100');
		else
		  insert into op values(z,'less than =100');

end if;
end; //
delimiter ;
call example6(20,40);
call example6(2,4);
select * from op;





