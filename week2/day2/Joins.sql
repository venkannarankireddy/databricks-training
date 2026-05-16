# SQL JOINS
  
Table Structure and Data (Example)
Here’s a sample table structure and data for these questions:

Table: employees
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT,
dept_id INT
);
INSERT INTO employees (emp_id, emp_name, manager_id, dept_id) VALUES
(1, 'Karthik', NULL, 1),
(2, 'Ajay', 1, 1),
(3, 'Vijay', 1, 2),
(4, 'Vinay', 2, 2),
(5, 'Meena', 3, 3),
(6, 'Veer', NULL, 4),
(7, 'Keerthi', 4, 5),
(8, 'Priya', 4, 5);

Table: departments
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

Table: projects
CREATE TABLE projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
emp_id INT
);

INSERT INTO projects (project_id, project_name, emp_id) VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3),
(4, 'Project D', 4),
(5, 'Project E', 5);

##Practice Questions
  
1. Retrieve employees and their managers (including employees without managers)
SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

 2. Display all employees and their departments (including employees without departments)

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


 3. Employees who report to a manager along with manager name

SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

 4. Find total salary paid to each employee and department (including departments with no employees)

SELECT d.dept_name,
       e.emp_name,
       s.salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
LEFT JOIN salary s
ON e.emp_id = s.emp_id;

5. Employees who do not belong to any department

SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

6. Employees and the projects they are assigned to (show NULL if no project)

SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

7. Employees who completed at least one project

SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id;

8. Employees and their projects without omitting any project

SELECT e.emp_name,
       p.project_name
FROM employees e
RIGHT JOIN projects p
ON e.emp_id = p.emp_id;


9. Employees and their salaries (show NULL if salary record is missing)

SELECT e.emp_name,
       s.salary
FROM employees e
LEFT JOIN salary s
ON e.emp_id = s.emp_id;

10. Employees and their department names (including employees without departments)

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

11. Names of all departments and employees (including departments with no employees)
SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;
12. Employees with their contact information (including employees without contacts)
SELECT e.emp_name,
       c.phone_number,
       c.email
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;
13. Employees and department names including:
employees without departments and departments without employees
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
14. Employees who have not completed any project
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;
15. Employees and their projects (including employees without projects)
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;
16. All projects and assigned employees (including projects without employees)
SELECT p.project_name,
       e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.emp_id = e.emp_id;
17. Employees who have both a manager and at least one project
SELECT e.emp_name AS employee,
       m.emp_name AS manager,
       p.project_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
INNER JOIN projects p
ON e.emp_id = p.emp_id;
18. Employees and department names excluding employees without departments
SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
19. Employees belonging to multiple departments
SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
20. List all departments and employees including departments with no employees
SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;
21. Employees who worked on at least one project and do not belong to a department
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
WHERE e.dept_id IS NULL;
22. Total number of employees in each department including departments with no employees
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
23. Employees and their managers excluding employees without managers
SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;
24. All employees and their managers including employees without managers
SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;
25. Departments and number of employees including empty departments
SELECT d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
26. All employees and their departments including departments with no employees
SELECT e.emp_name,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
27. Employees without salary records
SELECT e.emp_name
FROM employees e
LEFT JOIN salary s
ON e.emp_id = s.emp_id
WHERE s.salary IS NULL;
28. Employees and their project assignments including employees without projects
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;
29. Employees with department and project assignments including missing data
SELECT e.emp_name,
       d.dept_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.emp_id = p.emp_id;
30. Employees with department names including employees without departments
SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;















