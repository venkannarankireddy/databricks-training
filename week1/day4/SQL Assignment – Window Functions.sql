SQL Assignment – Window Functions and CTEs

1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
SELECT emp_id, emp_name, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

2. Use RANK() to rank employees by salary.
SELECT emp_id, emp_name, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

3. Use DENSE_RANK() to rank employees by salary.
SELECT emp_id, emp_name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees;

4. Find the top 3 highest-paid employees using a window function.
SELECT *
FROM (
    SELECT emp_id, emp_name, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;

5. Rank employees within each department using PARTITION BY.
SELECT emp_id, emp_name, department, salary,
RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
) AS dept_rank
FROM employees;

6. Display the highest salary in each department using a window function.
SELECT emp_id, emp_name, department, salary,
MAX(salary) OVER (
    PARTITION BY department
) AS highest_salary
FROM employees;

7. Calculate the running total of order amounts ordered by order_date.
SELECT order_id, order_date, order_amount,
SUM(order_amount) OVER (
    ORDER BY order_date
) AS running_total
FROM orders;

8. Calculate the cumulative sales amount for each employee.
SELECT employee_id, sales_amount,
SUM(sales_amount) OVER (
    PARTITION BY employee_id
    ORDER BY sales_date
) AS cumulative_sales
FROM sales;

9. Use LAG() to show the previous order amount for each customer.
SELECT customer_id, order_id, order_amount,
LAG(order_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS previous_order_amount
FROM orders;

10. Use LEAD() to show the next order amount for each customer.
SELECT customer_id, order_id, order_amount,
LEAD(order_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS next_order_amount
FROM orders;

11. Find the difference between the current order amount and previous order amount.
SELECT customer_id, order_id, order_amount,order_amount - LAG(order_amount) OVER (    PARTITION BY customer_id    ORDER BY order_date) AS amount_differenceFROM orders;

12. Calculate a moving average of the last 3 orders.
SELECT order_id, order_date, order_amount,AVG(order_amount) OVER (    ORDER BY order_date    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_averageFROM orders;

13. Use NTILE(4) to divide employees into salary quartiles.
SELECT emp_id, emp_name, salary,NTILE(4) OVER (    ORDER BY salary DESC) AS salary_quartileFROM employees;

14. Find the first order placed by each customer using ROW_NUMBER().
SELECT *FROM (    SELECT customer_id, order_id, order_date, order_amount,    ROW_NUMBER() OVER (        PARTITION BY customer_id        ORDER BY order_date    ) AS rn    FROM orders) tWHERE rn = 1;

15. Find the latest order placed by each customer.
SELECT *FROM (    SELECT customer_id, order_id, order_date, order_amount,    ROW_NUMBER() OVER (        PARTITION BY customer_id        ORDER BY order_date DESC    ) AS rn    FROM orders) tWHERE rn = 1;

16. Display employee salaries along with department average salary.
SELECT emp_id, emp_name, department, salary,AVG(salary) OVER (    PARTITION BY department) AS dept_avg_salaryFROM employees;

17. Find employees earning above their department average salary.
SELECT *FROM (    SELECT emp_id, emp_name, department, salary,    AVG(salary) OVER (        PARTITION BY department    ) AS dept_avg_salary    FROM employees) tWHERE salary > dept_avg_salary;

18. Use SUM() OVER(PARTITION BY department) to calculate department payroll.
SELECT emp_id, emp_name, department, salary,SUM(salary) OVER (    PARTITION BY department) AS department_payrollFROM employees;

19. Find the percentage contribution of each employee salary within their department.
SELECT emp_id, emp_name, department, salary,ROUND(    (salary * 100.0) /    SUM(salary) OVER (PARTITION BY department),    2) AS salary_percentageFROM employees;

20. Use COUNT() OVER() to show total number of employees alongside each row.
SELECT emp_id, emp_name, department,COUNT(*) OVER () AS total_employeesFROM employees;

21. Create a CTE to calculate total sales per employee.
WITH employee_sales AS (
    SELECT employee_id,
    SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY employee_id
)
SELECT *
FROM employee_sales;

22. Use a CTE to find employees whose sales exceed the company average.
WITH employee_sales AS (
    SELECT employee_id,
    SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY employee_id
),
avg_sales AS (
    SELECT AVG(total_sales) AS company_avg
    FROM employee_sales
)
SELECT e.*
FROM employee_sales e, avg_sales a
WHERE e.total_sales > a.company_avg;

23. Create multiple CTEs to calculate customer total spending and rankings.
WITH customer_spending AS (
    SELECT customer_id,
    SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
customer_rankings AS (
    SELECT customer_id, total_spent,
    RANK() OVER (
        ORDER BY total_spent DESC
    ) AS spending_rank
    FROM customer_spending
)
SELECT *
FROM customer_rankings;

24. Write a recursive CTE to generate numbers from 1 to 10.
WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT *
FROM numbers;

25. Use a recursive CTE to display employee hierarchy data.
WITH RECURSIVE employee_hierarchy AS (
    SELECT emp_id, emp_name, manager_id
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees e
    JOIN employee_hierarchy eh
    ON e.manager_id = eh.emp_id
)
SELECT *
FROM employee_hierarchy;

26. Create a CTE that filters orders above the average order amount.
WITH avg_order AS (
    SELECT AVG(order_amount) AS avg_amount
    FROM orders
)
SELECT *
FROM orders
WHERE order_amount > (
    SELECT avg_amount
    FROM avg_order
);

27. Use a CTE and window function together to rank customers by total spending.
WITH customer_totals AS (
    SELECT customer_id,
    SUM(order_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id, total_spending,
RANK() OVER (
    ORDER BY total_spending DESC
) AS spending_rank
FROM customer_totals;

28. Find the second-highest salary in each department.
SELECT *
FROM (
    SELECT emp_id, emp_name, department, salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
    FROM employees
) t
WHERE salary_rank = 2;

29. Display the difference between each employee salary and the department maximum salary.
SELECT emp_id, emp_name, department, salary,
MAX(salary) OVER (
    PARTITION BY department
) - salary AS salary_difference
FROM employees;

30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales.
WITH employee_sales AS (
    SELECT employee_id, department,
    SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY employee_id, department
),
ranked_employees AS (
    SELECT *,
    RANK() OVER (
        PARTITION BY department
        ORDER BY total_sales DESC
    ) AS dept_rank
    FROM employee_sales
)
SELECT *
FROM ranked_employees
WHERE dept_rank = 1;

Bonus Challenge

Monthly sales trends using CTEs, Running Totals, LAG(), and Percentage Growth
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sales_date, '%Y-%m') AS month,
        SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY DATE_FORMAT(sales_date, '%Y-%m')
),
sales_trends AS (
    SELECT month,
    total_sales,

    SUM(total_sales) OVER (
        ORDER BY month
    ) AS running_total,

    LAG(total_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales

    FROM monthly_sales
)
SELECT month,
total_sales,
running_total,
previous_month_sales,

ROUND(
    ((total_sales - previous_month_sales) * 100.0)
    / previous_month_sales,
    2
) AS percentage_growth

FROM sales_trends;