create database exp7;
use exp7;
CREATE TABLE bank (
    acc_no INT(6) PRIMARY KEY,
    branch VARCHAR(20),
    balance DECIMAL(10,2)
);
INSERT INTO bank VALUES (101234, 'central', 50000.00);
INSERT INTO bank VALUES (202345, 'north', 150000.00);
CREATE TABLE bank_backup (
    acc_no INT(6),
    branch VARCHAR(20),
    balance DECIMAL(10,2)
);
DELIMITER //
CREATE TRIGGER bank_trig BEFORE UPDATE ON bank 
FOR EACH ROW 
BEGIN 
    INSERT INTO bank_backup VALUES (OLD.acc_no, OLD.branch, OLD.balance);
END;
//
DELIMITER ;
SELECT * FROM bank;
UPDATE bank SET balance = 48000.00 WHERE acc_no = 101234;
UPDATE bank SET balance = 140000.00 WHERE acc_no = 202345;
SELECT * FROM bank;
SELECT * FROM bank_backup;
