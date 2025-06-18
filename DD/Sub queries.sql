create database ex3;
use ex3;
CREATE TABLE BANK (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    ifsc_code VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO BANK (bank_name, branch_name, ifsc_code) VALUES
('State Bank of India', 'Salem', 'SBIN0001234'),
('HDFC Bank', 'Chennai', 'HDFC0005678'),
('ICICI Bank', 'Coimbatore', 'ICIC0004321'),
('Axis Bank', 'Madurai', 'AXIS0009876');

CREATE TABLE BANK_ADDRESS (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_id INT,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    FOREIGN KEY (bank_id) REFERENCES BANK(bank_id) ON DELETE CASCADE
);

INSERT INTO BANK_ADDRESS (bank_id, street, city, state, pincode) VALUES
(1, 'No. 12, Main Road', 'Salem', 'Tamil Nadu', '636007'),
(2, 'No. 45, Anna Nagar', 'Chennai', 'Tamil Nadu', '600040'),
(3, 'No. 78, Gandhipuram', 'Coimbatore', 'Tamil Nadu', '641012'),
(4, 'No. 22, South Street', 'Madurai', 'Tamil Nadu', '625001');

SELECT * FROM BANK;
SELECT * FROM BANK_ADDRESS;

SELECT * FROM BANK NATURAL JOIN BANK_ADDRESS;

SELECT *FROM BANK INNER JOIN BANK_ADDRESS ON BANK.bank_id = BANK_ADDRESS.bank_id;
SELECT *FROM BANK LEFT OUTER JOIN BANK_ADDRESS ON BANK.bank_id = BANK_ADDRESS.bank_id;
SELECT * FROM BANK RIGHT OUTER JOIN BANK_ADDRESS ON BANK.bank_id = BANK_ADDRESS.bank_id;
SELECT * FROM BANK FULL OUTER JOIN BANK_ADDRESS ON BANK.bank_id = BANK_ADDRESS.bank_id;

SELECT * FROM BANK CROSS JOIN BANK_ADDRESS;
SELECT BANK.bank_name, BANK_ADDRESS.street, BANK_ADDRESS.city, BANK_ADDRESS.state, BANK_ADDRESS.pincode FROM BANK CROSS JOIN BANK_ADDRESS;

SELECT bank_id AS id FROM BANK UNION SELECT address_id AS id FROM BANK_ADDRESS;
SELECT bank_id AS id FROM BANK UNION ALL SELECT address_id AS id FROM BANK_ADDRESS;

SELECT bank_id AS id FROM BANK INTERSECT SELECT address_id AS id FROM BANK_ADDRESS;


SELECT bank_id AS id FROM BANK MINUS SELECT address_id AS id FROM BANK_ADDRESS;










