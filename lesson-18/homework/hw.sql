create table #MonthlySales 
( 
ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(18,2)
);

insert into #monthlySales (ProductID, TotalQuantity, TotalRevenue)
select p.productID,
       sum(s.quantity) as TotalQuantity,
	   sum(p.price*s.quantity) as TotalRevenue
from Products_ p
join sales s on p.ProductID=s.ProductID
where month(s.SaleDate)=month(getdate())
and year(s.SaleDate)=year(getdate())
group by p.ProductID




create view vw_ProductSalesSummary as
select p.productID,
       p.productName,
	   p.category,
	   p.price,
       sum(s.quantity) as TotalQuantity,
	   sum(p.price*s.quantity) as TotalRevenue
from Products_ p
join sales s on p.ProductID=s.ProductID
group by p.productID,
       p.productName,
	   p.category,
	   p.price

	drop function fn_GetTotalRevenueForProduct
create function fn_GetTotalRevenueForProduct(@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18,2);
select 
	@TotalRevenue=   sum(p.price*s.quantity)  
	from Products_ p
join sales s on p.ProductID=s.ProductID
where s.ProductID=@ProductID
RETURN ISNULL(@TotalRevenue, 0);
END;

drop function fn_GetSalesByCategory

create function fn_GetSalesByCategory(@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity,
        SUM(s.Quantity * p.Price) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);



Create function dbo.fn_IsPrime (@Start INT ,@End INT)
Returns @numbers table(number int)
as
begin
DECLARE @Current INT = @Start;

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Numbers VALUES (@Current);
        SET @Current = @Current + 1;
    END

    RETURN;
END;

CREATE FUNCTION fn_GetNumbersBetween
(
    @Start INT,
    @End INT
)
RETURNS @Numbers TABLE
(
    Number INT
)
AS
BEGIN
    DECLARE @Current INT = @Start;

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Numbers (Number)
        VALUES (@Current);

        SET @Current = @Current + 1;
    END

    RETURN;
END;

CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET @N - 1 ROWS FETCH NEXT 1 ROWS ONLY
    );
END;


SELECT TOP 1 id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id, accepter_id AS friend_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id, requester_id AS friend_id
    FROM RequestAccepted
) AS AllFriends
GROUP BY id
ORDER BY num DESC;


CREATE TABLE Customers1 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers1(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);


CREATE VIEW vw_CustomerOrderSummary AS
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name;


	SELECT 
    RowNumber,
    FIRST_VALUE(TestCase) OVER (
        PARTITION BY grp
        ORDER BY RowNumber
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS Workflow
FROM (
    SELECT 
        RowNumber,
        TestCase,
        SUM(CASE WHEN TestCase IS NOT NULL THEN 1 ELSE 0 END) 
            OVER (ORDER BY RowNumber ROWS UNBOUNDED PRECEDING) AS grp
    FROM Gaps
) AS t
ORDER BY RowNumber;


