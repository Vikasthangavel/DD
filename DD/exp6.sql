create database exp6;
use exp6;
CREATE TABLE bank_details (
    account_holder VARCHAR(50),
    account_number BIGINT PRIMARY KEY,
    balance DECIMAL(10,2)
);
INSERT INTO bank_details VALUES ('John Doe', 1001234567, 50000.00);
INSERT INTO bank_details VALUES ('Jane Smith', 1009876543, 75000.50);
DELIMITER $$

CREATE PROCEDURE GetAccountNumbers()
BEGIN
    DECLARE acc_no BIGINT;
    DECLARE done INT DEFAULT FALSE;
    
    -- Declare cursor
    DECLARE bank_cursor CURSOR FOR 
        SELECT account_number FROM bank_details;
    
    -- Declare handler for when no more rows are found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor
    OPEN bank_cursor;
    
    read_loop: LOOP
        FETCH bank_cursor INTO acc_no;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Print account number
        SELECT acc_no;
    END LOOP;

    -- Close cursor
    CLOSE bank_cursor;
END $$

DELIMITER ;
CALL GetAccountNumbers();

