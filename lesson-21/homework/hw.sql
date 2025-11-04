select saledate , ROW_NUMBER() over (order by (saledate)) as  from ProductSales

 

SELECT 
    ProductName,
    SUM(Quantity) AS TotalQuantity,
    DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS ProductRank
FROM ProductSales
GROUP BY ProductName;

select CustomerID , max(saleAmount) max_sales from ProductSales group by CustomerID


select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lead(saleAmount)over  ( order by (saledate)) as NextSaleAmount
from ProductSales


select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lag(saleAmount)over  ( order by (saledate)) as oldingiSaleAmount
from ProductSales

;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lag(saleAmount)over  ( order by (saledate)) as oldingiSaleAmount
from ProductSales)
select saleID, ProductName, CustomerID,saledate ,saleAmount from cte 
where 
	   saleAmount>oldingiSaleAmount
	

;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lag(saleAmount)over  ( order by (saledate)) as oldingiSaleAmount
from ProductSales)
select saleID, ProductName, CustomerID,saledate ,saleAmount ,
(saleAmount-oldingiSaleAmount) as Farqi
from cte
	

;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lead(saleAmount)over  ( order by (saledate)) as NextSaleAmount
from ProductSales
) select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
cast(((NextSaleAmount-saleamount)/saleAmount*100)  as dec(10,2) )as farqi
from cte

;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lag(saleAmount)over  ( order by (saledate)) as oldingiSaleAmount
from ProductSales
) select *, 
        cast((saleAmount/oldingiSaleAmount) as dec(10,2)) as nisbati
from cte


;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleamount,
FIRST_VALUE(saleamount) over ( order by saledate) as firstsaleAmount
from ProductSales
) select *,
(saleamount-firstsaleAmount) as farqi
from cte


;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lag(saleAmount)over  (partition by productName  order by (saledate)) as oldingiSaleAmount
from ProductSales
) select * from cte
where 
saleAmount>oldingiSaleAmount
order by ProductName, SaleDate


;with cte as(
select saleID,
       productName,
	   CustomerID,
	   saledate,
	   saleAmount,
lag(saleAmount)over  (partition by productName  order by (saledate)) as oldingiSaleAmount
from ProductSales
) select *, 
(saleAmount+oldingiSaleAmount) as yopuvchi_balans
from cte

select * from ProductSales

select productName ,saleID,  max(saledate) from ProductSales
group by ProductName,saleID





SELECT 
    SaleID,
    ProductName,
    CustomerID,
    SaleDate,
    SaleAmount,
    AVG(SaleAmount) OVER (
        PARTITION BY ProductName 
        ORDER BY SaleDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_Last3
FROM ProductSales
ORDER BY ProductName, SaleDate;

SELECT 
    SaleID,
    ProductName,
    CustomerID,
    SaleDate,
    SaleAmount,
    AVG(SaleAmount) over (partition by productName) as AVG_Sale,
	SaleAmount-AVG(SaleAmount) over (partition by productName) as farqi
	from ProductSales
order by saledate, ProductName	




SELECT Salary, COUNT(*) AS NumEmployees
FROM Employees1
GROUP BY Salary
HAVING COUNT(*) > 1;


select *from(
select *,
ROW_NUMBER() over (partition by department order by salary desc ) as rn
from Employees1
) as rn
where rn<=2


select* from(
select *,
row_number() over(partition by department order by salary asc) as minSalary
from Employees1
) as minSalary
where minSalary=1


select *,
sum(salary) over(partition by department order by  hiredate ROWS UNBOUNDED PRECEDING ) as minSalary
from Employees1

select distinct Department,
sum(salary) over(partition by department ) sum_salary
from Employees1


select *,
cast((avg(salary) over(partition by department))as dec(10,2)) as avg_salary,
salary-cast((avg(salary) over(partition by department))as dec(10,2)) as farqi_ortacha_bn
from Employees1


select *,
cast((AVG(Salary) over(order by hiredate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)) as dec(10,2))
as movingAvg
from Employees1



select sum(salary) as total3hire from(
select top 3 salary 
from Employees1
order by HireDate desc
) as last3
