select p.lastName+'  '+firstName as FullName, a.city, a.state

from Person p
left join Address a on p.personId=a.personId


SELECT e.name
FROM Employee e,
self JOIN Employee m ON E.ID=m.managerID
where 
 
select * from Emails
SELECT email, COUNT(*) as takror_soni
FROM Emails
GROUP BY email
HAVING COUNT(*)>1;

delete a from Email2 a
join Email2 b on a.email = b.email and a.id > b.id

;with cte as (
Select *, ROW_NUMBER()over(partition by email order by id) rn from Email2
)delete from cte 
where rn > 1



select  b.ParentName
from girls g
right join boys b on b.ParentName=g.ParentName
where b.ParentName is null


SELECT  custid,
    sum(CASE WHEN freight < 50 then 0 else unitprice*qty*(1 - discount) end) TotalsalesOver50,
    min(freight) minWeight
FROM [TSQL2012].[Sales].[Orders] o
LEFT JOIN [TSQL2012].[Sales].[OrderDetails] od
on o.orderid = od.orderid
group by custid

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM 
    Cart1 c1
FULL OUTER JOIN 
    Cart2 c2
ON 
    c1.Item = c2.Item;


SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;


SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students_ s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id 
   AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, 
    s.student_name, 
    sub.subject_name
ORDER BY 
    s.student_id, 
    sub.subject_name;
