-- Create Database
create database BankingTA;
use bankingta;

-- create Customers Table
CREATE TABLE Customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(10),
city VARCHAR(50),
phone VARCHAR(15),
email VARCHAR(100)
);

-- Create Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    opening_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    description VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- Insert values to 'Customers' Table
INSERT INTO Customers
(first_name,last_name,gender,city,phone,email)
VALUES
('John','Smith','Male','Delhi','9876543210','john@gmail.com'),
('Emma','Johnson','Female','Mumbai','9876543211','emma@gmail.com'),
('Michael','Brown','Male','Bangalore','9876543212','michael@gmail.com'),
('Sophia','Davis','Female','Kolkata','9876543213','sophia@gmail.com'),
('David','Wilson','Male','Hyderabad','9876543214','david@gmail.com');

-- Insert values to 'Accounts' Table
INSERT INTO Accounts
(customer_id,account_type,balance,opening_date)
VALUES
(1,'Savings',85000,'2023-01-10'),
(2,'Current',120000,'2022-05-18'),
(3,'Savings',65000,'2024-02-11'),
(4,'Savings',92000,'2021-11-15'),
(5,'Current',45000,'2023-07-20');

-- Insert values to 'Transactions' Table
INSERT INTO Transactions
(account_id,transaction_date,transaction_type,amount,description)
VALUES
(1,'2025-01-02','Deposit',25000,'Salary Credit'),
(1,'2025-01-05','Withdrawal',5000,'ATM Withdrawal'),
(1,'2025-01-10','Transfer',7000,'UPI Transfer'),

(2,'2025-01-03','Deposit',40000,'Business Income'),
(2,'2025-01-07','Withdrawal',10000,'Cheque Payment'),
(2,'2025-01-15','Transfer',15000,'Vendor Payment'),

(3,'2025-01-04','Deposit',20000,'Salary'),
(3,'2025-01-08','Withdrawal',3000,'ATM'),
(3,'2025-01-18','Transfer',5000,'Electricity Bill'),

(4,'2025-01-06','Deposit',30000,'Salary'),
(4,'2025-01-11','Withdrawal',8000,'Shopping'),
(4,'2025-01-20','Transfer',6000,'Insurance'),

(5,'2025-01-09','Deposit',15000,'Cash Deposit'),
(5,'2025-01-14','Withdrawal',4000,'ATM'),
(5,'2025-01-21','Transfer',9000,'Rent');

-- 1. View all customers
SELECT * FROM Customers;

-- 2. View all accounts
SELECT * FROM Accounts;

-- 3. View all transactions
SELECT * FROM Transactions;

-- 4. Total balance in bank
SELECT SUM(balance) AS Total_Balance
FROM Accounts;

-- 5. Average account balance
SELECT AVG(balance) AS Average_Balance
FROM Accounts;

-- 6. Highest account balance
SELECT MAX(balance) AS Highest_Balance
FROM Accounts;

-- 7. Lowest account balance
SELECT MIN(balance) AS Lowest_Balance
FROM Accounts;

-- 8. Total deposits
SELECT SUM(amount) AS Total_Deposits
FROM Transactions
WHERE transaction_type='Deposit';

-- 9. Total withdrawals
SELECT SUM(amount) AS Total_Withdrawals
FROM Transactions
WHERE transaction_type='Withdrawal';

-- 10. Number of transactions by type
SELECT transaction_type,
COUNT(*) AS Total
FROM Transactions
GROUP BY transaction_type;

-- 11. Customer with account details
SELECT
c.first_name,
c.last_name,
a.account_type,
a.balance
FROM Customers c
JOIN Accounts a
ON c.customer_id=a.customer_id;

-- 12. Total transaction amount per account
SELECT
account_id,
SUM(amount) AS Total_Transaction
FROM Transactions
GROUP BY account_id;

-- 13. Customers having balance greater than 80000
SELECT
c.first_name,
c.last_name,
a.balance
FROM Customers c
JOIN Accounts a
ON c.customer_id=a.customer_id
WHERE a.balance>80000;

-- 14. Top 3 richest customers
SELECT
c.first_name,
c.last_name,
a.balance
FROM Customers c
JOIN Accounts a
ON c.customer_id=a.customer_id
ORDER BY a.balance DESC
LIMIT 3;

-- 15. Monthly transaction summary
SELECT
MONTH(transaction_date) AS Month,
SUM(amount) AS Total_Amount
FROM Transactions
GROUP BY MONTH(transaction_date);
