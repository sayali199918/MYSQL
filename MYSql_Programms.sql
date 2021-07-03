create database PL;
use PL;
#Create table tempp
create table tempp
(
fir int,
sec char(15)
);

#create a procedure
 delimiter $$
 create procedure abc()
 begin
	insert into tempp (fir, sec) values(1,'Sayali'),(2,'Saya'),(3,'Sayo'),(4,'Sai'),(5,'Saiii');
end; $$
delimiter ;

#to call the stored procedure
call abc();

#to see the output of procedure
select * from tempp;

drop table tempp;
drop procedure abc;

-- you can declare a variable and initialize using set
create table temp
(
fir int,
sec char(15)
);

delimiter $$
create procedure abcd()
begin
	declare x int;
	set x=10;
	insert into temp values(x,'insideabc');
end; $$
delimiter ;

call abcd();
select * from temp;

-- you can declare a variable and assign a value simultaneously
create table temp1
(
first int,
second char(15)
);

delimiter $$
create procedure abc1()
begin
	declare x int default 10;
    insert into temp1 values(x,'inside abc1');
end; $$
delimiter ;

 call abc1();
 select * from temp1;

create table pqr
(
First int,
second char(15)
);

delimiter $$
create procedure pqr()
begin
	declare x char(15) default'CDAC';
    insert into pqr value (1,x);
end; $$
delimiter ;

call pqr();
select * from pqr;

-- Write a program to calculate HRA Calculation
-- Hra=40% sal
create table Temporary
(
First int,
second char(15)
);

delimiter $$
create procedure HRA()
begin
	declare x char(15) default 'King';
    declare y float default 4000;
    declare Z float default 0.4;
    declare hra float;
    set hra=y*z;
    insert into  temporary values(y,x);
    insert into temporary values(hra,'HRA');
end $$
delimiter ;

call HRA();
select * from temporary;

-- MAke it flexible
delimiter $$
create procedure HRA1(x char(15),y float,z float)
begin
	declare hra float;
    set hra=y*z;
    insert into temporary values(y,x);
    insert into temporary values(hra,'HRA');
end; $$
delimiter ;
call HRA1('King',3000,0.4);
call HRA1('Scott',2500,0.3);
select * from temporary;
select * from Emp;

create table Temporary1
(
First int,
second char(15)
);
delimiter $$
create procedure HRA2()
begin
	declare x float;
     declare hra float;
    select salary into x from emp
    where ename='King';
	set hra=x*0.4;
    insert into  Temporary1 values(x,'king');
    insert into Temporary1 values(hra,'HRA');
end; $$
delimiter ;
drop procedure HRA2;
call HRA2();
select * from Temporary1;
    
#How to make Felxible
    
delimiter $$
create procedure HRA3(y char(15))
begin
	declare x float;
     declare hra float;
    select salary into x from emp
    where ename=y;
	set hra=x*0.4;
    insert into  Temporary1 values(x,y);
    insert into Temporary1 values(hra,'HRA');
end; $$
delimiter ;
drop procedure HRA3;
call HRA3('Scott');
call HRA3('System');
select * from Temporary1;
	

delimiter $$
create procedure HRA4()
begin
	declare x float;
    declare y char(15);
     declare hra float;
    select salary,job into x,y from emp
    where ename='System';
	set hra=x*0.4;
    set y=lower(y);
    insert into  Temporary1 values(x,y);
    insert into Temporary1 values(hra,'HRA');
end; $$
delimiter ;
    
call HRA4();
select * from Temporary1;


#Your block should read in two real numbers and tell whether the product of the two
#numbers is equal to or greater than 100.

delimiter //
create procedure CheckMin(x float,y float)
begin
	 declare mul float;
     
     set mul = x*y;
     if mul >= 100
     then
		insert  into tempp values(mul ,'mul is greater');
    end if;
end;  //

delimiter ;

call CheckMin(11.1,5.0);
call CheckMin(11.0,11.0);
select * from tempp;