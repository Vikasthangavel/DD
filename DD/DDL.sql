CREATE DATABASE bank_db;
USE bank_db;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    mobile_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL
);
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Current', 'Fixed Deposit') NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    branch_name VARCHAR(100) NOT NULL
);

CREATE TABLE transactions (
    transaction_id int(3) PRIMARY KEY,
    account_id int(3) NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount decimal(10,2) NOT NULL,
    transaction_date DATE 
);
CREATE TABLE employees (
    employee_id integer(3) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mobile_number VARCHAR(15) UNIQUE NOT NULL
);
INSERT INTO customers (customer_id, name, dob, mobile_number, email, address) VALUES
(1, 'John Doe', '1985-06-15', '9876543210', 'john@example.com', '123 Main St'),
(2, 'Alice Smith', '1992-09-22', '9876543211', 'alice@example.com', '456 Elm St');

INSERT INTO accounts (account_id, customer_id, account_type, balance, branch_name) VALUES
(1, 1, 'Savings', 5000.00, 'Downtown Branch'),
(2, 2, 'Current', 10000.00, 'Uptown Branch');

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount) VALUES
(1, 1, 'Deposit', 2000.00),
(2, 2, 'Withdrawal', 500.00);

INSERT INTO employees (employee_id, name, job_title, branch_name, email, mobile_number) VALUES
(1, 'Michael Brown', 'Manager', 'Downtown Branch', 'michael@example.com', '9876543222'),
(2, 'Sarah Johnson', 'Cashier', 'Uptown Branch', 'sarah@example.com', '9876543223');
ALTER TABLE customers ADD (phoneno integer(10));
ALTER TABLE employees DROP COLUMN job_title;
DELETE FROM transactions;
TRUNCATE TABLE transactions;



SELECT * FROM employees;
SELECT name, dob FROM customers;
