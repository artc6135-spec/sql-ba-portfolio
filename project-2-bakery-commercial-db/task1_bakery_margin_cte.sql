WITH 
New_orders AS (
    SELECT c.category_id, SUM(ph.new_price * oi.quantity * (1 - oi.discount/100) - p.cost_price * oi.quantity) AS profit
    FROM categories c
    JOIN products p ON c.category_id=p.category_id
    JOIN price_history ph ON ph.product_id = p.product_id
    JOIN order_items oi ON oi.product_id = ph.product_id
    JOIN orders o ON o.order_id = oi.order_id
        WHERE STR_TO_DATE(o.order_date, '%Y-%m-%d %H:%i:%s') > STR_TO_DATE(ph.change_date, '%Y-%m-%d %H:%i:%s') AND o.delivery_status != 'Cancelled' AND 		p.product_id IN (
        SELECT ph.product_id
        FROM products p
        JOIN price_history ph ON p.product_id = ph.product_id
    )
GROUP BY c.category_id
), 
Old_orders AS (
SELECT c.category_id, SUM(ph.old_price * oi.quantity * (1 - oi.discount/100) - p.cost_price * oi.quantity) AS profit
    FROM categories c
    JOIN products p ON c.category_id=p.category_id
    JOIN price_history ph ON ph.product_id = p.product_id
    JOIN order_items oi ON oi.product_id = ph.product_id
    JOIN orders o ON o.order_id = oi.order_id
        WHERE STR_TO_DATE(o.order_date,'%Y-%m-%d %H:%i:%s') < STR_TO_DATE(ph.change_date, '%Y-%m-%d %H:%i:%s') AND  o.delivery_status != 'Cancelled' AND p.product_id IN (
        SELECT ph.product_id
        FROM products p
        JOIN price_history ph ON p.product_id = ph.product_id
    )
GROUP BY c.category_id
),
Orders_without_changes AS (
SELECT c.category_id, SUM(p.retail_price * oi.quantity * (1 - oi.discount/100) - p.cost_price * oi.quantity) AS profit
FROM categories c
JOIN products p ON c.category_id=p.category_id
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.delivery_status != 'Cancelled' AND p.product_id NOT IN 
(
    SELECT ph.product_id
	FROM products p
	JOIN price_history ph ON p.product_id = ph.product_id
)
GROUP BY c.category_id
)

SELECT c.category_id, c.category_name, (COALESCE(no1.profit,0) + COALESCE(no2.profit,0) + COALESCE(ow.profit,0)) AS profit
FROM categories c
LEFT JOIN New_orders no1 ON no1.category_id = c.category_id
LEFT JOIN Old_orders no2 ON no2.category_id = c.category_id
LEFT JOIN Orders_without_changes ow ON ow.category_id = c.category_id
