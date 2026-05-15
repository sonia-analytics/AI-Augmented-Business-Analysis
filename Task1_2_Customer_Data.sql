/* TASK 1.2: Customer-Level Performance
   Goal: Join user details with order history to find top spenders.
   Requirement: Uses JOIN, Aggregations (COUNT, SUM), and Filtering.
*/

SELECT 
    u.user_id,
    u.name,
    u.city,
    u.gender,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.order_status = 'completed'
GROUP BY u.user_id, u.name, u.city, u.gender
ORDER BY total_spent DESC;