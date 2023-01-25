create database lab1_db
use lab1_db
create table employees(
EMPLOYEE_ID int, 
FULL_NAME varchar(30),
EMAIL varchar(30),
PHONE_NUMBER varchar(30),
HIRE_DATE date,
JOB_ID varchar(15),
SALARY int)
select * from employees

Bulk insert job_grades
from 'C:\Users\Esken\Downloads\Telegram Desktop\job_grades.jpg.csv'
with (
format = 'CSV', 
firstrow = 2,
fieldterminator = ',',
rowterminator = '0x0a'
)

create table departments(
DEPARTMENT_ID int, 
DEPARTMENT_NAME varchar(30),
MANAGER_ID int,
LOCATION_ID int)
select * from departments

create table job_grades(
GRA varchar(30), 
LOWEST_SAL int,
HIGHEST_SAL int,
)

select * from job_grades

use lab1_db

