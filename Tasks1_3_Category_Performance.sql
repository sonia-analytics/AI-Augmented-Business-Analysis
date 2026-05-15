/*
	Task 1.3: Category Perforamnce
    Goal: Join order items with product categories to see high-level order sales.
	Requirement: Mutli-table JOIN, Aggregation, and Filtering.
*/

select 
	p.category,
	COUNT(distinct oi.order_id) as unique_orders,
	SUM(oi.quantity) as total_items_sold,
	ROUND(SUM(oi.item_total), 2) as total_revenue
from order_items oi
join products p on oi.product_id = p.product_id 
join orders o on oi.order_id = o.order_id 
where o.order_status = 'completed'
group by p.category 
order by total_revenue desc;
