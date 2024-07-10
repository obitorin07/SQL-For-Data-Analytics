#inner join query to return name and department id from tables

select ic.name , ad.departmentname from advancedsql.indiancelebrities as ic 
inner join advancedsql.departments ad 
on ic.DepartmentID =ad.DepartmentID;