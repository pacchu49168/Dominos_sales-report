select * from dbo.dominos_sales
--Total Revenue

select sum(quantity*unit_price) as Total_price from dbo.dominos_sales
--817860.049999992

--Average Order Value
select 
(select sum(quantity*unit_price) as Total_price from dbo.dominos_sales)/ count(distinct order_id) as Average_Order_Value
from dbo.dominos_sales
--38.3072622950816

--Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold from dbo.dominos_sales
--49574

--Total Orders
select count(distinct order_id) as Total_orders from dbo.dominos_sales
--21350

--Average Pizzas Per Order
select cast(cast(sum(quantity)as decimal(10,2))/
cast(count(distinct order_id)as decimal(10,2))as decimal(10,2)) from dbo.
--2.32

--chart requirements
--Daily trends
select datename(DW,order_date) as order_Day,count(distinct order_id)as Total_Orders from dbo.dominos_sales
group by  datename(DW,order_date)


--Monthly trends
select datename(MONTH,order_date) as order_month,count(distinct order_id)as Total_Orders from dbo.dominos_sales
group by  datename(MONTH,order_date)

--% of sales by pizza category
select pizza_category ,cast(sum(total_price) as decimal(10,2)) as Total_Revenue, cast(sum(total_price)*100/
(select sum(total_price) from dbo.dominos_sales) as decimal(10,2)) as percentage_of_sales
from dbo.dominos_sales
group by pizza_category

----% of sales by pizza sizes
select pizza_size ,cast(sum(total_price) as decimal(10,2)) as Total_Revenue, cast(sum(total_price)*100/
(select sum(total_price) from dbo.dominos_sales) as decimal(10,2)) as percentage_of_sales
from dbo.dominos_sales
group by pizza_size

---total pizza sold by pizza category
select pizza_category , sum(quantity) as Pizza_sold
from dbo.dominos_sales
group by pizza_category
order by sum(quantity) desc

--top 5 pizzas on the basis of revenue ,quantity sold and Orders
select TOP 5 pizza_name ,sum(total_price) as Total_Revenue
from dbo.dominos_sales
group by pizza_name
order by sum(total_price) desc

select TOP 5 pizza_name ,sum(quantity) as Quantity_sold
from dbo.dominos_sales
group by pizza_name
order by sum(quantity) desc

select TOP 5 pizza_name ,count(distinct order_id) as Total_orders
from dbo.dominos_sales
group by pizza_name
order by count(distinct order_id)desc

---Bottom 5 pizzas on the basis of  revenue ,quantity sold and Orders
select TOP 5 pizza_name ,sum(total_price) as Total_Revenue
from dbo.dominos_sales
group by pizza_name
order by sum(total_price) 

select TOP 5 pizza_name ,sum(quantity) as Quantity_sold
from dbo.dominos_sales
group by pizza_name
order by sum(quantity) 

select TOP 5 pizza_name ,count(distinct order_id) as Total_orders
from dbo.dominos_sales
group by pizza_name
order by count(distinct order_id)