-- =====================================================
-- Bank Loan Risk Analysis - SQL Queries
-- =====================================================

-- Query 1: View all records
SELECT * FROM loan_data;

-- Query 2: View first 10 records
SELECT *
FROM loan_data
LIMIT 10;

-- Query 3: Total number of customers
SELECT COUNT(*) AS total_customers
FROM loan_data;

-- Query 4: Count defaulters and non-defaulters
SELECT defaulted,
       COUNT(*) AS customer_count
FROM loan_data
GROUP BY defaulted;

-- Query 5: Average bank balance
SELECT AVG(bank_balance) AS average_bank_balance
FROM loan_data;

-- Query 6: Count employed and unemployed customers
SELECT employed,
       COUNT(*) AS total_customers
FROM loan_data
GROUP BY employed;

-- Query 7: Average annual salary by default status
SELECT defaulted,
       AVG(annual_salary) AS average_salary
FROM loan_data
GROUP BY defaulted;

-- Query 8: Average bank balance by default status
SELECT defaulted,
       AVG(bank_balance) AS average_bank_balance
FROM loan_data
GROUP BY defaulted;

-- Query 9: Highest annual salary
SELECT MAX(annual_salary) AS highest_salary
FROM loan_data;

-- Query 10: Lowest annual salary
SELECT MIN(annual_salary) AS lowest_salary
FROM loan_data;

-- Query 11: Top 10 customers with highest bank balance
SELECT *
FROM loan_data
ORDER BY bank_balance DESC
LIMIT 10;

-- Query 12: Top 10 customers with lowest bank balance
SELECT *
FROM loan_data
ORDER BY bank_balance ASC
LIMIT 10;

-- Query 13: Show all defaulters
SELECT *
FROM loan_data
WHERE defaulted = 1;

-- Query 14: Show all non-defaulters
SELECT *
FROM loan_data
WHERE defaulted = 0;

-- Query 15: Default rate percentage
SELECT
ROUND(
(SUM(defaulted)::DECIMAL / COUNT(*)) * 100,
2
) AS default_rate_percentage
FROM loan_data;

-- Query 16: Number of employed customers who defaulted
SELECT COUNT(*) AS employed_defaulters
FROM loan_data
WHERE employed = 1
AND defaulted = 1;

-- Query 17: Number of unemployed customers who defaulted
SELECT COUNT(*) AS unemployed_defaulters
FROM loan_data
WHERE employed = 0
AND defaulted = 1;

-- Query 18: Average salary of defaulters
SELECT AVG(annual_salary) AS average_salary_defaulters
FROM loan_data
WHERE defaulted = 1;

-- Query 19: Average salary of non-defaulters
SELECT AVG(annual_salary) AS average_salary_non_defaulters
FROM loan_data
WHERE defaulted = 0;

-- Query 20: Average bank balance of defaulters
SELECT AVG(bank_balance) AS average_balance_defaulters
FROM loan_data
WHERE defaulted = 1;

-- Query 21: Average bank balance of non-defaulters
SELECT AVG(bank_balance) AS average_balance_non_defaulters
FROM loan_data
WHERE defaulted = 0;

-- Query 22: Highest salary among defaulters
SELECT MAX(annual_salary) AS highest_salary_defaulter
FROM loan_data
WHERE defaulted = 1;

-- Query 23: Highest bank balance among defaulters
SELECT MAX(bank_balance) AS highest_balance_defaulter
FROM loan_data
WHERE defaulted = 1;

-- Query 24: Customers grouped by employment and default status
SELECT employed,
       defaulted,
       COUNT(*) AS total_customers
FROM loan_data
GROUP BY employed, defaulted
ORDER BY employed, defaulted;

-- Query 25: Customers with high salary and high bank balance
SELECT *
FROM loan_data
WHERE annual_salary > 500000
AND bank_balance > 10000;