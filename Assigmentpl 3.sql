use pl;

#1.Write a program containing a loop that iterates from 1 to 1000 using a variable I, 
#which is incremented each time around the loop. The program should output the 
#value of I every hundred iterations (i.e., the output should be 100, 200, etc.). 



create table temp(fist float,sec varchar(40));
drop table temp;
delimiter //
create procedure ex1()
begin
	declare i int default 1;
     while i <=1000
     do
          if (mod(i,100)=0) then
              insert into temp(fist) values(i);
          end if;
       set i=i+1;
     end while;
     
     end; //
     delimiter ;
     drop procedure ex1;
     call ex1();
     select * from temp;
     
     
#2 Write a program that examines all the numbers from 1 to 999, displaying all those 
#for which the sum of the cubes of the digits equal the number itself.
 
 create table temp(fist float,sec varchar(40));
 drop table temp;
 
 
delimiter //
create procedure example3Q2()
begin
	 declare x int default 1;
     declare y int;
     declare rem int default 0;
     declare sum int default 0;

     while x<999 do
            set y=x;
		    while y>0 do
                  set rem=mod(y,10);
                  set sum=(sum+(rem*rem*rem));
                  set y=floor(y/10);
              
			end while;
            
			if (x=sum)  then
					insert into temp values(sum,'Armstrong Number');
			end if;
			set sum=0;
            set x=x+1;
	end while;
end; //
delimiter ;
drop procedure example3Q2;
call example3Q2();
select * from temp;
truncate temp;

insert into temp values(10,'Max'),(15,'Max');

select date_format(now(),'%W %D %b %Y')FROM DUAL;
 delimiter //
create procedure example3Q2()
begin
	 declare x int default 1;
     declare y int default 153;
     declare rem int default 0;
     declare sum int default 0;
		    while y>0 do
                  set rem=mod(y,10);
                  insert into temp values(rem,'rem');
                  set sum=(sum+(rem*rem*rem));
                  insert into temp values(sum,'sum');
                  set y=floor(y/10);
                  insert into temp values(y,'y');
			end while;
            insert into temp values(sum,'sum');
		
end; //
delimiter ;
drop procedure example3Q2;
call example3Q2();
select * from temp;

truncate temp;
        

#3.Write a program that Selects from any table a minimum and maximum value for a 
#radius, along with an increment factor, and generates a series of radii by repeatedly 
#adding the increment to the minimum until the maximum is reached. For each value 
#of the radius, compute and display the circumference, area, and volume of the 
#sphere.(Be sure to include both the maximum and the minimum values.)


create table tempp(fist float,sec varchar(40));
 drop table tempp;

delimiter //
create procedure exp3()
begin
	declare min int;
    declare max int;
    declare r int ;
    declare cir float;
    declare ar float;
    declare vol float;
    declare pi float default 3.14;
    
    select fist into min from temp where fist=1;
    select fist into max from temp where fist=10;
       
    while max>=min do
        set r=min;
		set cir =(2*pi*r);
        set ar=(4*pi*r);
        set vol=((4/3)*pi*r);
        insert into tempp values(cir,'Cir'),(ar,'Area'),(vol,'Volume');
        set min=min+1;
	end while;
    end; //
   delimiter ;
   drop procedure exp3;
   call exp3();
   select * from tempp;
		
        
#4.A palindrome is a word that is spelled the same forward and backward, such as 
#level, radar, etc. Write a program to Selects from any table a five letter word and 
#determine whether it is a palindrome.  
     
insert into temp values(11,'RADAR'),(12,'LEVEL'),(13,'AHDHB');
create table tempp(firt int,sec varchar(40));
drop table tempp;
select * from temp;
select substr('RADAR',4,1) from dual;

delimiter //
create procedure example3Q4()
begin
      declare x char(10);
      declare y char(10);
      declare r char(10) default ' ';
      declare s char(10);
      declare le int;
      select sec into x from temp where fist=13;
      set le=length(x);
      while le>0 do
           -- set s= substr(x,le,1);
            set r= concat(r,substr(x,le,1));
            
            set le=le-1;
           -- insert into tempp values(le,r);
      end while;
      set y= trim(r);
     -- insert into tempp values(length(r),'len');
      
      if (x=r) then
			insert into tempp values(1,'Palindrome');
	  else
            insert into tempp values(0,' Not Palindrom');
      end if;
end; //
delimiter ;
      
 call example3Q4();
 drop procedure example3Q4;
 select * from tempp;
 
 truncate tempp;
 truncate tempp;
    
#5.Modify the above program to Select from any table a variable length word. This 
#requires determining how many characters are read in.

create table tempp(firt int,sec varchar(40));
drop table tempp;

delimiter //
create procedure ex5()
begin
	declare X varchar(20);
    declare L int;
    select sec into X from temp where fist=13;
    
    set L=length(X);
    insert into tempp values(L,'Length');
    
    end;//
    delimiter ;
    
    call ex5();
    drop procedure ex5;
select * from tempp;




