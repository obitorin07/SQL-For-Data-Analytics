CREATE TABLE employees1 (
    emp_id SERIAL PRIMARY KEY,
    emp_name TEXT,
    emp_department TEXT,
    emp_salary INTEGER
);



CREATE TABLE employees2 (
    emp_id INTEGER PRIMARY KEY,
    emp_address TEXT,
    emp_phone TEXT,
    emp_email TEXT
);

select * from employees2;

select * from employees1;


select emp_name , employees1.emp_id, employees2.emp_id, emp_email from employees1 , employees2;
-- cartesian product s