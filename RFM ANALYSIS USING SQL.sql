---exploratory analysis---
select * from [dbo].[Online Retail 2]

-- Add the 'Revenue' column to the table
ALTER TABLE [dbo].[Online Retail 2]
ADD Revenue DECIMAL(18, 2)  

-- Update the 'Revenue' column with calculated values
UPDATE [dbo].[Online Retail 2]
SET Revenue = Quantity * UnitPrice


---What was the country that generated the most revenue?---
SELECT Country, SUM(Revenue) AS TotalRevenue
FROM [dbo].[Online Retail 2]
GROUP BY Country
ORDER BY TotalRevenue DESC;

---Extracting month and date---
SELECT 
    MONTH(InvoiceDate) AS ExtractedMonth,
    YEAR(InvoiceDate) AS ExtractedYear
FROM [dbo].[Online Retail 2];

---Adding Extracted month and Date to the table

ALTER TABLE [dbo].[Online Retail 2]
ADD ExtractedMonth INT, 
    ExtractedYear INT;

UPDATE [dbo].[Online Retail 2]
SET ExtractedMonth = MONTH(InvoiceDate),
    ExtractedYear = YEAR(InvoiceDate);

---Which year generated the most Revenue?

SELECT ExtractedYear, SUM(Revenue) AS TotalRev
FROM [dbo].[Online Retail 2]
GROUP BY ExtractedYear 
ORDER BY TotalRev DESC;

---Which country generated the most Revenue in 2010?
SELECT Country, SUM(Revenue) AS TotalRev
FROM [dbo].[Online Retail 2]
WHERE ExtractedYear= 2010
GROUP BY Country 
ORDER BY TotalRev DESC;

---Which country generated the most Revenue in 2011?
SELECT Country, SUM(Revenue) AS TotalRev
FROM [dbo].[Online Retail 2]
WHERE ExtractedYear= 2011
GROUP BY Country 
ORDER BY TotalRev DESC;

---What was the best month for sales in 2010?
SELECT ExtractedMonth, SUM(Revenue) AS TotalRev
FROM [dbo].[Online Retail 2]
WHERE ExtractedYear= 2010
GROUP BY ExtractedMonth 
ORDER BY TotalRev DESC;

---What was the best month for sales in 2011?
SELECT ExtractedMonth, SUM(Revenue) AS TotalRev
FROM [dbo].[Online Retail 2]
WHERE ExtractedYear= 2011
GROUP BY ExtractedMonth 
ORDER BY TotalRev DESC;

---Which products were sold together?---

select * from [dbo].[Online Retail 2]

DROP TABLE IF EXISTS #segment
;with cte as
(
	select CustomerID, 
		   sum(Revenue) MonetaryValue,
		   avg(Revenue) AvgMonetaryValue,
		   count(InvoiceNo) Frequency,
		   max(InvoiceDate) last_order_date,
		   (select max(InvoiceDate) from [dbo].[Online Retail 2]) max_date,
		   DATEDIFF(DD,max(InvoiceDate),(select max(InvoiceDate) from [dbo].[Online Retail 2])) Recency
		   from [dbo].[Online Retail 2]
		   group by CustomerID
),
rfm_anal as
(
	SELECT c.*,
			NTILE(4) OVER (ORDER BY Recency DESC) AS rfm_recency,
			NTILE(4) OVER (ORDER BY Frequency) AS rfm_frequency,
			NTILE(4) OVER (ORDER BY MonetaryValue) AS rfm_monetaryvalue
	FROM cte c
  
)
select r.*,rfm_recency+rfm_frequency+rfm_monetaryvalue as rfm_score,
cast(rfm_recency as varchar)+cast(rfm_frequency as varchar)+cast(rfm_monetaryvalue as varchar) as rfm_string
into #segment
from rfm_anal as r

select CustomerID, rfm_recency,rfm_frequency,rfm_monetaryvalue,
case 
		when rfm_string in (111, 112 ,113,131, 121, 122, 123,124,131, 132, 211, 212,213,214, 114, 141,142) then 'lost_customers'  --lost customers
		when rfm_string in (133, 134, 143,242,242, 243,244,241, 334, 341,342,343, 344, 144) then 'slipping away, cannot lose' -- (Big spenders who haven’t purchased lately) slipping away
		when rfm_string in (311,312,313,314, 411,412,413,414,331) then 'new customers'
		when rfm_string in (221,222, 223,224,231,232, 233,234,321, 322) then 'potential churners'
		when rfm_string in (323,324, 333,321, 421,422,423,424,332,431, 432) then 'active' --(Customers who buy often & recently, but at low price points)
		when rfm_string in (433, 434, 443,442,444) then 'loyal'
	end rfm_segment 
from #segment


select

select distinct InvoiceNo, stuff(

(select ','+ StockCode
from [dbo].[Online Retail 2] d
where InvoiceNo in (
select InvoiceNo
from (
select InvoiceNo, count(*) cc
from [dbo].[Online Retail 2]
group by InvoiceNO 
) n
where cc=2
)
and d.InvoiceNo = e.InvoiceNo
for xml path(''))
,1,1,'') ProdCodes

from [dbo].[Online Retail 2] e
order by 2 desc


select *
from [dbo].[Online Retail 2]