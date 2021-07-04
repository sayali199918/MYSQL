create database Practice_set;
use practice_set;
create TABLE customers (
customer_Id int(11) NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (`customer_Id`)
);
insert into customers(customer_Id,First_Name,Last_Name,phone,creditLimit)
values
(103,'Atelier','Schmitt','08-78966578','21000.00'),(112,'Signal','King','7025551838','71800.00'),
(114,'Ferguson','Peter','03-9520 4555','117300.00'),(119,'Labrune','Janine','40.67.8555','118200.00'),
(121,'Bergulfsen','Jonas ','07-989555','81700.00'),(124,'Nelson','Susan','4155551450','210500.00'),
(125,'Piestrzeniewicz','Zbyszek ','(26) 642-7555','0.00'),(128,'Keitel','Roland','+49 6966 90 2555','59700.00'),
(129,'Murphy','Julie','6505555787','64600.00'),(131,'Lee','Kwai','2125557818','114900.00'),
(141,'Freyre','Diego ','(91) 555 94 44','227600.00'),(144,'Berglund','Christina','0921-12 3555','53100.00'),
(145,'Petersen','Jytte ','31 12 3555','83400.00'),(146,'Saveley','Mary','78.32.5555','123900.00'),
(148,'Eric','Jecob','+65 2217555','103800.00'),(151,'Young','Jeff','2125557413','138500.00');

CREATE TABLE orders(
order_Id int(11) NOT NULL,
order_Date date NOT NULL,
shipped_Date date DEFAULT NULL,
Deliver varchar(15) NOT NULL,
customer_Id int(11) NOT NULL,
PRIMARY KEY (order_Id),
FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id)
);



insert into orders(order_Id,order_Date,shipped_Date,Deliver,customer_Id) values
(10100,'2003-01-06','2003-01-13','Shipped',114),(10101,'2003-01-09','2003-01-18','Shipped',125),
(10102,'2003-01-10','2003-01-18','Shipped',129),(10103,'2003-01-29','2003-02-07','Shipped',121),
(10104,'2003-01-31','2003-02-09','Shipped',141),(10105,'2003-02-11','2003-02-21','Shipped',145);

select * from orders;
select * from customers;

-- 1. Write a Query to add a column package_stat to the table orders.
alter table orders add column pakage_stat varchar(20);
-- 2. Write a Query to change the package_stat column of orders table with 'not available'
-- for all orders.
update orders set pakage_stat='not_avaliable';
-- 3. Write a Query to delete a row from customers table where credit_limit is 0.00
#delete from customers where customer_ID=125;
-- Write SELECT statements to achieve the following:

-- 1. Write a Query to display the first_name with the occurrence of ‘el’ in the customers
-- tables.
select first_name from customers where first_name like '%el%';

-- 2. Write a Query to prepare a list with customer name ,customer_id ,order_id for the
-- customers whose delivery status is shipped.
select First_name,Last_name,orders.customer_id,order_id from customers,orders
where orders.customer_Id=customers.customer_Id and Deliver='Shipped';

-- 3. Write a Query to get the number of customers with the creditLimit greater than 50000.
select  count(customer_Id) from customers where customer_Id in
(select customer_Id from customers where creditLimit > 50000);

#Or
select count(customer_id) from customers where creditLimit > 50000;



-- 4. Write a Query to display the customer_id, name ( first name and last name ), order_id
-- and deliver for all customers.
select orders.customer_id,first_name,last_name,order_id,deliver from customers,orders
where orders.customer_Id=customers.customer_Id and Deliver='Shipped';

-- 5. Write a Query to customer name in order of creditLimit smallest to highest.
select First_name,Last_name,CreditLimit from customers order by creditLimit;
-- 6. Write a stored procedure by name order_day. The procedure should show the
-- customer_id and the day on which he had made the order.
create table tpp(fist int, sec varchar(20));
drop table tpp;
desc tpp;
delimiter //
create procedure order_date(orderid int)
begin
		declare a int;
		declare b date;
        declare z varchar(20);
        
			select customer_id into a from orders where order_id=orderid;
            select order_date into b from orders where order_id=orderid;
            set z= dayname(b);
            insert into tpp values(a,z);

end; //
delimiter ;
drop procedure order_date;
call order_date(10101);
select * from tpp;
-- 7. Write a stored function by the name of cutomer_search. The stored function should
-- return the maximum creditLimit made by any customer.*/
create table op
(
creditLimit decimal(10,2),
customer varchar(20)
);

delimiter $$
create function search()
returns decimal
deterministic
begin
	declare x decimal;
    select max(creditlimit) from customers into x;
    return x;
    
    
end; $$
delimiter ;
drop function search;
delimiter $$
create procedure MaxCredit()
begin
	declare y decimal;
    set y = search();
    
    insert into op values(y,'max of credit');

end; $$
delimiter ;
drop procedure MaxCredit;
call MaxCredit();
select * from op;


Insert into dept (Deptno,Dname,Loc)
values(10, 'ACCOUNTING','NEW YORK'),(20, 'RESEARCH', 'DALLAS'),(30, 'SALES', 'CHICAGO'),(40, 'OPERATIONS', 'BOSTON');

create table DEPT
(
DEPTNO INT(2),
DNAME VARCHAR (14),
LOC VARCHAR (13)
);
Insert into dept (Deptno,Dname,Loc)
values(10, 'ACCOUNTING','NEW YORK'),(20, 'RESEARCH', 'DALLAS'),(30, 'SALES', 'CHICAGO'),(40, 'OPERATIONS', 'BOSTON');

create table EMP
(
EMPNO INT(4),
ENAME VARCHAR (10),
JOB VARCHAR (9),
HIREDATE DATE,
SAL FLOAT(7,2),
COMM FLOAT(7,2),
DEPTNO INT(2)
);
alter table EMP modify HIREDATE varchar(35);


Insert  into EMP values
(7369,'SMITH','CLERK','17-DEC-80',800, null, 20);

insert into EMP values (7499, 'ALLEN','SALESMAN','20-FEB-81', 1600, 300, 30);

insert into Emp values(7521, 'WARD', 'SALESMAN', '22-FEB-81', 1250, 500, 30);
insert into EMP values
(7566, 'JONES', 'MANAGER', '02-APR-81', 2975, null, 20),
(7654, 'MARTIN', 'SALESMAN', '28-SEP-81', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', '01-MAY-81', 2850, null, 30),
(7782,'CLARK', 'MANAGER', '09-JUN-81', 2450, null, 10),
(7788, 'SCOTT', 'ANALYST', '09-DEC-82', 3000, null, 20),
(7839, 'KING', 'PRESIDENT', '17-NOV-81', 5000, null, 10),
(7844, 'TURNER', 'SALESMAN', '08-SEP-81', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', '12-JAN-83', 1100, null, 20),
(7900, 'JAMES', 'CLERK', '03-DEC-81', 950, null, 30),
(7902, 'FORD', 'ANALYST','03-DEC-81',3000, null , 20 ),
(7934, 'MILLER', 'CLERK','23-JAN-82',1300, null , 10 );

select * from Emp;
-- Write SELECT statements to achieve the following:-

-- 1. Display only the EMPNO and ENAME columns from EMP table.
select EMPNO,EMPNO from EMP ;

-- 2. Display all employees who are CLERKs and the MANAGERs.
select * from Emp where job='CLERK' or job='MANAGER';
-- 3. Display the ENAME and JOB for all employees who belong to the same DEPTNO as
-- employee ‘KING’.
select ENAME,JOB,Deptno  from EMP where deptno =(select deptno from Emp where Ename='king');
-- 4. Find the names of all employees hired in the month of February (of any year).
select Ename,hiredate from Emp where  hiredate like '%FEB%';
-- 5. Display the employees in descending order of DEPTNO.
select ename from emp order by deptno desc;
-- 6. Display the employee name and employee number of the employees with the
-- headings as NUMBER and NAME.
select ename as 'NAME' ,empno as 'NUMBER' from emp;

-- 7. Find the names of all employees who were hired on the last day of the month.
select Ename,Hiredate from Emp where Hiredate like '%31%' or hiredate like '%30';
-- 8. Find the name of the employee who is receiving the maximum salary.
select * from Emp where sal = (select max(sal) from Emp);
select * from EMP where sal = (select max(sal) from EMP);

-- 9. Display the sum of SAL for all the employees belonging to DEPTNO 10.
select sum(sal) from Emp where DEPTNO=10;

-- second highest salary and min
select * from Emp;
select max(sal) from emp where sal < (select max(sal) from Emp);

select min(sal) from emp where sal > (select min(sal) from EMp);

select max(sal) from emp where sal<(select max(sal) from emp where sal < (select max(sal)from emp));

select * from emp order by '5th High' desc limit 5,1;
-- 10. Display the rows where JOB column ends with the letter ‘T’.
select * from Emp where job like '%T';


-- 11.Write a stored procedure to convert a temperature in Fahrenheit (F) to its equivalent in
-- Celsius (C). The required formula is:- C= (F-32)*5/9
-- Insert the temperature in Centigrade into TEMPP table. Calling program for the stored
-- procedure need not be written.





-- 12. Write a stored function by the name of Num_cube. The stored function should return the
-- cube of a number ‘N’. The number ‘N’ should be passed to the stored function as a
-- parameter. Calling program for the stored function need not be written
delimiter //

create function Num_cube(num int)
returns int
deterministic
begin
	declare cuberes int;
    set cuberes = num * num * num ;
    return cuberes;
end; //

delimiter //

delimiter //

create procedure call_Num_cube(y int)
begin
	declare x int ;
    set x = Num_cube(y);
    insert into result values (x , 'Cube');
end; // 

delimiter ;

call call_Num_cube(2);

select * from result;



 use test;
 create table number1
 (
 number int,
square int,
 cube1 int
 );
 
 
delimiter //
 create function Sqr(num int)
returns int
 deterministic
 begin
 #declare num int;
 declare S int;
 # set num =3;
 set S = num*num;
 return S;
 end;//
 delimiter ;
 
 drop function sqr;
 delimiter //
 create function cub(num int)
 returns int
 deterministic
 begin
 declare C int;
 # declare num int;
 # set num = 3;
 set C = num*num*num;
return C;
 end;//
 delimiter ;
 
 delimiter //
 create procedure callRec(Q int)
 begin
 declare f int;
 declare s int;
 # declare Q int;
 set f =Sqr(Q);
 set s = cub(Q);
 
 insert into number1 values(Q,f,s);
 
 end;//
 delimiter ;
 
 call callRec(3);
 select * from number1;
//drop procedure callRec;