CREATE DATABASE project_01;
 USE project_01;
 
SELECT *FROM hr;

-- rename column name
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20)NULL;

-- display datatypes of columns
DESCRIBE hr;
select birthdate from hr;

-- change birthdate format
set sql_safe_updates = 0;
update hr
set birthdate = case
when birthdate like'%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
else null
end;

-- change date datatype
alter table hr
modify column birthdate date;

-- change hire date format
update hr
set hire_date = case
when hire_date like'%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
else null
end;

-- changed hire_date data type
alter table hr
modify column hire_date date;

-- modify termdate column
select termdate from hr;


UPDATE hr
SET termdate = IFNULL(DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE termdate IS NOT NULL AND termdate != '';

UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate = '' OR termdate IS NULL;

-- create new column age 
alter table hr add column age int;

update hr
set age = timestampdiff(YEAR,birthdate, CURDATE());
select birthdate, age from hr;

select
	min(age) as youngest,
    max(age)as oldest
    from hr;
    
select count(*)from hr where age<18;
