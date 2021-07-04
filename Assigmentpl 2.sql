use pl;

create table emp(empid int,ename varchar(20),DOBY int,sal float);
insert into emp values(1,'King',1996,5000),(2,'kiran',1997,6000),
(3,'Alen',2000,9000),(40,'tom',2003,8000),
(50,'Sirum',2005,10000),(51,'Ale',2010,5005);

select * from emp;
drop table emp;
#1.Select from any table a number and determine whether it is within a given range (for 
#example, between 1 and 10).

    create table temp(fist float,sec varchar(40));
    delimiter //
create procedure exp1()
begin
     declare x int;
	select empid into x from emp where ename='tom';
    
    if 1<=x and x<=10 then
     insert into temp values(x,'between 1 and 10');
     else
      insert into temp values(x,'Not in between 1 to 10');
     end if;
     
     end;//
     delimiter ;
     drop procedure exp1;
   call exp1();
   select * from temp;
   drop table temp;
   
   
 #2.Select from any table three positive integers representing the sides of a triangle, and 
#determine whether they form a valid triangle. Hint: In a triangle, the sum of any two 
#sides must always be greater than the third side. 

    create table temp(fist float,sec varchar(40));
    
    delimiter //
    create procedure exp2()
    begin
		declare x int;
        declare y int;
        declare z int;
      
        select empid into x from emp where ename='King';
        select empid into y from emp where ename='kiran';
        select empid into z from emp where ename='Alen';
	
          if (x+y)>z or(x+z)>y or(y+z)>x then 
           insert into temp values((x+y+z),'Valid Triangle');
           else
          insert into temp values((x+y+z),'Not Valid Triangle');
         end if;
          end ; //
          
          delimiter ;
          drop procedure exp2;
          call exp2();
          select * from temp;
          drop table temp;
          
          
          
#3.Check if a given a year is a leap year. The condition is:- year should be (divisible by 4 
#and not divisible by 100) or (divisible by 4 and divisible by 400.). The year should be 
#Selected from some table.

create table temp(fist float,sec varchar(40));

delimiter //
create procedure exp3()
begin
	declare y int;
    
    select DOBY into y from emp where ename='Kiran';
    
    if(mod(y,4)=0) and (mod(y,100)!=0) or (mod(y,4)=0)and (mod(y,400)=0) 
    then
    insert into temp values(y,'IS LEAP YEAR ');
    else
    insert into temp values(y,'IS NOT LEAP YEAR');
    end if;
    
    end; //
    delimiter ;
    drop procedure exp3;
    call exp3();
    select * from temp;
    drop table temp;
    
    
#4.Write a program that Selects from any table two character strings. Your program should 
#then determine if one character string exists inside another character string.

create table temp(fist varchar(40),sec varchar(40));
drop table temp;
delimiter //
create procedure exp4()
begin
     declare name varchar(20);
     declare name2 varchar(20);
     declare flag  int;
	select ename into name from emp where empid=51;
    select ename into name2 from emp where empid=3;
    set flag=(instr(name,name2)or(instr(name2,name)));
    if flag>0 then
       insert into temp values(name,'String Exists');
       
	else
      insert into temp values(name2,'Not Exists');
      
      end if;
      
      end; //
      delimiter ;
drop procedure exp4;      
    call exp4();
	select * from temp;
    select * from emp;
    
    


    

   
          
          
    
    

