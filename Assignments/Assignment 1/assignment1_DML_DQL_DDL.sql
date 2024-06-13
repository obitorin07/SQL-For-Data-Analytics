create database student_marks ;


create table stu_marks(
	roll_no int,
	name varchar,
	marks int
);


-- NOW IMPORT CSV DATA

-- now assignments or practice\

-- SELECT AND WHERE

-- 1 retrieve all data from the table stu_marks
select * from stu_marks;

select * from stu_marks order by marks;

-- lets make some marks less than 50 because all rows have more than 50 so 
update stu_marks set marks =marks - 10 ;



-- 2 retrieve the names of students who have more than 70 marks
select name ,marks from stu_marks where marks >70;




-- 3 retrieve all data of students who have scored more than 35 but less than 60
select * from stu_marks where marks >35 and marks < 60; --18 students

select * from stu_marks where marks between 35 and 60;




-- 4 retrieve all data of students who have scored less than 40 or more than equal to  60

select * from stu_marks where marks <= 40 or 60>=marks order by marks;
-- <= im using because there is no data here i have all data more than 40 


-- UPDATING

-- 1 UPDATE the marks of roll_no 127 marks 50

update stu_marks set marks = 50 where roll_no = 127;

select * from stu_marks;


-- 2 delete the row containing details of student named 'Tara'

delete from stu_marks where name ='Tara';
select * from stu_marks;


-- 3 rename column name to student_name 

alter table stu_marks rename column name to student_name;
select * from stu_marks;


