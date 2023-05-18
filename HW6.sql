# Задача 1

DELIMITER $$
DROP FUNCTION IF EXISTS convert_sec_to_time$$
CREATE FUNCTION convert_sec_to_time
(
	seconds INT
)
RETURNS TEXT
DETERMINISTIC
RETURN(
CONCAT(
ROUND(EXTRACT(HOUR FROM SEC_TO_TIME(seconds)) / 24), ' days ',
EXTRACT(HOUR FROM SEC_TO_TIME(seconds)) % 24, ' hours ',
EXTRACT(MINUTE FROM SEC_TO_TIME(seconds)), ' minutes ',
EXTRACT(SECOND FROM SEC_TO_TIME(seconds)), ' seconds '
)

);
SELECT convert_sec_to_time(123456);
SELECT convert_sec_to_time(323456);

# Задача 2
-
DELIMITER &&

DROP PROCEDURE IF EXISTS print_numbers&&
CREATE PROCEDURE print_numbers 
(
	IN value INT
)
BEGIN
	DECLARE n INT; 
    DECLARE m INT;
	DECLARE result VARCHAR(45) DEFAULT "";
	SET n = value;
    SET m = 1;
	REPEAT
		IF ((m % 2) = 0) THEN
			SET result = CONCAT(result, m, ",");
			SET m = m + 1;
		ELSE
			SET m = m + 1;
		END IF;
    UNTIL m = n+1
	END REPEAT;
SELECT result;
END&&

CALL print_numbers(10);


