use assignment;

-- 1 Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
 
 select first_name, last_name,salary from employees
 where salary > 
 (select salary as sal from employees  where last_name='Bull');
 
--  2 Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
 

 select first_name, last_name, employee_id from employees 
 where department_id=(select department_id where JOB_ID like 'IT_PROG');
 
-- 3  Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
 
 
 
-- 4  Write a query to find the name (first_name, last_name) of the employees who are managers. 
 
 select first_name, last_name from employees 
 where EMPLOYEE_ID =
 (select  EMPLOYEE_ID from employees where EMPLOYEE_ID = manager_id);
 
-- 5   Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
 
 
 
 
 select first_name, last_name, salary from employees where salary > 
 (select avg(salary) from employees);
 
 
 
--  6  Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
-- not done
select first_name, last_name,salary from employees  
where MIN_SALARY=
(select min(salary) from employees);

-- 7 Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.
 
 select first_name, last_name ,salary from employees
 where job_id ='IT_PROG' && salary > (select avg(salary) from employees);
 
 
 
-- 8 Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
 
select  first_name, last_name, salary from employees
where salary > 
(select salary from employees
 where last_name = 'bell');
 
-- 9 Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
 
 select  first_name, last_name,salary from employees,jobs where MIN_SALARY = salary && employees.job_id=jobs.JOB_ID;
 
-- 10  Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
 
 select first_name, last_name, salary from employees
 where salary >
 (select avg(salary) from employees);
 
 
-- 11  Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the 
-- 	Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest





