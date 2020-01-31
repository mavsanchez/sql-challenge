-- List the following details of each employee: employee number, last name, first name, gender, and salary.

select
emp.employeeid,
emp.lastname,
emp.firstname,
emp.gender,
sal.salary
from employee as emp
join salary sal on emp.employeeid = sal.employeeid
;

-- List employees who were hired in 1986.
select
emp.*
from employee as emp
where extract(year from emp.hiredate) = 1986
;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select
dep.departmentid,
dep.deptname,
dm.employeeid,
emp.lastname,
emp.firstname,
dm.fromdate,
dm.todate
from department_manager dm
join employee emp on dm.employeeid = emp.employeeid
join department dep on dm.departmentid = dep.departmentid
where dm.todate = '9999-01-01'
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select
de.employeeid,
emp.lastname,
emp.firstname,
dep.deptname
from department_employee de
join employee emp on de.employeeid = emp.employeeid
join department dep on de.departmentid = dep.departmentid
where de.todate = '9999-01-01'
;


-- List all employees whose first name is "Hercules" and last names begin with "B."
select * from
employee
where
firstname = 'Hercules' and lastname like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
emp.employeeid,
emp.lastname,
emp.firstname,
dep.deptname
from employee emp
join department_employee de on de.employeeid = emp.employeeid
join department dep on de.departmentid = dep.departmentid
where de.todate = '9999-01-01'
and dep.deptname = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
emp.employeeid,
emp.lastname,
emp.firstname,
dep.deptname
from employee emp
join department_employee de on de.employeeid = emp.employeeid
join department dep on de.departmentid = dep.departmentid
where de.todate = '9999-01-01'
and dep.deptname in ('Sales', 'Development')
;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select
lastname,
count(*) as count_name
from employee
group by lastname
order by count_name desc;