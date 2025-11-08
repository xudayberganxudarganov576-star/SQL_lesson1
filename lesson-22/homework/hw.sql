
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')




select distinct customer_name ,
sum(total_amount) over (order by customer_id) 
from sales_data

select product_category ,
sum(quantity_sold) as total_quantity
from sales_data
group by product_category


SELECT 
    Product_Category,
    MAX(Total_Amount) AS Max_Total_Amount
FROM sales_data
GROUP BY Product_Category;


SELECT 
    Product_Category,
    min(unit_price) AS min_unit_price
FROM sales_data
GROUP BY Product_Category;

select order_date ,
cast(avg(total_amount) over(order by order_date rows between 1 preceding and 1 following) as dec(10,2))
as days_moving
from sales_data



select region ,
sum(total_amount) as total_sum
from sales_data
group by region

select  customer_name ,
sum(total_amount) as total_sum, 
rank() over (order by sum(total_amount) desc) as rank_totalsum
from sales_data
group by customer_name


select sale_id, customer_id , Customer_name, order_date, total_amount,
cast(total_amount-LAG(total_amount) OVER(order by sale_id) as dec(10,2)) as farqi
from sales_data
 
select * from(
select  product_name, unit_price,product_category,
rank() over(partition by product_category order by unit_price desc  ) as price_rank
from sales_data
) ranked 
where price_rank<=3

SELECT 
    region,
    order_date,
    SUM(total_Amount) OVER (
        PARTITION BY region
        ORDER BY Order_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_Sales
FROM sales_data

CREATE TABLE twocolmn (
    Value SMALLINT
);
INSERT INTO twocolmn VALUES (1), (2), (3), (4), (5);

SELECT
   
    value,
    SUM(value) OVER ( ORDER BY value) AS cumulative_revenue
FROM twocolmn;

select customer_id
from sales_data
group by customer_id
having count(distinct product_category)>1

SELECT customer_id, region, total_amount
FROM sales_data
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM sales_data AS s2
    WHERE s2.region = sales_data.region
);


SELECT 
    customer_id,
    region,
    total_amount,
    RANK() OVER (PARTITION BY region ORDER BY total_amount DESC) AS customer_rank
FROM sales_data;



SELECT 
    customer_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM sales_data;


WITH monthly_sales AS (
    SELECT 
        CAST(YEAR(order_date) AS VARCHAR(4)) + '-' + 
        RIGHT('0' + CAST(MONTH(order_date) AS VARCHAR(2)), 2) AS month,
        SUM(total_amount) AS total_sales
    FROM sales_data
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT 
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS prev_month_sales,
    ROUND(
        CASE 
            WHEN LAG(total_sales) OVER (ORDER BY month) = 0 THEN NULL
            ELSE ((total_sales - LAG(total_sales) OVER (ORDER BY month)) 
                   / LAG(total_sales) OVER (ORDER BY month)) * 100
        END, 2
    ) AS growth_rate
FROM monthly_sales;


WITH sales_with_prev AS (
    SELECT 
        customer_id,
        order_date,
        total_amount,
        LAG(total_amount) OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS prev_order_amount
    FROM sales_data
)
SELECT *
FROM sales_with_prev
WHERE total_amount > prev_order_amount;






CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);


select * from OneColumn

with cte as(
select *,
lag(value) over(order by value) as lag_value
from OneColumn
) select value, (lag_value+value) as result from cte



CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);

select * from MyData

select product_name, unit_price
from sales_data	
where unit_price>(select avg(unit_price) from sales_data)


SELECT
    Id,
    Grp,
    Val1,
    Val2,
    CASE WHEN ROW_NUMBER() OVER(PARTITION BY Grp ORDER BY Id) = 1
         THEN SUM(Val1 + Val2) OVER(PARTITION BY Grp)
         ELSE NULL
    END AS Tot
FROM MyData
ORDER BY Id;


CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

select * from TheSumPuzzle







CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 

select * from Seats


;with cte as(
select 1 as n
union all
select n+1 from cte
where n<54
),cte2 as( select *, n-ROW_NUMBER() over(partition by seatnumber order by n) gr from cte 
left join Seats on cte.n=Seats.SeatNumber
)select distinct 
 max(n)over(partition by gr) as gapstart,
  min(n)over(partition by gr) as gapend
from cte2 
where SeatNumber is null













