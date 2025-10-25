
select * ,left(Name ,charindex(',', name) -1) as Name,
substring(Name ,charindex(',', name)+1,len(name)) as surname
from TestMultipleColumns

select * from TestPercent
where strs like '%[%]%'

select id, vals,
left(vals, charindex('.' , vals)-1)as part1,
case when charindex('.', vals, charindex('.' , vals)+1)>0 then
 substring(vals, charindex('.' , vals)+1, 
     charindex('.', vals, charindex('.' , vals)+1)-charindex('.' , vals)-1)
else substring(vals,charindex('.',vals)+1, len(vals))
end as part2,
case when
CHARINDEX('.', Vals, CHARINDEX('.', Vals) + 1) > 0 THEN 
            RIGHT(Vals, LEN(Vals) - CHARINDEX('.', Vals, CHARINDEX('.', Vals) + 1))
        ELSE NULL
    END AS Part3
FROM Splitter;

SELECT *
FROM Splitter
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) >= 2;


select * ,
datalength(texts),
datalength(replace(texts, ' ', ' '))
from CountSpaces


SELECT 
    texts,
    LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS SpaceCount
FROM CountSpaces;

SELEct e.ID,
       e.Name,
	   e.salary,
	   m.id as manager_id,
	   m.name as managerName,
	   m.salary as managerSalary
from employee e
join employee m on e.ID=m.ManagerId
where e.Salary>m.Salary

select  
       EMPLOYEE_ID,
       FIRST_NAME,
	   LAST_NAME,
	   HIRE_DATE,
	   DATEDIFF(YEAR,HIRE_DATE, GETDATE()) AS ISHLAGANI
from Employees
where DATEDIFF(YEAR,HIRE_DATE, GETDATE())>10
and DATEDIFF(YEAR,HIRE_DATE, GETDATE())<15

select * from fruits
select w1.id
from weather w1
join weather w2 
on w2.RecordDate=dateadd(day,-1,w1.RecordDate)
where w1.Temperature>w2.Temperature

select player_id, min(event_date) as firstdate
from Activity
group by player_id

select * ,left(fruit_list,(charindex(',',fruit_list)-1)) as part1,
substring(fruit_list, charindex(',',fruit_list)+1, len(fruit_list)) as part2


from fruits
SELECT 
    CASE 3
        WHEN 1 THEN 'apple'
        WHEN 2 THEN 'banana'
        WHEN 3 THEN 'orange'
        WHEN 4 THEN 'grape'
    END AS ThirdFruit;

select FIRST_NAME, 
       LAST_NAME,
 
 DATEDIFF(YEAR,HIRE_DATE, GETDATE()) AS ishlagan_vaqti , 
 CASE
      WHEN  DATEDIFF(YEAR,HIRE_DATE, GETDATE())<1  then 'NewHire' 
	  WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE()) between 1 and 5 then 'Junior'
	  WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-level'
	  WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'SENIOR'
	  ELSE  'VETERAN'
	  END AS DARAJASI
from Employees


SELECT 
    LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'x') - 1) AS part1
FROM GetIntegers
WHERE Vals LIKE '[0-9]%';
select * from GetIntegers
select * from MultipleVals



