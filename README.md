
# RFM Analysis for Customer Segmentation and Targeted Marketing Using SQL and Tableau

Dataset Description and Source
"This is a transnational data set which contains all the transactions occurring between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.The company mainly sells unique all-occasion gifts. Many customers of the company are wholesalers."

It contains 8 attributes which are fully described below:

InvoiceNo: Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'c', it indicates a cancellation.
StockCode: Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product.
Description: Product (item) name. Nominal.
Quantity: The quantities of each product (item) per transaction. Numeric.
InvoiceDate: Invice Date and time. Numeric, the day and time when each transaction was generated.
UnitPrice: Unit price. Numeric, Product price per unit in sterling.
CustomerID: Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer.
Country: Country name. Nominal, the name of the country where each customer resides.


## PROJECT OVERVIEW
This project aims to perform RFM analysis on a customer dataset using SQL and Tableau to identify and segment customers based on their recency, frequency, monetary value, and create a comprehensive dashboard using Tableau for visualization. The project involves data exploration, segmentation, and the development of actionable insights to enhance business strategy and decision-making in the online retail sector.

Project Scope
The project utilized an online retail transnational data, focusing on metrics such as InvoiceNo, Stockcode, Description, Quantity, InvoiceData,UnitPrice, CustomerID and Country. The data exploration phase involved SQL queries to extract, clean, and transform the dataset for analysis. Subsequently, a Tableau dashboard was developed to visualize key insights and trends.

Tools and Technologies:
The project utilized the following tools and technologies:

SQL (Structured Query Language): The primary language used for data manipulation, exploration, and analysis.
SQL Server Management Studio (SSMS): For database creation, data parsing, and initial data exploration.
Tableau: For creating a variety of visualizations and interactive dashboards based on SQL query findings.
Excel: While not directly used in the project, the dataset obtained from 'UCI repository' was in Excel format, serving as the initial file type for data exploration.
This combination of tools facilitated a comprehensive approach to the analysis, from database creation and exploration using SQL to visual representation and interactive dashboards in Tableau. The dataset's initial format in Excel underscored the importance of diverse tools in handling and extracting insights from real-world datasets.

RFM analysis segments customers based on three key metrics: recency (last purchase date), frequency (purchase frequency), and monetary value (total spending). This information allows businesses to identify and target specific customer groups with tailored marketing strategies.

Customer Segments:

→ Loyal Customers:→ Recent, frequent purchasers with high spending.
→ Active Customers:→ Frequent purchasers with moderate spending.
→ Potential Churners :→ Inactive customers with a history of purchases.
→ New Customers:→ Recent first-time purchasers.
→ Lost Customers:→ Big spenders who haven't purchased lately.
→ Slipping Away:→ Customers who buy often and recently but at low price points.
## TABLEAU DASHBOARD
Access the live dashboard on Tableau Public: 'ONLINE RETAIL DASHBOARD'

The Tableau dashboard was designed to visualize key insights and trends related to Online Retail Data including, InvoiceNo, StockCode, Description, Quantity,InvoiceDate,UnitPrice, CustomerID and their distribution across countries. The dashboard includes KPIs and area graphs to provide a comprehensive overview of the Online Retail Dataset.

Dashboard Components:
-Key Performance Indicators (KPIs):
Total Revenue Per Year
Average Order Order
Total Number of Orders
-Bar Chart:
Sales by Top 10 countries
Sales by Top 10 Stocks
-Area Graphs:
Revenue Trend across different years
## PROJECT CONCLUSION
The Online Retail Data Exploration and Dashboard project has delivered crucial insights into the e-commerce landscape through detailed data analysis and visualization. Utilizing SQL queries and Tableau's robust visualization tools, the project has transformed intricate online retail datasets into actionable insights that are easily understandable for a wide audience. The interactive Tableau dashboard acts as a centralized hub for monitoring key metrics and enabling stakeholders to make informed decisions in the online retail sector. Looking ahead, these insights will drive strategic initiatives in the e-commerce industry, guiding decision-making processes and shaping future business strategies. This project underscores the enduring influence of data-driven decision-making in the dynamic realm of online retail.

Recommendations and Future Work
-Regularly refresh the dashboard with real-time sales data to ensure up-to-date insights.
-Improve user engagement by incorporating dynamic visualizations and interactive elements.
-Explore advanced statistical techniques to uncover deeper insights and predictive analytics within the dataset.