use lab1_db

select * from employees
 --1 The Human Resources (HR) department needs data including id, full name, hiring date and
--salaries of all employees. 
select EMPLOYEE_ID, FULL_NAME, HIRE_DATE, SALARY from employees

--2 Write a query to display id, full names, email, annual salaries of all employees. 
select EMPLOYEE_ID, FULL_NAME, EMAIL, SALARY*12 as annual_salaries from employees

--3 The Human Resources (HR) department requests data for all unique jobs from the
--EMPLOYEES table. Job IDs should not be repeated in the output.
SELECT DISTINCT job_id FROM employees

--4 Due to funding problems, the HR department needs a report that provides all the information
--about the programmers whose salaries are over 5000.
select * from employees where salary>5000

--5 Generate a report to display the id, full name, and job title of all employees whose salaries
--range from 4000 to 7000 (including left and right boundaries). (USE BETWEEN!)
select EMPLOYEE_ID, FULL_NAME, JOB_ID from employees where SALARY between 4000 and 7000

--6 The HR department needs data on high-paid and low-paid employees. Write a query to display
--the full name, and salaries of all employees whose salaries are outside the range from 3000 to 9000 (USE BETWEEN!). 
select FULL_NAME, SALARY from employees where SALARY not between 4000 and 7000

--7 Write a query to display id, last names, first names, annual salaries of those employees whose
--annual salaries are below 50000. 
select EMPLOYEE_ID,
LEFT(FULL_NAME,  CHARINDEX(' ', FULL_NAME)) AS [FirstName],
RIGHT(FULL_NAME,CHARINDEX(' ', REVERSE(FULL_NAME))-1) AS [LastName],
salary*12 as annual_salaries
from employees
where salary*12 <50000

--8 Write a query to display id, full name, salaries of those employees whose salaries are in the
--range from 4000 to 7000 (excluding left and right boundaries). 
select EMPLOYEE_ID, FULL_NAME, SALARY
from employees
where 4000<= SALARY and SALARY<= 7000

--9Write a query to display id, full name, salaries, job title from the list of id «144, 102, 200, 205».
select EMPLOYEE_ID, FULL_NAME, SALARY, JOB_ID
from employees
where EMPLOYEE_ID in (144, 102, 200, 205)

--10. Write a query to display id, full name, salaries, job title not from the list of id «144, 102, 200, 205»
select EMPLOYEE_ID, FULL_NAME, SALARY, JOB_ID
from employees
where EMPLOYEE_ID not in (144, 102, 200, 205)


--11Write a query to display id, full name, salaries of those employees whose second letter of
--surname is the letter ‘a’.
select EMPLOYEE_ID, FULL_NAME, salary
from employees
where Charindex('a', RIGHT(FULL_NAME,CHARINDEX(' ', REVERSE(FULL_NAME))-1))=2

--12 Write a query to display all the names of employees where the third letter of name is ‘a’.
select 
LEFT(FULL_NAME,  CHARINDEX(' ', FULL_NAME)) AS [Name]
from employees
where Charindex('a', LEFT(FULL_NAME,  CHARINDEX(' ', FULL_NAME)))=3

--13 Write a query to display id, full name, email, salaries of those employees whose FIRST
--LETTER of NAME + last name = EMAIL of each employee. Example: full_name = Steven
--King, email = SKING. Here name is Steven → First Letter is S, last name = King. FIRST
--LETTER of NAME + last name is S + King = SKing = SKING. Consider upper and lower cases
--to be the same (S = s).
select EMPLOYEE_ID, FULL_NAME, EMAIL, SALARY
from employees
where upper(concat(substring(FULL_NAME, 1, 1), RIGHT(FULL_NAME,CHARINDEX(' ', REVERSE(FULL_NAME))-1) ))=upper(EMAIL)


--14 Write a query to display id, full name, email, salaries of all employees, sorting their salaries
--in ascending order then by hire date in descending order.
select EMPLOYEE_ID, FULL_NAME, EMAIL, SALARY
from employees
order by SALARY asc, HIRE_DATE desc

--15 Write a query to display id, full name, salaries of all employees, sorting their id in descending order.
select EMPLOYEE_ID, FULL_NAME, SALARY
from employees
order by EMPLOYEE_ID desc

--16 Write a query to display the average, maximum, minimum and the sum of all programmers' salaries.
select 
avg(SALARY) as [AVERAGE], 
max(SALARY) as [MAX], 
min(SALARY) as [MIN], 
sum(SALARY) as [SUM]
from employees
where JOB_ID = 'IT PROG'

--17Write a query to display the whole employee info whose first figure of phone number if the
--same as last figure the same phone number. Example: 650.121.2996. Here ‘6’ is the first figure as well as the last one.
select * 
from employees
where LEFT(PHONE_NUMBER, 1) = RIGHT(PHONE_NUMBER, 1)

--18 Write a query to display the number of unique professions.
select 
count(distinct job_id) as unique_prof
from employees

--19 Sum the salaries in the EMPLOYEES table for each job title.
select job_id, sum(SALARY) as [sum]
from employees
group by job_id

--20 Find the average salaries in the EMPLOYEES table for each job title.
select job_id, avg(SALARY) as [average]
from employees
group by job_id

--21  Find the maximum salaries in the EMPLOYEES table for each job title that exceed 10,000
--and sort them in descending order.l
select job_id, max(SALARY) as [maxi]
from employees
where SALARY>10000
group by job_id
order by maxi desc

--22 Find the maximum average salary for each job title.
select  max(average_sal) as [maxi]
from (select avg(SALARY) as average_sal
from employees
group by job_id) as [avg]

--23 Receive a report for each employee in the following form: “full_name” earns “salary” per
 -- month, but wants “triple salary”. Name the column Dream Salaries.
select concat(FULL_NAME, ' earns ', SALARY, ' per month, but wants ', SALARY*3) as Dream_salary
from employees

--24 Write a query to display the full name and the number of letters in the full name of 
-- employees (a space counts as one character).
select FULL_NAME, 
len(FULL_NAME) as lenght
from employees

--25 Write a query to display only first name from a column full_name. Example: FULL_NAME:
--‘Steven King’. The output must be 1 column named ‘first_name’ with the data ‘Steven’.
select 
left(FULL_NAME, CHARINDEX(' ', FULL_NAME)-1) as [first_name]
from employees

--26 Write a query to display the first three letters in the first names of employees.
select 
left(first_name, 3) as [3_name]
from (select 
left(FULL_NAME, CHARINDEX(' ', FULL_NAME)-1) as [first_name]
from employees) as [frst]


--27 Write a query to display the letters in the full names of employees in reverse order.
select 
reverse(FULL_NAME) as [reversed_name]
from employees


--28 Replace "en" characters in the full_names of employees with "yu" characters
select Full_name, 
Replace(Full_name, 'en', 'yu') as [replaced]
from employees

--29 Convert all letters in the full names of employees to uppercase.
select Full_name, 
upper(Full_name) as [upper]
from employees

--30  Write a query to display the employee's first name + 'has email' + email and name this column  "name_email" in lower case, 
--salary, phone_number of employees whose salary more than 5000 and sort it by Salary in descending order.
select 
lower(concat(left(FULL_NAME, CHARINDEX(' ', FULL_NAME)-1), ' has email ', Email)) as [name_email], 
Salary, 
PHONE_NUMBER
from employees
where salary > 5000
order by salary desc
