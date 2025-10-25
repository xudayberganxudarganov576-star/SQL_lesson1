;with numbers as(select 1 as number 
                union all
				select number+1 
				from numbers
				where number<1000)
				select number from numbers


select  EmpName ,sum(SalesAmount) as TotalAmount from(
select e.FirstName+'  '+LastName as EmpName, s.SalesAmount
from Employees e
join Sales s on e.EmployeeID=s.EmployeeID
) a group by EmpName

;with cte as (
select  FirstName+'  '+LastName as EmpName , salary 
from Employees) 
select EmpName, AVG(salary) as AVGSalary from cte group by EmpName


select ProductName, max(SalesAmount) MAXsotu from(
select  p.productName, s.SalesAmount
from Products p
join Sales s on p.ProductID=s.ProductID
) a group by ProductName

;with numbers as(select 1 as number 
                union all
				select number*2 
				from numbers
				where number<1000000)
				select number from numbers




;with cte as(
select e.EmployeeID, e.FirstName+'  '+LastName as EmpName, s.SalesAmount
from Employees e
join Sales s on e.EmployeeID=s.EmployeeID
) select EmpName, count(EmployeeID) as countsale from cte group by EmpName having COUNT(EmployeeID)>5



;with cte as(
select  p.productName, s.SalesAmount
from Products p
join Sales s on p.ProductID=s.ProductID
)select  productName , sum(salesAmount) as totalAmount from cte group by productName having sum(salesAmount)>500

;with avgsalary as(
select avg(salary) avgsalary from Employees
)
select e.FirstName+'  '+LastName as EmpName, e.employeeid ,e.salary
from employees e
cross join avgsalary a 
where e.salary>avgsalary


select * from Example
select * from Sales


select top 5 EmpName, count(EmployeeID) as countsale from(
select e.EmployeeID, e.FirstName+'  '+LastName as EmpName, s.SalesAmount
from Employees e
join Sales s on e.EmployeeID=s.EmployeeID
) a group by EmpName


select categoryID, sum(salesAmount) as sumSales from
(
select p.CategoryID, p.ProductName, s.SalesAmount
from Sales s
join products p on p.productID=s.productID
) a group by categoryID

WITH SplitCTE AS (
    SELECT 
        ID,
        CAST(SUBSTRING(string, 1, 1) AS VARCHAR(100)) AS CharPart,
        SUBSTRING(string, 2, LEN(string)) AS Remaining
    FROM Example

    UNION ALL

    SELECT
        ID,
        CAST(SUBSTRING(Remaining, 1, 1) AS VARCHAR(100)),
        SUBSTRING(Remaining, 2, LEN(Remaining))
    FROM SplitCTE
    WHERE LEN(Remaining) > 0
)
SELECT ID, CharPart
FROM SplitCTE;

