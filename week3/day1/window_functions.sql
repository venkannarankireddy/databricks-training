Window Functions – Answers
  
🔹 ROW_NUMBER() ONLY Questions
  
1. Unique row number based on salary (highest first)
SELECT emp_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;
2. Row numbers within each department based on salary descending
SELECT emp_name,
       department,
       salary,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;
3. Row numbers based on joining date (latest first)
SELECT emp_name,
       join_date,
       ROW_NUMBER() OVER(ORDER BY join_date DESC) AS row_num
FROM employees;
4. Row numbers within each department based on earliest joining date
SELECT emp_name,
       department,
       join_date,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY join_date ASC) AS row_num
FROM employees;
5. Row numbers based on order date
SELECT emp_name,
       join_date,
       ROW_NUMBER() OVER(ORDER BY join_date) AS row_num
FROM employees;
6. Row numbers within each city based on order amount (highest first)
SELECT emp_name,
       department,
       salary,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;
7. Row numbers based on salary (lowest first)
SELECT emp_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary ASC) AS row_num
FROM employees;
8. Row numbers within department based on name alphabetically
SELECT emp_name,
       department,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY emp_name ASC) AS row_num
FROM employees;

🔹 RANK() ONLY Questions
  
9. Rank all employees based on salary (highest first)
SELECT emp_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS emp_rank
FROM employees;
10. Rank employees within each department based on salary
SELECT emp_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS emp_rank
FROM employees;
11. Rank employees based on joining date (latest gets rank 1)
SELECT emp_name,
       join_date,
       RANK() OVER(ORDER BY join_date DESC) AS emp_rank
FROM employees;
12. Rank orders based on order amount (highest first)
SELECT emp_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS order_rank
FROM employees;
13. Rank orders within each city based on order amount
SELECT emp_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS city_rank
FROM employees;
14. Rank employees within department based on salary (lowest first)
SELECT emp_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary ASC) AS emp_rank
FROM employees;
15. Rank employees based on name alphabetically
SELECT emp_name,
       RANK() OVER(ORDER BY emp_name ASC) AS emp_rank
FROM employees;
16. Rank orders within each city based on order date
SELECT emp_name,
       department,
       join_date,
       RANK() OVER(PARTITION BY department ORDER BY join_date) AS city_rank
FROM employees;

🔹 DENSE_RANK() ONLY Questions
  
17. Dense rank employees based on salary (highest first)
SELECT emp_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;
18. Dense rank within each department based on salary
SELECT emp_name,
       department,
       salary,
       DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank_num
FROM employees;
19. Dense rank employees based on joining date
SELECT emp_name,
       join_date,
       DENSE_RANK() OVER(ORDER BY join_date DESC) AS dense_rank_num
FROM employees;
20. Dense rank orders based on order amount
SELECT emp_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;
21. Dense rank within each city based on order amount
SELECT emp_name,
       department,
       salary,
       DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank_num
FROM employees;
22. Dense rank employees based on salary (lowest first)
SELECT emp_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary ASC) AS dense_rank_num
FROM employees;
23. Dense rank within department based on joining date
SELECT emp_name,
       department,
       join_date,
       DENSE_RANK() OVER(PARTITION BY department ORDER BY join_date ASC) AS dense_rank_num
FROM employees;
24. Dense rank orders based on order date
SELECT emp_name,
       join_date,
       DENSE_RANK() OVER(ORDER BY join_date ASC) AS dense_rank_num
FROM employees;
