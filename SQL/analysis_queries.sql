-- 1 Revenue by branch 
SELECT Branch, SUM(Sales) as total_revenue 
FROM sales
GROUP BY Branch
ORDER BY total_revenue DESC;

--2 Monthly sales trend
SELECT strftime('%Y-%m',Date) as month,SUM(Sales) as total_revenue
FROM sales
GROUP BY month
ORDER BY total_revenue DESC;

--3 Top Product Lines
SELECT "Product line",SUM(Sales) as total_revenue
FROM sales
GROUP BY "Product line"
ORDER BY total_revenue DESC;

--4 Average ratings per product line
SELECT "Product line",AVG(Rating) as avg_rating
FROM sales
GROUP BY "Product line"
ORDER BY avg_rating DESC;

--5 Revenue by customer type
SELECT "Customer type",SUM(Sales) as total_revenue
FROM sales
GROUP BY "Customer type"
ORDER BY total_revenue DESC;

--6 Cities by sales
SELECT City,SUM(Sales) as total_revenue
FROM sales
GROUP BY City
ORDER BY total_revenue DESC;

--7 Mostly used payment methods
SELECT Payment,COUNT(*) as payment_count
FROM sales
GROUP BY Payment
ORDER BY payment_count DESC;

--8 Highest value transactions
SELECT* FROM sales
WHERE Sales>(SELECT AVG(Sales) FROM sales
)
ORDER BY Sales DESC;

--9 Average basket size per branch
SELECT Branch,AVG(Sales) as avg_basket_size
FROM sales
GROUP BY Branch;

--10 Day with the highest sales
SELECT CASE strftime('%w',Date)
WHEN '0' THEN 'Sunday'
WHEN '1' THEN 'Monday'
WHEN '2' THEN 'Tuesday'
WHEN '3' THEN 'Wednesday'
WHEN '4' THEN 'Thursday'
WHEN '5' THEN 'Friday'
WHEN '6' THEN 'Saturday'
END AS day_of_week,
SUM(Sales) as total_revenue
FROM sales
GROUP BY day_of_week
ORDER BY total_revenue DESC;




