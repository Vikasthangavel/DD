create database exp8;
use exp8;
DELIMITER //

CREATE PROCEDURE square(IN a INT)
BEGIN
  DECLARE result INT;
  SET result = a * a;
  SELECT CONCAT('Result: ', result) AS Output;
END;
//

DELIMITER ;
CALL square(5);

DELIMITER //

CREATE PROCEDURE addition(IN a INT, IN b INT)
BEGIN
  DECLARE result INT;
  SET result = a + b;
  SELECT CONCAT('Result: ', result) AS Output;
END;
//

DELIMITER ;
CALL addition(2, 3);

DELIMITER //

CREATE FUNCTION fun(a INT) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN a * a;
END;
//

DELIMITER ;
SELECT fun(4) AS SquareResult;

DELIMITER //

CREATE FUNCTION adding(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN a + b;
END;
//

DELIMITER ;
SELECT adding(10, 20) AS AdditionResult;







