/*
	Tasks 1.1: Revenue Summary & Monthly Trends
	Goal: Calculate Totals Revenue and orders per month
	Filtering: Includes only 'completed' orders
*/

select 
	substr(order_date, 1, 7) as order_month,
	COUNT(order_id) as total_orders,
	ROUND(SUM(total_amount), 2) as monthly_revenue,
	ROUND(SUM(total_amount), 2) as avg_order_value
from orders
where order_status = 'completed'
group by 1
order by 1;
