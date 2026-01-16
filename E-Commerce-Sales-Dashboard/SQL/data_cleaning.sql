-- Step 1: Remove cancelled orders
SELECT *
FROM sales_data
WHERE order_status <> 'Cancelled';

-- Step 2: Remove records with missing customer ID
SELECT *
FROM sales_data
WHERE customer_id IS NOT NULL;

-- Step 3: Calculate total revenue
SELECT
    order_id,
    quantity * unit_price AS revenue
FROM sales_data;

-- Step 4: Monthly revenue analysis
SELECT
    FORMAT(order_date, 'yyyy-MM') AS month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales_data
WHERE order_status <> 'Cancelled'
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;
