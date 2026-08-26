Select *from sales limit 10;

select count(*) from sales;

select sum(Sales) as sumsales,
sum(Profit) as sumprofit,
sum(Quantity) as sumqua
 from sales

select sum(Profit)/sum(Sales) as profit_margin
 from sales

select Category ,
sum(Sales) as sum_sales,
sum(Profit) as sum_profit,
sum(Profit)/sum(Sales) as profit_margin
from sales
Group by Category;

SELECT
    "Sub-Category",
    SUM(Profit) AS sum_profit,
    SUM(Sales) AS sum_sales,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
WHERE Category = 'Furniture'
GROUP BY "Sub-Category";

select "Product Name", "Sub-Category",
    sum(Sales) as sum_sales,
    SUM(Profit) AS sum_profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
where "Sub-Category" = 'Tables'
GROUP BY "Product Name"
order by sum(Profit) ASC;

select"Product Name",
 Quantity,
    sum(Sales) as sum_sales,
    SUM(Profit) AS sum_profit,
    avg(Sales),
    Profit,
    avg(Discount)
from sales
    where "Sub-Category" = 'Tables'
    Group by "Product Name"
    order by sum(Profit) ASC;
    
SELECT
    "Product Name",
    SUM(Quantity) AS total_quantity,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Sales) / SUM(Quantity) AS avg_sales_per_unit,
    SUM(Profit) / SUM(Quantity) AS profit_per_unit,
    AVG(Discount) AS avg_discount
FROM sales
WHERE "Sub-Category" = 'Tables'
GROUP BY "Product Name"
ORDER BY profit_per_unit ASC;

SELECT
    "Product Name",
    COUNT(*) AS orders,
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Quantity) AS quantity,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
WHERE "Sub-Category" = 'Tables'
  AND Discount = 0
GROUP BY "Product Name"
ORDER BY profit ASC;

SELECT
    "Product Name",
    Discount,
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
WHERE "Sub-Category" = 'Tables'
GROUP BY "Product Name", Discount
ORDER BY "Product Name", Discount;

SELECT
    "Product Name",
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
WHERE "Sub-Category" = 'Tables'
  AND Discount = 0
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY profit;

WITH product_discount AS (
    SELECT
        "Product Name",
        Discount,
        SUM(Sales) AS sales,
        SUM(Profit) AS profit,
        SUM(Profit) / SUM(Sales) AS profit_margin
    FROM sales
    WHERE "Sub-Category" = 'Tables'
    GROUP BY "Product Name", Discount
)

SELECT
    "Product Name",

    MAX(CASE
        WHEN profit_margin > 0
        THEN Discount
    END) AS "Max Profitable Discount",

    MIN(CASE
        WHEN profit_margin < 0
        THEN Discount
    END) AS "First Loss Discount",

    MAX(CASE
        WHEN profit_margin >= 0.05
        THEN Discount
    END) AS "Recommended Discount"
    

FROM product_discount
GROUP BY "Product Name"
ORDER BY "Product Name";

WITH product_discount AS (
    SELECT
        "Product Name",
        Discount,
        SUM(Sales) AS sales,
        SUM(Profit) AS profit,
        SUM(Profit) / SUM(Sales) AS profit_margin
    FROM sales
    WHERE "Sub-Category" = 'Tables'
    GROUP BY "Product Name", Discount
)

SELECT
    "Product Name",

    MAX(
        CASE
            WHEN profit_margin > 0
            THEN Discount
        END
    ) AS "Max Profitable Discount",

    MIN(
        CASE
            WHEN profit_margin < 0
            THEN Discount
        END
    ) AS "First Loss Discount",
    MAX(CASE
        WHEN profit_margin >= 0.1
        THEN Discount
    END) AS "Recommended Discount",

    MAX(
        CASE
            WHEN Discount = (
                SELECT MAX(pd2.Discount)
                FROM product_discount pd2
                WHERE pd2."Product Name" = pd."Product Name"
                  AND pd2.profit_margin > 0
            )
            THEN profit_margin
        END
    ) AS "Margin at Max Profitable Discount"

FROM product_discount pd
GROUP BY "Product Name"
ORDER BY "Product Name";

SELECT
    AVG("Recommended Discount") AS "Average Recommended Discount"
FROM (
    SELECT
        "Product Name",

        MAX(
            CASE
                WHEN profit_margin >= 0.1
                THEN Discount
            END
        ) AS "Recommended Discount"

    FROM (
        SELECT
            "Product Name",
            Discount,
            SUM(Sales) AS sales,
            SUM(Profit) AS profit,
            SUM(Profit) / SUM(Sales) AS profit_margin
        FROM sales
        WHERE "Sub-Category" = 'Tables'
        GROUP BY "Product Name", Discount
    ) AS product_discount

    GROUP BY "Product Name"
) AS product_policy;
    

with prof_discount as(
select
"Product Name",
Discount,
sum(Profit)/sum(Sales) as profit_margin
from sales
where "Sub-category"='Tables'
group by "Product Name",Discount
having sum(Profit)/sum(Sales) >=0.10
),
max_discount as(
select 
"Product Name",
MAX(Discount) as max_acceptable_discount
from prof_discount
group by "Product Name"
)

select 
max_discount."Product Name",
max_discount.max_acceptable_discount,
prof_discount.profit_margin
from max_discount
join prof_discount on max_discount."Product Name"= prof_discount."Product Name" and 
max_discount.max_acceptable_discount= prof_discount.Discount
order by profit_margin;

------------------------------------------------------
WITH prof_discount AS (
    SELECT
        "Product Name",
        Discount,
        SUM(Profit) / SUM(Sales) AS profit_margin
    FROM sales
    WHERE "Sub-Category" = 'Tables'
    GROUP BY "Product Name", Discount
    HAVING SUM(Profit) / SUM(Sales) >= 0.10
),

max_discount AS (
    SELECT
        "Product Name",
        MAX(Discount) AS max_acceptable_discount
    FROM prof_discount
    GROUP BY "Product Name"
)

SELECT
    max_discount."Product Name",
    max_discount.max_acceptable_discount,
    prof_discount.profit_margin
FROM max_discount
JOIN prof_discount
    ON max_discount."Product Name" = prof_discount."Product Name"
    AND max_discount.max_acceptable_discount = prof_discount.Discount
ORDER BY profit_margin;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT "Order ID") AS total_orders,
    COUNT(DISTINCT "Customer ID") AS total_customers,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS total_quantity,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales;

SELECT
    "Sub-Category",
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
GROUP BY "Sub-Category"
ORDER BY profit ASC;

SELECT
    Discount,
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
GROUP BY Discount
ORDER BY Discount;

SELECT
    Discount,
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
WHERE "Sub-Category" = 'Tables'
GROUP BY Discount
ORDER BY Discount;

SELECT
    COUNT(DISTINCT "Product Name") AS total_table_products
FROM sales
WHERE "Sub-Category" = 'Tables';

SELECT
    COUNT(*) AS products_with_10pct_margin_at_0
FROM (
    SELECT
        "Product Name"
    FROM sales
    WHERE "Sub-Category" = 'Tables'
      AND Discount = 0
    GROUP BY "Product Name"
    HAVING SUM(Profit) / SUM(Sales) >= 0.10
) AS products;

SELECT
    COUNT(*) AS products_with_10pct_margin_at_10
FROM (
    SELECT
        "Product Name"
    FROM sales
    WHERE "Sub-Category" = 'Tables'
      AND Discount = 0.10
    GROUP BY "Product Name"
    HAVING SUM(Profit) / SUM(Sales) >= 0.10
) AS products;

SELECT
    COUNT(*) AS products_with_10pct_margin_at_20
FROM (
    SELECT
        "Product Name"
    FROM sales
    WHERE "Sub-Category" = 'Tables'
      AND Discount = 0.20
    GROUP BY "Product Name"
    HAVING SUM(Profit) / SUM(Sales) >= 0.10
) AS products;

SELECT
    "Product Name",
    SUM(Sales) AS sales,
    SUM(Profit) AS profit,
    SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales
WHERE "Sub-Category" = 'Tables'
  AND Discount = 0.20
GROUP BY "Product Name"
HAVING SUM(Profit) / SUM(Sales) >= 0.10
ORDER BY profit_margin DESC;

WITH product_discount AS (
    SELECT
        "Product Name",
        Discount,
        SUM(Sales) AS sales,
        SUM(Profit) AS profit,
        SUM(Profit) / SUM(Sales) AS profit_margin
    FROM sales
    WHERE "Sub-Category" = 'Tables'
    GROUP BY "Product Name", Discount
),

max_acceptable AS (
    SELECT
        "Product Name",
        MAX(Discount) AS max_acceptable_discount
    FROM product_discount
    WHERE profit_margin >= 0.10
    GROUP BY "Product Name"
)

SELECT
    "Product Name",
    max_acceptable_discount
FROM max_acceptable
WHERE max_acceptable_discount = 0
ORDER BY "Product Name";