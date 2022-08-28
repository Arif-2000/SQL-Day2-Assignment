--1. List all employees whose name begins with 'A'.
select ename from EMP where ename like 'A%'



--2. Select all those employees who don't have a manager.


select * from EMP where mgr_id is null

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 


select ename,empno,sal from EMP where sal between 1200 and 1400

--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 


select ename,empno,sal,(sal+(sal*0.10)) as 'Salary rise' from EMP

--5. Find the number of CLERKS employed. Give it a descriptive heading. 


select * from EMP where job='CLERK'

--6. Find the average salary for each job type and the number of people employed in each job. 


select job,avg(sal) as 'Average Salary',count(empno) as 'No.Of.Employees' from EMP group by job

--7. List the employees with the lowest and highest salary. 


select top 1 min(sal) as 'Lowest Salary',max(sal) as 'Highest Salary' from EMP

--8. List full details of departments that don't have any employees. 


select e.ename,e.empno,e.job,e.mgr_id,e.sal from EMP e right outer join DEPT d on e.deptno=d.deptno

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 


select ename,sal from EMP where job='Analyst' and sal>1200 and deptno=20 order by ename asc

--10. For each department, list its name and number together with the total salary paid to employees in that department. 


select deptno,ename,empno,sum(sal) as 'Total Salary' from EMP group by deptno,ename,empno

--11. Find out salary of both MILLER and SMITH.


select ename,sal from EMP where ename='MILLER' and ename='SMITH'
										 

--12. Find out the names of the employees whose name begin with �A� or �M�. 


select ename from EMP where ename like 'A%' or ename like 'M%'

--13. Compute yearly salary of SMITH.


select ename,12*(sal) as 'Yearly Salary' from EMP where ename='SMITH' group by ename

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 


select ename,sal from EMP where sal not between 1500 and 2850

--15. display list of managers who have more than 2 employees reporting to them


select mgr_id,count(empno) emp_count
from EMP
broup by mgr_id having (count(empno)>2)