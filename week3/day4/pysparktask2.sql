PySpark withColumnRenamed()
  
1. Rename emp_name to employee_name
df.withColumnRenamed("emp_name", "employee_name").show()
2. Rename department to dept
df.withColumnRenamed("department", "dept").show()
3. Rename joining_date to doj
df.withColumnRenamed("joining_date", "doj").show()
4. Rename salary to monthly_salary
df.withColumnRenamed("salary", "monthly_salary").show()
5. Rename designation to job_role
df.withColumnRenamed("designation", "job_role").show()
6. Rename city to work_location
df.withColumnRenamed("city", "work_location").show()
7. Rename age to employee_age
df.withColumnRenamed("age", "employee_age").show()
8. Rename multiple columns one by one
df.withColumnRenamed("emp_name", "employee_name") \
  .withColumnRenamed("salary", "monthly_salary") \
  .withColumnRenamed("department", "dept") \
  .show()
9. Rename emp_id to employee_id
df.withColumnRenamed("emp_id", "employee_id").show()
10. Rename department to business_unit
df.withColumnRenamed("department", "business_unit").show()


PySpark withColumn()
  
1. Create bonus column as 10% of salary
from pyspark.sql.functions import col

df.withColumn("bonus", col("salary") * 0.10).show()
2. Create annual_salary column
df.withColumn("annual_salary", col("salary") * 12).show()
3. Create tax column as 5% of salary
df.withColumn("tax", col("salary") * 0.05).show()
4. Create updated_salary by adding 5000
df.withColumn("updated_salary", col("salary") + 5000).show()
5. Create salary_category column (High / Medium / Low)
from pyspark.sql.functions import when

df.withColumn(
    "salary_category",
    when(col("salary") >= 80000, "High")
    .when(col("salary") >= 50000, "Medium")
    .otherwise("Low")
).show()
6. Create age_group column (Young / Adult)
df.withColumn(
    "age_group",
    when(col("age") < 30, "Young")
    .otherwise("Adult")
).show()
7. Create location column by combining city and department
from pyspark.sql.functions import concat_ws

df.withColumn(
    "location",
    concat_ws("-", col("city"), col("department"))
).show()
8. Create increment_salary column with 15% hike
df.withColumn(
    "increment_salary",
    col("salary") * 1.15
).show()
9. Create experience_status column based on joining year
from pyspark.sql.functions import year

df.withColumn(
    "experience_status",
    when(year(col("joining_date")) < 2022, "Experienced")
    .otherwise("Fresher")
).show()
10. Create name_length column using employee name
from pyspark.sql.functions import length

df.withColumn(
    "name_length",
    length(col("emp_name"))
).show()
11. Create is_high_salary column using condition
df.withColumn(
    "is_high_salary",
    when(col("salary") > 80000, True)
    .otherwise(False)
).show()
12. Create joining_year column from joining_date
df.withColumn(
    "joining_year",
    year(col("joining_date"))
).show()
13. Create salary_after_tax column
df.withColumn(
    "salary_after_tax",
    col("salary") - (col("salary") * 0.05)
).show()
14. Create department_code column
from pyspark.sql.functions import substring

df.withColumn(
    "department_code",
    substring(col("department"), 1, 3)
).show()
15. Create double_salary column
df.withColumn(
    "double_salary",
    col("salary") * 2
).show()

PySpark TypeCasting
  
1. Convert salary to string datatype
from pyspark.sql.functions import col

df.withColumn(
    "salary",
    col("salary").cast("string")
).show()
2. Convert age to double datatype
df.withColumn(
    "age",
    col("age").cast("double")
).show()
3. Convert joining_date to date datatype
df.withColumn(
    "joining_date",
    col("joining_date").cast("date")
).show()
4. Convert emp_id to string datatype
df.withColumn(
    "emp_id",
    col("emp_id").cast("string")
).show()
5. Convert salary to integer datatype
df.withColumn(
    "salary",
    col("salary").cast("int")
).show()
6. Convert age to string datatype
df.withColumn(
    "age",
    col("age").cast("string")
).show()
7. Convert joining_date to timestamp datatype
df.withColumn(
    "joining_date",
    col("joining_date").cast("timestamp")
).show()
8. Convert salary to float datatype
df.withColumn(
    "salary",
    col("salary").cast("float")
).show()
9. Convert emp_id to long datatype
df.withColumn(
    "emp_id",
    col("emp_id").cast("long")
).show()
10. Convert multiple columns into different datatypes
df.withColumn("salary", col("salary").cast("float")) \
  .withColumn("age", col("age").cast("double")) \
  .withColumn("joining_date", col("joining_date").cast("date")) \
  .show()
  
PySpark SORT / ORDERBY
  
1. Sort employees by salary ascending
df.orderBy("salary").show()
2. Sort employees by salary descending
df.orderBy(df.salary.desc()).show()
3. Sort employees by age descending
df.orderBy(df.age.desc()).show()
4. Sort employees by emp_name ascending
df.orderBy("emp_name").show()
5. Sort employees by city and salary descending
df.orderBy("city", df.salary.desc()).show()
6. Sort employees by joining_date
df.orderBy("joining_date").show()
7. Sort employees by department
df.orderBy("department").show()
8. Sort employees by designation descending
df.orderBy(df.designation.desc()).show()
9. Sort employees first by city then age
df.orderBy("city", "age").show()
10. Sort employees by salary and limit top 10
df.orderBy(df.salary.desc()).limit(10).show()
11. Sort employees by emp_id descending
df.orderBy(df.emp_id.desc()).show()
12. Sort employees from IT department by salary descending
df.filter(df.department == "IT") \
  .orderBy(df.salary.desc()) \
  .show()
13. Sort employees by joining_date descending
df.orderBy(df.joining_date.desc()).show()
14. Sort employees alphabetically by emp_name
df.orderBy("emp_name").show()
15. Sort employees by multiple columns
df.orderBy("department", df.salary.desc(), "age").show()
