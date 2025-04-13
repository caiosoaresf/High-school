DROP DATABASE IF EXISTS CPF;
CREATE DATABASE CPF;
USE CPF;

DELIMITER //
CREATE FUNCTION ValidateCPF(CPF VARCHAR(14)) RETURNS BOOLEAN
BEGIN
    DECLARE num1, num2, num3, num4, num5, num6, num7, num8, num9, num10, num11, soma1, soma2 INT;
    DECLARE rest1, rest2 FLOAT;

    SET num1 = CAST(SUBSTRING(CPF, 1, 1) AS UNSIGNED);
    SET num2 = CAST(SUBSTRING(CPF, 2, 1) AS UNSIGNED);
    SET num3 = CAST(SUBSTRING(CPF, 3, 1) AS UNSIGNED);
    SET num4 = CAST(SUBSTRING(CPF, 5, 1) AS UNSIGNED);
    SET num5 = CAST(SUBSTRING(CPF, 6, 1) AS UNSIGNED);
    SET num6 = CAST(SUBSTRING(CPF, 7, 1) AS UNSIGNED);
    SET num7 = CAST(SUBSTRING(CPF, 9, 1) AS UNSIGNED);
    SET num8 = CAST(SUBSTRING(CPF, 10, 1) AS UNSIGNED);
    SET num9 = CAST(SUBSTRING(CPF, 11, 1) AS UNSIGNED);
    SET num10 = CAST(SUBSTRING(CPF, 13, 1) AS UNSIGNED);
    SET num11 = CAST(SUBSTRING(CPF, 14, 1) AS UNSIGNED);

    IF (num1 = num2 AND num2 = num3 AND num3 = num4 AND num4 = num5 AND num5 = num6 AND num6 = num7 AND num7 = num8 AND num8 = num9 AND num9 = num10 AND num10 = num11) THEN
        RETURN FALSE;
    ELSE
        SET soma1 = num1 * 10 + num2 * 9 + num3 * 8 + num4 * 7 + num5 * 6 + num6 * 5 + num7 * 4 + num8 * 3 + num9 * 2;
        SET rest1 = (soma1 * 10) % 11;

        IF rest1 = 10 THEN
            SET rest1 = 0;
        END IF;

        SET soma2 = num1 * 11 + num2 * 10 + num3 * 9 + num4 * 8 + num5 * 7 + num6 * 6 + num7 * 5 + num8 * 4 + num9 * 3 + num10 * 2;
        SET rest2 = (soma2 * 10) % 11;

        IF rest2 = 10 THEN
            SET rest2 = 0;
        END IF;

        IF (rest1 = num10 AND rest2 = num11) THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END IF;
END //
DELIMITER ;

SELECT ValidateCPF("123.456.789-12") AS result; -- CPF invalid
SELECT ValidateCPF("529.982.247-25") AS result; -- CPF valid
SELECT ValidateCPF("777.777.777-77") AS result; -- CPF invalid
