use practice1;
create table DEPTHEAD(DEPTNO int ,DHEAD varchar(20));
insert into DEPTHEAD(DEPTNO,DHEAD) values(1,'Arun'),(2,'Jack');
select * from Emp;
select * from dept;
select * from Depthead;
#joining two table
select ename,dname from emp,dept
where dept.Deptno=emp.Deptno;

select * from emp,dept
where dept.Deptno=emp.Deptno
order by 1;

select dept.Deptno,dname,loc,ename,job,sal
from emp,dept
where dept.deptno=emp.deptno;

select dept.deptno,dept.dname,dept.loc,emp.ename,emp.job,emp.sal
from emp,dept
where dept.Deptno=emp.deptno;

#Equijoin
select ename,dname from emp,dept
where dept.Deptno=emp.Deptno;

#Inequijoin
select ename,dname from emp,dept
where dept.Deptno!=emp.Deptno;

select dname,ename from emp right outer join dept
on(dept.deptno=emp.deptno);

select dname,ename from emp left outer join dept
on(dept.deptno=emp.deptno);

select dname,ename from emp right outer join dept
on(dept.deptno=emp.deptno)
	union
select dname,ename from emp left outer join dept
on(dept.deptno=emp.deptno);

#Cartesian join
select dname,ename from emp,dept;

#Self join
select a.ename,b.ename from emp b,emp a
where a.mgr=b.empno;

#inner join
SELECT emp.ename,dept.dname
FROM emp
INNER JOIN dept
ON dept.deptno = emp.deptno;

#left join
SELECT emp.ename,dept.dname
FROM emp
left join dept
ON dept.deptno = emp.deptno;

#right join
SELECT emp.ename,dept.dname
FROM emp
right join dept
ON dept.deptno = emp.deptno;

#joining three or more tables
select ename,dname,dhead from emp e,dept d,depthead dh
where dh.deptno=d.deptno and d.deptno=e.deptno;


#SubQureies
