WITH Regions AS (
    SELECT DISTINCT Region FROM #RegionSales
),
Distributors AS (
    SELECT DISTINCT Distributor FROM #RegionSales
)
SELECT 
    r.Region,
    d.Distributor,
    ISNULL(rs.Sales, 0) AS Sales
FROM Regions r
CROSS JOIN Distributors d
LEFT JOIN #RegionSales rs
    ON rs.Region = r.Region AND rs.Distributor = d.Distributor
ORDER BY r.Region, d.Distributor;




select m.Name as managerName,
      m.ID as managerID,
	  count(e.id) as ishchilari_soni
	  from employee m
	join Employee e
	  on e.managerId=m.ID
	  group by m.Name, m.ID
	  having count(e.ID)>=5;

	


select product_name, SUM(unit) as total from (select p.product_name, o.unit, o.order_date
from Products p
join orders o on p.product_id=o.product_id 
 WHERE 
    order_date >= '2020-02-01'
    AND order_date < '2020-03-01') a
GROUP BY 
    product_name
HAVING 
    SUM(unit) >= 100;



SELECT 
    o.CustomerID,
    o.Vendor
FROM Orders o
GROUP BY o.CustomerID, o.Vendor
HAVING COUNT(*) = (
    SELECT TOP 1 COUNT(*) 
    FROM Orders i
    WHERE i.CustomerID = o.CustomerID
    GROUP BY i.Vendor
    ORDER BY COUNT(*) DESC
);


DECLARE @Check_Prime INT = 91;  -- Siz xohlagan sonni bu yerga yozasiz
DECLARE @i INT = 2;
DECLARE @isPrime BIT = 1;  -- Dastlab, tub deb faraz qilamiz

-- 1 va 0 tub emas
IF @Check_Prime <= 1
    SET @isPrime = 0;
ELSE
BEGIN
    WHILE @i <= SQRT(@Check_Prime)
    BEGIN
        IF @Check_Prime % @i = 0
        BEGIN
            SET @isPrime = 0;   -- Bo‘linuvchi topildi => tub emas
            BREAK;
        END
        SET @i = @i + 1;
    END
END

-- Natijani chiqarish
IF @isPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';



SELECT
    (SELECT COUNT(DISTINCT Locations) FROM Device) AS NumberOfLocations,
    (SELECT TOP 1 Locations 
     FROM Device 
     GROUP BY Locations 
     ORDER BY COUNT(*) DESC) AS MostActiveLocation,
    Device_id,
    COUNT(*) AS TotalSignalsPerDevice
FROM Device
GROUP BY Device_id;



select e.EmpID, e.EmpName, e.salary
from Employee e
where e.Salary>(select  avg(salary) from Employee where e.DeptID=DeptID)


WITH MatchCount AS (
    SELECT 
        t.TicketID,
        COUNT(*) AS MatchedNumbers
    FROM Tickets t
    INNER JOIN Numbers n 
        ON t.Number = n.Number
    GROUP BY t.TicketID
)

SELECT 
    SUM(
        CASE 
            WHEN MatchedNumbers = (SELECT COUNT(*) FROM Numbers) THEN 100
            WHEN MatchedNumbers > 0 THEN 10
            ELSE 0
        END
    ) AS TotalWinnings
FROM MatchCount;

WITH UserPlatform AS (
    SELECT
        Spend_date,
        User_id,
        SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS MobileAmount,
        SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS DesktopAmount
    FROM Spending
    GROUP BY Spend_date, User_id
)
SELECT
    Spend_date,
    SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount = 0 THEN 1 ELSE 0 END) AS MobileOnlyUsers,
    SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount = 0 THEN MobileAmount ELSE 0 END) AS MobileOnlyAmount,
    SUM(CASE WHEN DesktopAmount > 0 AND MobileAmount = 0 THEN 1 ELSE 0 END) AS DesktopOnlyUsers,
    SUM(CASE WHEN DesktopAmount > 0 AND MobileAmount = 0 THEN DesktopAmount ELSE 0 END) AS DesktopOnlyAmount,
    SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount > 0 THEN 1 ELSE 0 END) AS BothUsers,
    SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount > 0 THEN (MobileAmount + DesktopAmount) ELSE 0 END) AS BothAmount
FROM UserPlatform
GROUP BY Spend_date
ORDER BY Spend_date;

SELECT 
    g.Product,
    1 AS Quantity
FROM Grouped g
JOIN (
    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
) AS nums
ON nums.n <= g.Quantity
ORDER BY g.Product;
