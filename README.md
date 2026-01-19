# 💳Card Product Value Optimizer: A Fintech Customer Segmentation Strategy
Strategic data analysis to optimize credit card product features and marketing spend based on Customer Lifetime Value (CLV) and behavior-based segmentation.

| Tools | Data Source | Concepts | Deliverables |
| :--- | :--- | :--- | :--- |
| **SQL** (PostgreSQL/MySQL) | **[Financial Transactions Dataset](https://www.kaggle.com/datasets/computingvictor/transactions-fraud-datasets/data)** | Relational Modeling (ETL) | Interactive Tableau Dashboard |
| **Tableau** | **Multi-file CSV/JSON** (Transactions, Users, Cards) | RFM Segmentation & Cohort Analysis | Project SQL Scripts (`.sql`) |

---

### 1. 📘Project Overview

In the highly competitive Fintech sector, optimizing profitability requires shifting focus from simply increasing transaction *volume* to maximizing customer *value*. This project simulates the role of a Product Analyst at a digital bank tasked with optimizing the bank's credit card portfolio.

The central goal of this strategic initiative is to move beyond simple revenue reporting and develop a data-driven model that identifies, segments, and quantifies the bank's most valuable customers.

**Deliverables:** An end-to-end data pipeline in SQL resulting in a clean, customer-level fact table, and an [interactive Tableau dashboard](https://public.tableau.com/app/profile/sven.friedel/viz/Dashboard_17676766705190/CardCustomerDashboard) providing actionable recommendations for product feature enhancements and targeted marketing campaigns.

### 2. 💡Key Business Questions & Strategic Impact

The analysis is designed to answer critical questions for the Card Services and Marketing teams:

1.  **Customer Segmentation & Value:** How can the entire customer base be segmented using **RFM (Recency, Frequency, Monetary)** logic, and which segments represent the highest Customer Lifetime Value (CLV) opportunity?
2.  **Product Stickiness:** Do certain card brands (e.g., Mastercard vs. Visa) exhibit significantly different usage patterns?
3.  **Targeted Cross-Selling:** What is the primary spending behavior (Merchant Category Code / MCC) of our **Champion** customers, and what complementary financial products should be recommended to them?
4.  **Dormancy Risk:** Which customer segments show high monetary value but low recency, indicating they are **At-Risk** of churn, and requiring immediate retention efforts?

### 3. 💾Project Structure and Data Pipeline

This project demonstrates proficiency in Extract, Transform, and Load (ETL) processes entirely within a SQL environment before visualization.

| Step | Focus | Description |
| :--- | :--- | :--- |
| **1. Data Modeling (SQL)** | **Integration** | The multi-file dataset (`transactions`, `users`, `cards`, `fraud_labels`) is loaded into a relational database schema. Multiple `JOIN` operations are performed to create a single, customer-level analytical table. |
| **2. Feature Engineering (SQL)** | **Transformation** | Advanced SQL is used to transform raw transaction logs into behavioral metrics, including calculating the **Recency** metric, Total **Monetary** value, and creating **Categorical Spending Buckets** (Travel, Essentials, Discretionary). |
| **3. Metric Calculation (SQL)** | **Segmentation** | Utilizing the aggregated customer table, the final RFM scores are assigned to each customer. This table feeds directly into Tableau. |
| **4. Visualization (Tableau)** | **Reporting** | A final, interactive dashboard is created to dynamically display RFM segments, spending profiles, and comparative analysis of profitability between card products. |



### 4. 🔧Technical Deep Dive

The core challenge of this project involved advanced SQL concepts to transform raw data into a decision-ready format:

* **Relational Joins:** Successfully merging four disparate datasets (Fact and Dimension tables) to enrich the transaction data with customer demographics and card metadata.
* **RFM Logic Implementation:** Using `MAX(transaction_date)` and `DATE_DIFF` functions to programmatically calculate the **Recency** score—a metric critical for marketing effectiveness.
* **Window Functions (Optional):** Leveraging `LAG()` and `PARTITION BY card_id` to calculate **Transaction Velocity** (time between transactions), which can be analyzed for high-frequency user profiles.

### 5. 📊Visualizations & Final Deliverable

The final output is the **[Card Customer Dashboard](https://public.tableau.com/app/profile/sven.friedel/viz/Dashboard_17676766705190/CardCustomerDashboard)**, a tool that allows product managers to isolate customer segments for precise targeting.

* **RFM Segment Matrix:** A heat map showing the number of customers and their average spending for each RFM group (e.g., Champions, Potential Loyalist, Can’t Lose Them).
* **Spending Preferences:** A drill-down visualization that displays the most popular Merchants for any selected customer segment, driving cross-sell strategies.
* **Card Brand Profitability Analysis:** A comparison of all offered Card Brands (Mastercard, Visa, Amex and Discover) across different Customer Segments to inform rewards budget allocation.



---
