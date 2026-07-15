create database Banking_Risk_Management;

create table customers(
	Customer_ID INT,
    Customer_Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Occupation VARCHAR(50),
    Annual_Income DECIMAL(12,2),
    City VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/Downloads/customers_20000.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

create table loans(
	Loan_ID INT,
    Customer_ID INT,
    Loan_Date DATE,
    Loan_Type VARCHAR(50),
    Loan_Amount DECIMAL(15,2),
    Interest_Rate DECIMAL(5,2),
    Loan_Term INT,
    EMI DECIMAL(15,2),
    Loan_Status VARCHAR(20)
);

LOAD DATA LOCAL INFILE 'D:/data analyst/Personal_Projects/Credit Risk Analysis for Banking Industry  SQL/loans_20000.csv'
INTO TABLE loans
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

create table payments(
    Payment_ID INT,
    Loan_ID INT,
    Payment_Date DATE,
    Amount_Paid DECIMAL(15,2),
    Payment_Status VARCHAR(20)
);

LOAD DATA LOCAL INFILE 'D:/data analyst/Personal_Projects/Credit Risk Analysis for Banking Industry  SQL/payments_20000.csv'
INTO TABLE payments
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

create table credit_score(
	Customer_ID INT,
    Credit_Score INT,
    Risk_Category VARCHAR(20)
);

LOAD DATA LOCAL INFILE 'D:/data analyst/Personal_Projects/Credit Risk Analysis for Banking Industry  SQL/credit_score_20000.csv'
INTO TABLE credit_score
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

select * from credit_score;
select * from payments;
select * from loans;
select * from customers;

-- drop table customers;
-- drop table payments;
-- drop table loans;
-- drop table credit_score;

select count(*) as total_customers from customer_clean;
select count(*) as total_loans from loans;
select count(*) as total_payments from payments;
select count(*) as total_credit_scores from credit_score;

DESCRIBE customers;
DESCRIBE loans;
DESCRIBE payments;
DESCRIBE credit_score;

-- missing values 

SELECT * FROM customers
WHERE Customer_Name IS NULL OR Customer_Name='' OR Age IS NULL OR Gender IS NULL OR Annual_Income IS NULL;
   
SELECT * FROM loans
WHERE Loan_Amount IS NULL OR Loan_Status IS NULL OR Loan_Date IS NULL;
   
SELECT * FROM payments
WHERE Payment_ID IS NULL OR Payment_Date IS NULL OR Amount_Paid IS NULL;

SELECT * FROM credit_score
WHERE Credit_Score IS NULL OR Risk_Category IS NULL;

-- find duplicate values

select customer_id, count(*) from customers
group by customer_id having count(*)>1;

create table customer_clean as select distinct * from customers;

select * from customer_clean;

select loan_id, count(*) from loans
group by loan_id having count(*)>1;

select payment_id, count(*) from payments
group by payment_id having count(*)>1;

-- checking age of customers

select * from customer_clean
where age<18 or age>100;

delete from customer_clean where age<18 or age>100;

select * from customer_clean;

-- checking for value

select * from customer_clean where Annual_Income<0;
select * from loans where Loan_Amount<0;
select * from loans where Interest_Rate<=0 or Interest_Rate>30;

-- standarize words

select distinct gender from customer_clean;
select distinct loan_status from loans;

-- date format

select loan_date from loans;

-- KPI's

-- total customer
select count(customer_id) as total_customer from customer_clean;

-- Total Loan Amount Issued
select sum(loan_amount) as total_loam_amount from loans;

-- 
select count(loan_id) as total_loan from loans;

-- default loans
select count(loan_id) as default_loan from loans
where loan_status = "default";

-- total loan, default loans, default rate
select count(loan_id) as total_loan, sum(case when loan_status="default" then 1 else 0 end) as default_loan,
(sum(case when loan_status="default" then 1 else 0 end) * 100) / count(loan_id) as default_rate
from loans; 

-- avarage credit score
select avg(credit_score) as avg_credit_score from credit_score;

-- Top 10 Highest Loan Customers
select customer_id, loan_amount from loans
order by loan_amount desc
limit 10;

-- Loan Distribution by Loan Type
select loan_type, count(*) as total_loan from loans
group by loan_type;

-- Branch-wise Loan Amount
select c.city, sum(l.loan_amount) from customer_clean c
join loans l on c.customer_id = l.customer_id
group by city;

-- Customers with Late Payments
select c.customer_name, count(p.payment_id) as late_payments from customer_clean c
join loans l on c.customer_id = l.customer_id
join payments p on l.loan_id = p.loan_id
where payment_status = "late"
group by customer_name;

-- Default Risk Analysis
select risk_category, count(*) as customer from credit_score
group by risk_category;

-- High Risk Customers
select c.customer_name, cs.credit_score, l.loan_amount from customer_clean c
join credit_score cs on c.customer_id = cs.customer_id
join loans l on c.customer_id = l.customer_id
where credit_score<600; 

-- Monthly Loan Disbursement
select year(loan_date) as loan_per_year, month(loan_date) as loan_per_month, sum(loan_amount) as total_loan 
from loans
group by loan_per_year, loan_per_month
order by loan_per_year, loan_per_month;

-- Top 5 Cities by Loan Amount
select c.city, sum(l.loan_amount) as total_loan from customer_clean c
join loans l on c.customer_id = l.customer_id
group by city
order by total_loan desc
limit 5;

-- Customer Risk Classification
select customer_name, credit_score,
case 
when credit_score>=750 then "Low Risk"
when credit_score>=650 then "Medium Risk"
else "High Risk"
end as risk_lavel
from customer_clean
join credit_score
using(customer_id);

-- Rank Customers by Loan Amount
WITH CustomerLoan AS
(
    SELECT c.Customer_ID, c.Customer_Name, SUM(l.Loan_Amount) AS Total_Loan_Amount
    FROM customer_clean c
    JOIN loans l ON c.Customer_ID = l.Customer_ID
    GROUP BY c.Customer_ID, c.Customer_Name
)

SELECT Customer_ID, Customer_Name, Total_Loan_Amount,
       RANK() OVER(ORDER BY Total_Loan_Amount DESC) AS Rank_No
FROM CustomerLoan;


