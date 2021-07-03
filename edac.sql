/*1. Create the table SEMP with the following structure:- 
 
EMPNO CHAR(4) 
EMPNAME CHAR(20) 
BASIC FLOAT(9,2) 
DEPTNO CHAR(2) 
DEPTHEAD CHAR(4) */

create table SEMP
(
EMPNO CHAR(4) ,
EMPNAME char(20) ,
BASIC FLOAT(9,2) ,
DEPTNO CHAR(2) ,
DEPTHEAD CHAR(4) 
);
/*2. Create the table SDEPT with the following structure:- 
 
DEPTNO CHAR(2) 
DEPTNAME CHAR(15) */

create table SDEPT
(
DEPTNO CHAR(2),
DEPTNAME CHAR(15) 
);

/*3. Insert into the SDEPT table the following values:- 
 10, Development 
20, Training*/
insert into SDEPT (DEPTNO,DEPTNAME) values('10','Development'),('20','Training');

/*4. Insert into the SEMP table the following values:- 
 0001, SUNIL, 6000, 10 
0002, HIREN, 8000, 20 
0003, ALI, 4000, 10, 0001 
0004, GEORGE, 6000, 0002*/

insert into SEMP(EMPNO,EMPNAME,BASIC,DEPTNO,DEPTHEAD) values('0001','SUNIL','6000', '10','null'),('0002', 'HIREN', '8000', '20','null' ),('0003', 'ALI', '4000', '10', '0001'),('0003', 'ALI', '4000', '10', '0001'); 
insert into SEMP(EMPNO,EMPNAME,BASIC,DEPTNO,DEPTHEAD) values('0004', 'GEORGE', '6000',null,'0002');
select * from semp;
select * from sdept;
delete from semp where EMPNO='0003';

/*==================================================================End==================================================================*/

/*Create S, P, J, SPJ tables as specified below and insert a few rows in each table:- 
 SUPPLIER 
(S#, Sname, Status, City) 
- S 
PARTS 
(P#, Pname, Color, Weight, City) 
- P 
PROJECTS 
(J#, Jname, City) 
- J 
SUPPLIER-PARTS-PROJECT 
(S#, P#, J#, Qty) 
 - SPJ 
Sample data for S# column:- ‘S1’, ‘S2’, ‘S3’, etc. 
Sample data for P# column:- ‘P1’, ‘P2’, ‘P3’, etc. 
Sample data for J# column:- ‘J1’, ‘J2’, ‘J3’, etc. 
Sample data for Status column:- 10, 20, 30, etc. 
 Write the SELECT queries to do the following:- */
 
 create table s(Sno char(4),Sname char(20),Status int,city char(20));
 
create table p(Pno char(4),Pname char(20),color char(20),Weight int,city char(20));

create table J(Jno char(4),Jname char(20),city char(20));

create table SPJ(Sno char(4),Pno char(4),Jno char(4), QTY int);

select * from s;
select * from p;
select * from J;
select * from SPJ;

insert into s (Sno,Sname,Status,city)
values ('S1','Supplier1',10,'London'),('S2','Supplier2',20,'Paris'),('s3','Supplier3',30,'Athens');
select * from s;
SET SQL_SAFE_UPDATES=0;
update s set Sno='S3' where  Sname='Supplier3';

insert into P (Pno,Pname,color,Weight,city)
values ('P1','Part1','Red',11,'London'),('P2','Part2','Black',12,'Paris'),('P3','Part3','Orange',14,'Athens');
insert into P values('P4','Saya1','purple',9,'Mumbai'),('P5','Riya','Blue',21,'thane');
insert into P values('p6','Saya2','green',3,'Mumbai'),('p7','shreya','grey',4,'thane');

insert into J (Jno,Jname,city)
values('J1','Jproject1','London'),('J2','Jproject2','Paris'),('J3','Jproject3','Athens');

insert into SPJ values('S1','P1','J1',1),
('S2','P2','J2',2),
('S3','P3','J3',3);
select * from SPJ;
drop table SPJ;

/*5. Display all the data from the S table. */
select * from s;

/*6. Display only the S# and SNAME fields from the S table.*/
select Sno, Sname from s;


 /*7. Display the PNAME and COLOR from the P table for the CITY=”London”.*/
select Pname,color from p where city='London';

/*8. Display all the Suppliers from London. */
select Sname from s where city='London';

/*9. Display all the Suppliers from Paris or Athens.*/
select Sname from s where city='Paris' or city='Athens';

/*10. Display all the Projects in Athens. */
select * from p where city='Athens';

/*11. Display all the Partnames with the weight between 12 and 14 (inclusive of both).*/
select pname from p where weight<=14 and weight>=12;

/*12. Display all the Suppliers with a Status greater than or equal to 20*/
select sname from s where status>=20;

/*13. Display all the Suppliers except the Suppliers from London*/
select sname from s where city!='London';

/*14. Display only the Cities from where the Suppliers come from. */
select  Sname,city from s;

/*15. Assuming that the Part Weight is in GRAMS, display the same in 
MILLIGRAMS and KILOGRAMS. */
select Pno, weight "Grams" , weight * 1000 as "Miligrams", weight/1000 as "Kilograms" from p;

/*1. Display the Supplier table in the descending order of CITY. */
select * from s order by city desc;
select * from s order by city asc;

/*2. Display the Part Table in the ascending order of CITY and within the city in 
the ascending order of Part names. */
select * from P order by city asc,Pname asc;

/*3. Display all the Suppliers with a status between 10 and 20. */
select * from s where status>=10 and status<=20;
select * from s where status between 10 and 20;

/*4. Display all the Parts and their Weight, which are not in the range of 10 and 15. */
select * from p where weight not between 10 and 20;

/*5. Display all the Part names starting with the letter ‘S’. */
select Pname from p where Pname like 's%' or Pname like 'S%';
select Pname from P where Pname >='S' and Pname < 'T';
select pname from p where pname like 'r%' or pname like 'R%';
select pname from p where pname like '%1';

/*6. Display all the Suppliers, belonging to cities starting with the letter ‘L’. */
select * from s where  city like 'L%';
select * from P where Pname like '____1%';

/*7. Display all the Projects, with the third letter in JNAME as ‘n’*/
select * from J where Jname like '__n%';
select * from J where city like '__n%';





/*1. Display all the Supplier names with the initial letter capital. */
select concat(upper(substring(sname,1,1)),lower(substring(sname,2))) from s;

/* 2. Display all the Supplier names in upper case. */
select upper(sname) from s;

/*3. Display all the Supplier names in lower case. */
select lower(sname) from s;

 /*4. Display all the Supplier names padded to 25 characters, with spaces on the left. */
select lpad(sname,25,' ') from s;
select lpad(rtrim(sname),25,' ') from s;

 /*5. Display all the Supplier names (with ‘la’ replaced by ‘ro’). 
 HINT: REPLACE. */
select replace(sname,'li','ro') from s;
select replace(sname,'la','ro') from s;

 /*6. Implement the above command such that ‘l’ is replaced with ‘r’ and ‘a’ is replaced
with ‘o’. */
/*select translate (sname,'la','ro') from s;*/
select replace(replace(sname,'u','o'),'r','c')from s;

 /*7. Display the Supplier names and the lengths of the names. */
select sname,length(sname) from s;

/*8. Use the soundex function to search for a supplier by the name of ‘BLOKE’. */
select sname from s where soundex(sname)=soundex('BLOKE');
 select sname from s where soundex(sname)=soundex('Sopp');
 
 /*center justification with * both side */
select concat (lpad (SName , 80 , '*'),rpad (SName , 80 ,'*')) from s ;
select concat ((lpad (SName , 80 , '*'),rpad (80 ,'*')) )from s ;
commit;

 /*9. Display the Supplier name and the status (as Ten, Twenty, Thirty, etc.). */
 select Sname,
 case
 when status=10 then 'Ten'
 when status=20 then 'Twenty'
 when status=30 then 'Thirty'
 when status=40 then 'Fourty'
 end "Status"
 from s;
 
/*10.Display the current day (e.g. Thursday).*/
select dayname(sysdate()) from dual;
select dayname(sysdate()) as "today" from dual;
select upper(dayname(sysdate()))from dual;
select  now() from dual;
select sysdate(),now() from dual;
select sysdate(),now(),sleep(10),sysdate(),now() from dual;
select adddate(sysdate(),1) from dual;
select adddate(sysdate(),3)from dual;

/*1. Display the minimum Status in the Supplier table. */
 select min(status) as "MIN" from s;
 
#2. Display the maximum Weight in the Parts table. 
 select max(Weight) "Max" from p;
 
#3. Display the average Weight of the Parts. 
select avg(Weight) "AVG" from p;

 #4. Display the total Quantity sold for part ‘P1’. 
 select sum(QTY) from spj where pno='P1';
 
#5. Display the total Quantity sold for each part. 
 select pno,sum(qty) from spj
 group by pno
 order by pno;
 
#6. Display the average Quantity sold for each part. 
 select pno, avg(QTY) from spj
 group by pno
 order by pno;
 
#7. Display the maximum Quantity sold for each part, provided the maximum Quantity 
#is greater than 800. 
 select pno, max(QTY) from spj 
 where qty> 800 
 group by pno;
 
#8. Display the Status and the count of Suppliers with that Status. 
 select status ,count(sno) from s group by Status;
 
#9. Display the count of Projects going on in different cities.
select city, count(jno) from j group by city; 
 
#10. What is the difference between COUNT(Status) and COUNT(*) ? 
 select count(status) from s;
 select count(*) from spj;
#11. Display the Status and the Count of Suppliers with that Status in the following format as shown below:- 
#Status Count 
#Ten 1 
#Twenty 2 
#Thirty 3

select 
case
when status='10' then 'Ten'
when status='20' then 'TWenty'
when status='30' then 'Thirty'
when status='40' then 'Forty'
when status='50' then 'Fifty'
else 'other'
end 'status', count(sno) from s group by status;

#1. Display the Supplier name and the Quantity sold. 
select sname,QTY from s,spj
where spj.sno=s.sno;

 #2. Display the Part name and Quantity sold. 
 select pname,QTY from p,spj
 where spj.pno=p.pno;
 
#3. Display the Project name and Quantity sold. 
 select jname,qty from j,spj
 where spj.jno=j.jno;

#4. Display the Supplier name, Part name, Project name and Quantity sold. 
 select sname,pname,jname,sum(QTY) from p,s,j,spj
 where spj.jno=j.jno and spj.sno=s.sno and spj.pno=p.pno
 group by sname;
 
#5. Display the Supplier name, Supplying Parts to a Project in the same City.
 select sname,pname,jname,s.city
 from s,p,j
 group by city;
 
#6. Display the Part name that is ‘Red’ is color, and the Quantity sold. 
 select pname,qty,color from p,spj
 where p.color='Red' and spj.pno=p.pno;

#7. Display all the Quantity sold by Suppliers with the Status = 20. 
select sname,qty,status
from s,spj
where spj.sno=s.sno and status='20';
 
#8. Display all the Parts and Quantity with a Weight > 14. 
select pname,qty,weight from p,spj
where spj.pno=p.pno and weight>14;

#9.
 select  jname,qty,city from j,spj
 where qty>500 and spj.jno=j.jno;
 
#10. Display all the Part names and Quantity sold that have a Weight less than 15. 
 select pname,qty,weight from p,spj 
 where weight < 15 and spj.pno=p.pno;


