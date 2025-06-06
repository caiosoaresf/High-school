DROP DATABASE IF EXISTS IFMG;
CREATE DATABASE IFMG;
USE IFMG;

CREATE TABLE STUDENT(RA VARCHAR(7) NOT NULL, NOM VARCHAR(30) NOT NULL, SCORE DOUBLE NULL, CONSTRAINT PRIMARY KEY(RA));

INSERT INTO STUDENT VALUES('0062018','LAÍS FREITAS','89');
INSERT INTO STUDENT VALUES('0062050','CAIO FERNANDES','90');
INSERT INTO STUDENT VALUES('0062028','VANDER VANTUIL','69');
INSERT INTO STUDENT VALUES('0063014','HELOÍSA FREITAS','83');

DELIMITER $$
CREATE FUNCTION SUMSCORE() RETURNS DOUBLE
BEGIN
	DECLARE TOTALSCORES,SCORE DOUBLE;
    DECLARE ENDED INT DEFAULT FALSE;
    DECLARE CURSORSTUDENTS CURSOR FOR SELECT A.SCORE FROM STUDENT A;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET ENDED = TRUE;
    
    SET TOTALSCORES = 0;
    OPEN CURSORSTUDENTS;
    FETCH NEXT FROM CURSORSTUDENTS INTO SCORE;
    WHILE NOT ENDED DO
		SET TOTALSCORES = TOTALSCORES + SCORE;
        FETCH NEXT FROM CURSORSTUDENTS INTO SCORE;
	END WHILE;
    CLOSE CURSORSTUDENTS;
    RETURN TOTALSCORES;
END $$
DELIMITER ;

SELECT SUMSCORE() AS 'SCORES SUMMED';
