create database bank;
use bank;
CREATE TABLE account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    account_type ENUM('Savings', 'Current', 'Fixed Deposit', 'Recurring Deposit'),
    balance DECIMAL(10,2),
    join_date DATE
);
INSERT INTO account (first_name, last_name, account_type, balance, join_date) VALUES
('John', 'Doe', 'Savings', 15000.00, '2019-05-15'),
('Alice', 'Smith', 'Current', 8500.50, '2017-08-20'),
('Michael', 'Brown', 'Fixed Deposit', 120000.00, '2020-11-10'),
('Emma', 'Johnson', 'Savings', 9800.75, '2021-03-22'),
('William', 'Davis', 'Current', 25000.00, '2016-12-01'),
('Sophia', 'Miller', 'Recurring Deposit', 30000.00, '2022-07-18'),
('Daniel', 'Wilson', 'Savings', 7000.00, '2018-02-14'),
('Olivia', 'Taylor', 'Current', 11000.00, '2023-09-05');
CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY AUTO_INCSREMENT,
    account_id INT,
    title VARCHAR(100),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);
INSERT INTO transaction (account_id, title, amount, transaction_date) VALUES
(1, 'Salary Credit', 20000.00, '2024-02-01'),
(2, 'Utility Bill Payment', 3000.00, '2024-01-25'),
(3, 'Fixed Deposit Interest', 5000.00, '2024-02-05'),
(4, 'Online Shopping', 2000.00, '2024-01-20'),
(5, 'Loan EMI Payment', 10000.00, '2024-02-03'),
(6, 'Salary Credit', 25000.00, '2024-01-31'),
(7, 'Cash Withdrawal', 1500.00, '2024-02-06'),
(8, 'Electricity Bill', 1200.00, '2024-01-22'),
(1, 'Rent Payment', 8000.00, '2024-01-28'),
(3, 'Grocery Shopping', 3500.00, '2024-02-02'),
(5, 'Insurance Premium', 4500.00, '2024-01-30');
SELECT * FROM account WHERE balance > 25000;
SELECT * FROM account WHERE join_date > '2022-01-01';
SELECT * FROM account WHERE account_id IN (1,2);
SELECT * FROM account;
SELECT First_Name, Last_Name FROM account;
SELECT First_Name AS Name FROM account;
SELECT UPPER(First_Name) AS First_Name_Uppercase FROM account;
SELECT MAX(amount) - MIN(amount) AS Amount_Difference FROM transaction;
SELECT * FROM transaction ORDER BY title DESC;
