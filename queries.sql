CREATE VIEW low_stock_alerts AS
SELECT p.name, i.quantity, i.reorder_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.quantity <= i.reorder_level;

CREATE VIEW monthly_sales_revenue AS
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
    SUM(total_amount) AS total_revenue
FROM sales_orders
GROUP BY sales_month
ORDER BY sales_month DESC;

CREATE VIEW top_selling_products AS
SELECT p.name, SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_units_sold DESC
LIMIT 5;

CREATE VIEW products_never_sold AS
SELECT name
FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);