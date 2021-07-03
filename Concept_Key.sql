create database Concept_Key;
use Concept_key;

create table student (id int primary key, name varchar(40), courseid int, marks int, emailid varchar(50), mobile int, address varchar(40));

create table course (courseid int primary key, name varchar(40), fees int, duration int, facname varchar(40));

insert into student values (1, 'lalit', 123, 10, 'lala', 950, 'pune'),(2, 'laleet', 1234, 30, 'lalalala', 93350, 'puneeeee'),(3, 'lalitttt', 1322, 20, 'shubh', 9673, 'pppune');

create table college (collegeid int primary key, name varchar(40), sid int, cid int, constraint shubham foreign key (sid) references student (id), 
constraint shubham1 foreign key (cid) references course (courseid));

desc student;
desc college;
