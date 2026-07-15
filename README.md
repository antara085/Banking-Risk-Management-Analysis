# Credit Risk Analysis Dashboard

> End-to-End Banking Data Analytics Project using **SQL + Power BI**

---

# Project Overview

This project analyzes banking loan portfolios to identify credit risk, customer behavior, payment performance, and loan trends.

The dashboard enables business users to:

✔ Monitor overall loan portfolio

✔ Identify high-risk customers

✔ Track payment performance

✔ Analyze loan distribution by loan type

✔ Understand customer credit score distribution

✔ Support data-driven lending decisions

---

# Business Problem

Banks process thousands of loans every day.

Without proper analytics they cannot easily identify:

- High-risk borrowers
- Loan defaults
- Missed payments
- Customer risk categories
- Loan performance
- Credit score trends

This dashboard provides interactive insights to improve lending decisions and reduce financial risk.

---

# Tech Stack

- MySQL
- Power BI Desktop
- Power Query
- DAX
- SQL
- Data Cleaning
- Data Modeling

---

# Dataset

The project contains four relational datasets:

### Customers
- Customer ID
- Name
- Age
- Gender
- City
- Occupation
- Income

### Loans
- Loan ID
- Customer ID
- Loan Type
- Loan Amount
- Interest Rate
- EMI
- Loan Status
- Loan Date

### Payments
- Payment ID
- Loan ID
- Payment Amount
- Payment Status
- Payment Date

### Credit Score
- Customer ID
- Credit Score
- Risk Category

---

# Database Schema

Customers
        │
        │
        ▼
Loans
        │
        ▼
Payments

Customers
        │
        ▼
Credit Score

---

# Data Cleaning Performed

✔ Removed duplicate records

✔ Handled missing values

✔ Standardized date formats

✔ Corrected invalid ages

✔ Fixed inconsistent payment status

✔ Converted data types

✔ Created relationships between tables

---

# Dashboard Pages
---

## Page 1 — Overview Dashboard

### KPIs

- Total Customers
- Total Loans
- Total EMI
- Total Payments

### Visuals

- Loan Status Distribution (Donut Chart)
- Yearly Loan Trend (Line Chart)
- Payment Status Funnel
- Top 5 Customers by Loan Amount

### Filters

- Loan Type
- Risk Category
- Loan Status
- City

---

## Page 2 — Risk Analysis Dashboard

### KPIs

- Average Credit Score
- Default Rate
- Late Payments
- Missed Payments

### Visuals

- Risk Category Distribution
- Interest Rate Analysis
- Credit Score Distribution
- City-wise Risk Map

### Business Insights

Identify:

- High-risk customer groups
- Cities with highest loan risk
- Credit score distribution
- Interest rate trends

---

## Page 3 — Loan Analysis Dashboard

### KPIs

- Active Loans
- Closed Loans
- Default Loans
- Average Loan Term

### Visuals

- Loan Type Distribution
- EMI Analysis
- Loan Amount by Loan Type
- Loan Disbursement Trend

### Business Insights

Understand:

- Most popular loan types
- Loan amount trends
- EMI distribution
- Loan growth over time

---

# Key Insights

✔ High-risk customers represent a smaller portion of total customers but contribute significantly to default loans.

✔ Education and Business loans account for a major share of total loan disbursement.

✔ Payment delays are concentrated within specific customer segments.

✔ Credit scores below the average show higher default probability.

✔ Top customers contribute a significant percentage of the total loan portfolio.

---

# DAX Measures Used

Examples:

```DAX
Total Loan Amount

Average Credit Score

Default Rate %

Total EMI

Late Payments

Top 5 Customers

Loan Status Count

Average Interest Rate
```

---

# SQL Concepts Used

- Joins
- GROUP BY
- Aggregate Functions
- CASE Statements
- Window Functions
- CTE
- Data Cleaning Queries
- Views

---

# Dashboard Preview

## Overview Dashboard

> <img width="993" height="559" alt="Screenshot (207)" src="https://github.com/user-attachments/assets/5bc03445-1cf1-485f-9683-9de18abd15d1" />

---

## Risk Analysis Dashboard

> <img width="994" height="559" alt="Screenshot (208)" src="https://github.com/user-attachments/assets/d6b2cf9f-5646-487a-8323-cbd36ea5f5cb" />

---

## Loan Analysis Dashboard

> <img width="992" height="558" alt="Screenshot (209)" src="https://github.com/user-attachments/assets/d9cb0f76-cb4e-4c24-82ca-de22aeb471a5" />

---

# Project Structure

```
Credit-Risk-Analysis/
│
├── Dataset/
│      customers.csv
│      loans.csv
│      payments.csv
│      credit_score.csv
│
├── SQL/
│      schema.sql
│      data_cleaning.sql
│      analysis_queries.sql
│
├── PowerBI/
│      Credit_Risk_Analysis.pbix
│
├── Images/
│      overview_dashboard.png
│      risk_dashboard.png
│      loan_dashboard.png
│
└── README.md
```

---

# Skills Demonstrated

- SQL
- MySQL
- Data Cleaning
- Data Modeling
- Power BI
- DAX
- Data Visualization
- Dashboard Design
- Banking Analytics
- Business Intelligence

---

# Author

**Antara Dutta**

**Aspiring Data Analyst | 7+ Years of UX Experience**

Email: antaradutta085@gmail.com

---

**If you found this project useful, consider giving it a Star.**
