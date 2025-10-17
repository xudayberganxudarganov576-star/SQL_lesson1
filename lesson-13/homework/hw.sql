
select
concat(EMPLOYEE_ID, '-', FIRST_NAME, ' ' ,LAST_NAME)
from employees

UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999');

SELECT FIRST_NAME AS EMPLOYEENAME,
       len(FIRST_NAME ) as LengthName
FROM Employees
where FIRST_NAME  like 'A%'
    OR  FIRST_NAME  like 'J%'
	OR  FIRST_NAME  like 'M%'
order by FIRST_NAME 

select MANAGER_ID, 
SUM(salary) AS TOTALSALARY
FROM EMPLOYEES
GROUP BY MANAGER_ID

SELECT 
    year1,
    GREATEST(MAX(Max1), MAX(Max2), MAX(Max3)) AS HighestValue
FROM TestMax
GROUP BY year1;

Select * from cinema
where   Id%2=1
and description not like '%boring%'

select * from SingleOrder
order by case when id=0 then 1 else 0 end, id

select
coalesce(ssn, passportid, itin)
from person
select * from Students
 
 Select *, 
LEFT(Fullname, CHARINDEX(' ', FullName)-1) as FirstName,

SUBSTRING(Fullname, 
          CHARINDEX(' ', FullName)+1, 
          CHARINDEX(' ', Fullname, CHARINDEX(' ', FullName)+2 ) - CHARINDEX(' ', FullName)-1  ) as MiddleName,

SUBSTRING(FullName, 
        CHARINDEX(' ', Fullname, CHARINDEX(' ', FullName)+2 ), 
        LEN(Fullname)- CHARINDEX(' ', Fullname, CHARINDEX(' ', FullName)+2 )) as LastName
from Students

SELECT *
FROM Orders
WHERE DeliveryState = 'TX'
  AND CustomerID IN (
      SELECT DISTINCT CustomerID
      FROM Orders
      WHERE DeliveryState = 'Ca'
  );

 
 SELECT 
    SequenceNumber,
    STRING_AGG(, ', ') AS CombinedValues
FROM DMLTable
GROUP BY String;

 SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    ROUND(
        100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HireDate, GETDATE()) > 3 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS PercentageOver3Years
FROM Employees
GROUP BY Department;


select concat(sequenceNumber, ' ', string) from DMLTable


 SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM Employees
WHERE (
    LEN(CONCAT(FIRST_NAME, LAST_NAME)) 
    - LEN(REPLACE(CONCAT(FIRST_NAME, LAST_NAME), 'a', ''))
) >= 3;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM Employees
WHERE CONCAT(FIRST_NAME, LAST_NAME) LIKE '%A%A%A%'

SELECT JOB_ID,
COUNT(*) AS TotolEmployees,
 ROUND(
        100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) / COUNT(*),
        2
       ) AS PercentageOver3Years
FROM Employees
GROUP BY JOB_ID

select * from PlayerScores

SELECT StudentID, grade,
SUM(grade) over (order by studentid) as Cumulativegrade
from Students

select birthday,
count(*) as studentCount
from Student
group by  birthday
HAVING count(*)>1

SELECT 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END AS Player1,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END;

DECLARE @str VARCHAR(100) = 'tf56sd#%OqH';

;WITH Split AS (
    SELECT 
        1 AS pos,
        SUBSTRING(@str, 1, 1) AS ch
    UNION ALL
    SELECT 
        pos + 1,
        SUBSTRING(@str, pos + 1, 1)
    FROM Split
    WHERE pos < LEN(@str)
)
SELECT
    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[A-Z]' THEN ch END, ', ') AS Uppercase,
    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[a-z]' THEN ch END, ', ') AS Lowercase,
    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[0-9]' THEN ch END, ', ') AS Numbers,
    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS NOT LIKE '[A-Za-z0-9]' THEN ch END, ', ') AS Others
FROM Split
OPTION (MAXRECURSION 0);
