 PySpark SELECT Operations
   
1. Select only emp_name and salary
df.select("emp_name", "salary").show()
2. Select emp_id, emp_name, and department
df.select("emp_id", "emp_name", "department").show()
3. Select city, designation, and salary
df.select("city", "designation", "salary").show()
4. Select all employees from only IT department with selected columns
df.filter(df.department == "IT") \
  .select("emp_name", "department", "salary") \
  .show()
5. Select emp_name, joining_date, and salary
df.select("emp_name", "joining_date", "salary").show()
6. Select first 5 columns from dataframe
df.select(df.columns[:5]).show()
7. Select employees whose salary column only
df.select("salary").show()
8. Select emp_name and city for employees from Hyderabad
df.filter(df.city == "Hyderabad") \
  .select("emp_name", "city") \
  .show()
9. Select designation and department
df.select("designation", "department").show()
10. Select all columns except joining_date
df.drop("joining_date").show()

PySpark ALIAS Operations
   
1. Display emp_name as employee_name
df.select(df.emp_name.alias("employee_name")).show()
2. Display salary as monthly_salary
df.select(df.salary.alias("monthly_salary")).show()
3. Display department as dept
df.select(df.department.alias("dept")).show()
4. Display joining_date as doj
df.select(df.joining_date.alias("doj")).show()
5. Select emp_name as name and city as location
df.select(
    df.emp_name.alias("name"),
    df.city.alias("location")
).show()
6. Display designation as job_role
df.select(df.designation.alias("job_role")).show()
7. Display age as employee_age
df.select(df.age.alias("employee_age")).show()
8. Select multiple columns using aliases
df.select(
    df.emp_id.alias("id"),
    df.emp_name.alias("employee_name"),
    df.salary.alias("monthly_salary")
).show()
9. Display salary as emp_salary and department as emp_dept
df.select(
    df.salary.alias("emp_salary"),
    df.department.alias("emp_dept")
).show()
10. Display city as work_location
df.select(df.city.alias("work_location")).show()


PySpark FILTER / WHERE Operations
   
1. Filter employees whose salary is greater than 70000
df.filter(df.salary > 70000).show()
2. Filter employees from Hyderabad
df.filter(df.city == "Hyderabad").show()
3. Filter employees whose age is less than 25
df.filter(df.age < 25).show()
4. Filter employees from IT department
df.filter(df.department == "IT").show()
5. Filter employees whose designation is Developer
df.filter(df.designation == "Developer").show()
6. Filter employees whose salary is between 50000 and 80000
df.filter((df.salary >= 50000) & (df.salary <= 80000)).show()
7. Filter employees whose city is Bangalore
df.filter(df.city == "Bangalore").show()
8. Filter employees who joined after 2022-01-01
df.filter(df.joining_date > "2022-01-01").show()
9. Filter employees whose age is greater than 30
df.filter(df.age > 30).show()
10. Filter employees whose salary is less than 50000
df.filter(df.salary < 50000).show()
11. Filter employees from Chennai and salary greater than 60000
df.filter((df.city == "Chennai") & (df.salary > 60000)).show()
12. Filter employees from Mumbai or Pune
df.filter((df.city == "Mumbai") | (df.city == "Pune")).show()
13. Filter employees whose name starts with 'S'
df.filter(df.emp_name.startswith("S")).show()
14. Filter employees whose name ends with 'a'
df.filter(df.emp_name.endswith("a")).show()
15. Filter employees whose department is HR
df.filter(df.department == "HR").show()
16. Filter employees whose designation contains 'Engineer'
df.filter(df.designation.contains("Engineer")).show()
17. Filter employees whose city is not Hyderabad
df.filter(df.city != "Hyderabad").show()
18. Filter employees aged between 25 and 30
df.filter((df.age >= 25) & (df.age <= 30)).show()
19. Filter employees with salary greater than 90000
df.filter(df.salary > 90000).show()
20. Filter employees from Support department
df.filter(df.department == "Support").show()

PySpark LIMIT Operations
1. Display first 5 records
df.limit(5).show()
2. Display top 10 employees
df.limit(10).show()
3. Display first 3 employees from IT department
df.filter(df.department == "IT") \
  .limit(3) \
  .show()
4. Display top 5 highest salary employees
df.orderBy(df.salary.desc()) \
  .limit(5) \
  .show()
5. Display lowest 5 salary employees
df.orderBy("salary") \
  .limit(5) \
  .show()
6. Display first 7 rows after sorting by age
df.orderBy("age") \
  .limit(7) \
  .show()
7. Display first 2 employees from Hyderabad
df.filter(df.city == "Hyderabad") \
  .limit(2) \
  .show()
8. Display first 15 records from dataframe
df.limit(15).show()
9. Display top 5 youngest employees
df.orderBy("age") \
  .limit(5) \
  .show()
10. Display first 8 employees after filtering salary > 60000
df.filter(df.salary > 60000) \
  .limit(8) \
  .show()
