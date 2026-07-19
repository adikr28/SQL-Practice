select
orderID,
creationTime,

getdate() yesterday, --to get actual/current date
--part extraction
day(creationtime) year,
month(creationtime) month,
year(creationtime) year,
--Datepart examples
datepart(week,creationtime) week,
datepart(quarter,creationtime) quarter,
datepart(hour,creationtime) hour,
datepart(minute,creationtime) minute,
datepart(second,creationtime) second,
--Datename Examples
datename(month,creationtime) month_name,
datename(weekday,creationtime) week_name,
datetrunc(minute,creationtime) minutes_trunc,
datetrunc(day,CreationTime) dat_truuc,
datetrunc(year,CreationTime)year_trunc,
EOMONTH(creationtime) ENDDATE_month,
cast(datetrunc(month,creationtime)as date) startofmonth

From Sales.orders




-- use of  datename condition
select 
Datename(month,creationtime) creation,
count(*) count
from sales.orders
group by Datename(month,creationtime)
 
 -- why do we use?
 --ques:-how many orders were placed in year
 select
 year(creationtime),
 count(*)
 from sales.Orders
 group by year(creationtime)
--ques:-how many orders were placed in name

 select
 datename(month,creationtime),
 count(*)
 from sales.Orders
 group by datename(month,CreationTime)

 --ques: show the order deation only oreder in feburary
 select *
 from sales.orders
 where month(orderdate)=2