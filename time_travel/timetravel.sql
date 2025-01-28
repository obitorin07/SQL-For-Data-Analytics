
create or replace table k_job_market as select * from indian_job_market limit 10;

data_retention_time_in_days =1;


select * from k_job_market;


create or replace table time_travel ( jobod varchar(25) ,company_name varchar(25))
data_retention_time_in_days=1; 

-- 1 means 24hours 0 means off and if we add 1> it will not allow because 
--i'm using trial version so 24hours only i can time travel and

insert into time_travel select job_id,  company_name from k_job_market;

select * from time_travel;

select current_timestamp; -- 2025-01-28 09:20:43.399 +0000

delete from time_travel;

select * from time_travel;

alter session set timezone ='UTC';

-- i want to know before data how was it 

select * from time_travel before(timestamp => '2025-01-28 09:20:43.399 +0000' ::timestamp);



select * from time_travel;

create or replace table restored_data as 
select * from time_travel before(timestamp=> '2025-01-28 09:20:43.399 +0000' ::timestamp);

select * from restored_data;


-- using query id 

select * from time_travel;

update time_travel set company_name =  'i dont know ';
select * from time_travel;

select * from time_travel before(statement =>'01ba02b9-3201-666e-000b-6c160004f12e');

select * from time_travel at(offset=> -60*5); -- 5 minute before 