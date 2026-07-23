--USE CASE 1.catergorizing data
/*Create report showing total sales for each of the following categories: 
High (sales over 50), Medium (sales 21-50), and Low (sales 20 or less) 
Sort the categories from highest sales to lowest */
select
category,
sum(sales) total_sales
from(

select 
orderID,
sales,
case
WHEN sales >50 then 'high'
when sales between 21 and 50 then 'medium'
else 'low'
--when sales <= 20 then 'low'
end  category
from sales.orders
)t

group by category
order by total_sales DESC
--USE CASE 2.MAPPING DATA
--Retrive employee details with gender displayed as full text
Select 
EmployeeID,
FirstName,
LastName,
Gender,
CASE 
WHEN Gender = 'M' then 'Male'
WHEN Gender = 'F' then 'Female'
else 'N/A'
END DIS_gen
from sales.Employees
--USE CASE 3. Removing null
--Find the average scores of customers and treat Nulls as 0
-- Additionally provide details such CustomerID and LastName
select 
customerID,
LastName,
AVG(case
when
score is null then 0
else score

end ) over()as avg_scr
from sales.Customers
--USE CASE 3. conditional aggregation
-- Count how many times each customer has made an order with sales greater than 30
SELECT
CustomerID,
SUM(CASE
WHEN Sales > 30 THEN 1
ELSE 0
END) TotalOrdersHighSales,
COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID