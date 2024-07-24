-- Создание базы данных (если она ещё не создана)
CREATE DATABASE IF NOT EXISTS trt;

-- Выбор базы данных
USE trt;

-- Создание функции для форматирования секунд
DROP FUNCTION IF EXISTS format_seconds;

DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    DECLARE formatted_time VARCHAR(100);

    SET days = seconds / 86400;
    SET hours = (seconds % 86400) / 3600;
    SET minutes = (seconds % 3600) / 60;
    SET remaining_seconds = seconds % 60;

    SET formatted_time = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');

    RETURN formatted_time;
END //

DELIMITER ;

-- Использование функции для получения результата
SELECT format_seconds(123456) AS formatted_time;

-- Создание процедуры для вывода чётных чисел
DROP PROCEDURE IF EXISTS get_even_numbers;

DELIMITER //

CREATE PROCEDURE get_even_numbers()
BEGIN
    SELECT number
    FROM (SELECT 1 AS number UNION ALL
          SELECT 2 UNION ALL
          SELECT 3 UNION ALL
          SELECT 4 UNION ALL
          SELECT 5 UNION ALL
          SELECT 6 UNION ALL
          SELECT 7 UNION ALL
          SELECT 8 UNION ALL
          SELECT 9 UNION ALL
          SELECT 10) AS numbers
    WHERE number % 2 = 0;
END //

DELIMITER ;

-- Использование функции для получения результата
SELECT format_seconds(123456) AS formatted_time;

-- Использование процедуры для вывода чётных чисел
CALL get_even_numbers();

