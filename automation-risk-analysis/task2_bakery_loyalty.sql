SELECT u.city, COUNT(o.order_id) AS delivered_orders_count
FROM users u 
JOIN orders o ON o.user_id = u.user_id
WHERE u.loyalty_level IN ('Silver', 'Gold', 'Platinum')
  AND o.delivery_status = 'Delivered'
GROUP BY u.city
HAVING COUNT(o.order_id) > 2;
