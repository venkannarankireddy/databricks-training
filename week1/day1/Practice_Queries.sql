SQl queries answers for day 1

Basic Queries Answers (1-5)

1. Select all columns from the Employee table
SELECT * FROM Employee;

2. Select only the name and salary columns
SELECT name, salary FROM Employee;

3. Select employees who are older than 30
SELECT * FROM Employee WHERE age > 30;

4. Select the names of all departments
SELECT name FROM Department;

5. Select employees who work in the IT department
Here you need to use department_id
SELECT * FROM Employee WHERE department_id = 1;

String Matching Queries (6–10)

6. Names start with 'J'
SELECT * 
FROM Employee
WHERE name LIKE 'J%';

7. Names end with 'e'
SELECT * 
FROM Employee
WHERE name LIKE '%e';

8. Names contain 'a'
SELECT * 
FROM Employee
WHERE name LIKE '%a%';

9. Names exactly 9 characters long
SELECT * 
FROM Employee
WHERE name LIKE '_________';
👉 9 underscores = exactly 9 characters

10. Names have 'o' as second character
SELECT * 
FROM Employee
WHERE name LIKE '_o%';
👉 _ = first character (anything)
👉 o = second character fixed


Date Queries (11–15)

(Assuming column name is hire_date — if different, replace it)

11. Employees hired in 2020
SELECT * 
FROM Employee
WHERE YEAR(hire_date) = 2020;

12. Employees hired in January (any year)
SELECT * 
FROM Employee
WHERE MONTH(hire_date) = 1;

13. Employees hired before 2019
SELECT * 
FROM Employee
WHERE hire_date < '2019-01-01';

14. Employees hired on or after March 1, 2021
SELECT * 
FROM Employee
WHERE hire_date >= '2021-03-01';

15. Employees hired in the last 2 years
SELECT * 
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;


Aggregate Queries (16–20)

16. Total salary of all employees
SELECT SUM(salary) AS total_salary
FROM Employee;

17. Average salary of employees
SELECT AVG(salary) AS average_salary
FROM Employee;

18. Minimum salary in Employee table
SELECT MIN(salary) AS minimum_salary
FROM Employee;

19. Number of employees in each department
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id;

20. Average salary in each department
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id;


Group By Queries (21–25)

21. Total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

22. Average age in each department
SELECT department_id, AVG(age) AS avg_age
FROM Employee
GROUP BY department_id;

23. Number of employees hired in each year
MySQL version:
SELECT YEAR(hire_date) AS year, COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date);

Databricks (Spark SQL):
SELECT year(hire_date) AS year, COUNT(*) AS total_employees
FROM Employee
GROUP BY year(hire_date);

24. Highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

25. Department with the highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;


HAVING Queries (26–30)

26. Departments with more than 2 employees
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

27. Departments with average salary > 55000
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

28. Years with more than 1 employee hired
MySQL:
SELECT YEAR(hire_date) AS year, COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

Databricks (Spark SQL):
SELECT year(hire_date) AS year, COUNT(*) AS total_employees
FROM Employee
GROUP BY year(hire_date)
HAVING COUNT(*) > 1;

29. Departments with total salary < 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

30. Departments with maximum salary > 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

ORDER BY Queries (31–35)

31. Employees ordered by salary (ascending)
SELECT *
FROM Employee
ORDER BY salary ASC;

32. Employees ordered by age (descending)
SELECT *
FROM Employee
ORDER BY age DESC;

33. Employees ordered by hire date (ascending)
SELECT *
FROM Employee
ORDER BY hire_date ASC;

34. Employees ordered by department, then salary
SELECT *
FROM Employee
ORDER BY department_id ASC, salary ASC;

35. Departments ordered by total salary of employees
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary ASC;

JOINS (36-45)

36. Select employee names along with their department names.
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

37. Select project names along with the department names they belong to.
SELECT p.name AS project_name, d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

38. Select employee names and their corresponding project names.
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

39. Select all employees and their departments, including those without a department.
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

40. Select all departments and their employees, including departments without employees.
SELECT d.name AS department_name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

41. Select employees who are not assigned to any project.
SELECT e.name AS employee_name
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

42. Select employees and the number of projects their department is working on.
SELECT e.name AS employee_name,
       COUNT(p.project_id) AS total_projects
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

43. Select the departments that have no employees.
SELECT d.name AS department_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

44. Select employee names who share the same department with 'John Doe'.
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
)
AND name <> 'John Doe';

45. Select the department name with the highest average salary.
SELECT d.name AS department_name
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;


Nested and Correlated Queries (46-55)

46. Select the employee with the highest salary.
SELECT *FROM EmployeeWHERE salary = (SELECT MAX(salary)    FROM Employee);

47. Select employees whose salary is above the average salary.
SELECT *FROM EmployeeWHERE salary > (SELECT AVG(salary)    FROM Employee);

48. Select the second highest salary from the Employee table.
SELECT MAX(salary) AS second_highest_salaryFROM EmployeeWHERE salary < (SELECT MAX(salary)    FROM Employee);

49. Select the department with the most employees.
SELECT department_id, COUNT(*) AS total_employeesFROM EmployeeGROUP BY department_idORDER BY total_employees DESCLIMIT 1;

50. Select employees who earn more than the average salary of their department.
SELECT e1.*FROM Employee e1WHERE salary > (SELECT AVG(e2.salary)    FROM Employee e2    WHERE e1.department_id = e2.department_id);

51. Select the nth highest salary (for example, 3rd highest).
SELECT DISTINCT salaryFROM Employee e1ORDER BY salary DESCLIMIT 1 OFFSET 2;

52. Select employees who are older than all employees in the HR department.
SELECT *FROM EmployeeWHERE age > ALL (SELECT age    FROM Employee    WHERE department_id = (SELECT department_id  FROM Department  WHERE name = 'HR'));

53. Select departments where the average salary is greater than 55000.
SELECT department_id, AVG(salary) AS average_salaryFROM EmployeeGROUP BY department_idHAVING AVG(salary) > 55000;

54. Select employees who work in a department with at least 2 projects.
SELECT *FROM EmployeeWHERE department_id IN (SELECT department_id  FROM Project GROUP BY department_id HAVING COUNT(project_id) >= 2);

55. Select employees who were hired on the same date as 'Jane Smith'.
SELECT *FROM EmployeeWHERE hire_date = (SELECT hire_date    FROM Employee  WHERE name = 'Jane Smith');

Combined Modern Difficulty Queries (56-65)

56. Select the total salary of employees hired in the year 2020.
SELECT SUM(salary) AS total_salaryFROM EmployeeWHERE YEAR(hire_date) = 2020;

57. Select the average salary of employees in each department, ordered by the average salary in descending order.
SELECT department_id,       AVG(salary) AS average_salaryFROM EmployeeGROUP BY department_idORDER BY average_salary DESC;

58. Select departments with more than 1 employee and an average salary greater than 55000.
SELECT department_id,COUNT(*) AS total_employees,AVG(salary) AS average_salaryFROM EmployeeGROUP BY department_idHAVING COUNT(*) > 1AND AVG(salary) > 55000;

59. Select employees hired in the last 2 years, ordered by their hire date.
SELECT *FROM EmployeeWHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)ORDER BY hire_date;

60. Select the total number of employees and the average salary for departments with more than 2 employees.
SELECT department_id,       COUNT(*) AS total_employees,AVG(salary) AS average_salaryFROM EmployeeGROUP BY department_idHAVING COUNT(*) > 2;

61. Select the name and salary of employees whose salary is above the average salary of their department.
SELECT e1.name, e1.salaryFROM Employee e1WHERE e1.salary > ( SELECT AVG(e2.salary)    FROM Employee e2    WHERE e1.department_id = e2.department_id);

62. Select the names of employees who are hired on the same date as the oldest employee in the company.
SELECT nameFROM EmployeeWHERE hire_date = ( SELECT MIN(hire_date)    FROM Employee);

63. Select the department names along with the total number of projects they are working on, ordered by the number of projects.
SELECT d.name AS department_name,       COUNT(p.project_id) AS total_projectsFROM Department dLEFT JOIN Project pON d.department_id = p.department_idGROUP BY d.department_id, d.nameORDER BY total_projects DESC;

64. Select the employee name with the highest salary in each department.
SELECT e1.name, e1.department_id, e1.salaryFROM Employee e1WHERE e1.salary = ( SELECT MAX(e2.salary)    FROM Employee e2    WHERE e1.department_id = e2.department_id);

65. Select the names and salaries of employees who are older than the average age of employees in their department.
SELECT e1.name, e1.salaryFROM Employee e1WHERE e1.age > ( SELECT AVG(e2.age)    FROM Employee e2    WHERE e1.department_id = e2.department_id);



























