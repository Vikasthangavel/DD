create database exp4;
use exp4;
CREATE TABLE Accounts (
    AccountNumber INT PRIMARY KEY,
    AccountHolder VARCHAR(100),
    Branch VARCHAR(50),
    AccountType VARCHAR(50)
);
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountNumber INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);
CREATE TABLE AccountHolders (
    AccountNumber INT PRIMARY KEY,
    AccountHolder VARCHAR(100),
    FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);
CREATE TABLE Branches (
    Branch VARCHAR(50) PRIMARY KEY,
    BranchLocation VARCHAR(100),
    BranchManager VARCHAR(100)
);
INSERT INTO Accounts (AccountNumber, AccountHolder, Branch, AccountType)
VALUES
(101, 'Alice Smith', 'Downtown', 'Checking'),
(102, 'Bob Brown', 'Downtown', 'Savings'),
(103, 'Alice Smith', 'Uptown', 'Savings');

INSERT INTO Transactions (TransactionID, AccountNumber, TransactionType, Amount)
VALUES
(1001, 101, 'Deposit', 500.00),
(1002, 102, 'Withdrawal', 200.00),
(1003, 103, 'Deposit', 150.00);

INSERT INTO AccountHolders (AccountNumber, AccountHolder)
VALUES
(101, 'Alice Smith'),
(102, 'Bob Brown'),
(103, 'Alice Smith');

INSERT INTO Branches (Branch, BranchLocation, BranchManager)
VALUES
('Downtown', '123 Main St', 'John Doe'),
('Uptown', '456 Elm St', 'Jane Smith');

SELECT * FROM Accounts;
SELECT * FROM Transactions
WHERE AccountNumber = 101;
SELECT a.AccountNumber, a.AccountHolder, t.TransactionID, t.TransactionType, t.Amount
FROM Accounts a
JOIN Transactions t ON a.AccountNumber = t.AccountNumber
WHERE a.AccountNumber = 101;
SELECT a.AccountNumber, a.AccountHolder, b.Branch, b.BranchLocation, b.BranchManager
FROM Accounts a
JOIN Branches b ON a.Branch = b.Branch
WHERE a.AccountNumber = 101;






