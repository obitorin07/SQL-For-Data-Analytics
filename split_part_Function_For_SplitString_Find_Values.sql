select Full_Name from people_information where (split_part(full_name ,' ',2) like '____');
-- split_part function is first spliting data by delimeter '' this and then it go to second(2) splited data and finding 4 length values  


select Full_Name from people_information where (split_part(full_name ,' ',2) like '___');

-- split_part function is first spliting data by delimeter '' this and then it go to second(2) splited data and finding 3 length values  

select Full_Name from people_information where (split_part(full_name ,' ',1) like '___');
-- split_part function is first spliting data by delimeter '' this and then it go to 1st splited data and finding 3 length values like 3 letter name 



select full_name from people_information where (split_part(full_name , ' ' , 2) )like '__' ;