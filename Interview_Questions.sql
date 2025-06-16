SELECT Extract(Day from post_date) AS DAY, count(post_text) As Total_Posts 
FROM facebook_posts
GROUP BY DAY
ORDER By DAY ASC;

select Customer_id, count(customer_id) AS customer_order, 
Avg (amount) AS order_amount
from postmates_orders
GROUP BY customer_id
ORDER BY order_amount ASC;