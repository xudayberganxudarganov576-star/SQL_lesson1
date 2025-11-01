create table #EmployeeBonus(
            EmployeeID int, 
			FullName nvarchar(50),
			Department NVARCHAR(50)  ,
			Salary decimal(10,2) ,
		  BonusAmount decimal(10,2)
)

insert into #EmployeeBonus(EmployeeID,FullName, Department,  BonusAmount )
select e.EmployeeID, e.firstName+'  '+lastName as FullName, e.department,
e.Salary * d.BonusPercentage / 100 as BonusAmount
from Employees e
join DepartmentBonus d on e.Department=d.Department

select * from #EmployeeBonus

CREATE PROCEDURE usp_UpdateSalaryByDepartment
    @DeptName NVARCHAR(50),
    @IncreasePercent DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Employees
    SET Salary = Salary + (Salary * @IncreasePercent / 100)
    WHERE Department = @DeptName;

    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary AS UpdatedSalary
    FROM Employees
    WHERE Department = @DeptName;
END;
GO


CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);


MERGE INTO Products_Current AS target
USING Products_New AS source
ON target.ProductID = source.ProductID


WHEN MATCHED THEN
    UPDATE SET 
        target.ProductName = source.ProductName,
        target.Price = source.Price


WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (source.ProductID, source.ProductName, source.Price)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

SELECT * FROM Products_Current;


SELECT 
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree
ORDER BY id;


SELECT 
    s.user_id,
    COALESCE(ROUND(
        SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 /
        COUNT(c.action), 2
    ), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id
ORDER BY s.user_id;






select * from Employees
select e.name, e.salary
from Employees e
where e.Salary=(select min(salary) from Employees)


create or alter procedure GetProductSalesSummary
@productID int
as 
begin 
set nocount on
select p.productID,
p.productName,
sum(s.quantity) as total_quantity,
sum(s.quantity*p.price) as total_amount,
min(s.saleDate) birinchi_kun,
max(s.saleDate) oxirgi_kun
from products1 p
join sales1 s on s.productID=p.productID
where @productID=p.productID
group by p.productID ,
p.productName
end
go   

exec GetProductSalesSummary
@productID=1

