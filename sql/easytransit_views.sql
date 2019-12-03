CREATE VIEW all_users AS
SELECT * FROM `USER` 

CREATE VIEW with_valid_passwd AS
SELECT * FROM `USER`
WHERE LENGTH(user_password) > 10

CREATE VIEW oldest_users AS
SELECT * FROM `USER`
WHERE likes_count > 5 AND DATEDIFF(NOW(), created_time) > 30


CREATE VIEW name_surname_email AS
SELECT first_name, second_name, email FROM `USER`

CREATE VIEW name_surname AS 
SELECT CONCAT(first_name, second_name) FROM `USER`

CREATE VIEW `case` AS
SELECT  
    CASE
        WHEN created_time = updated_time THEN "Newly registered users"
        ELSE "Experienced users"
    END
FROM `USER`

CREATE VIEW `limit` AS
SELECT * FROM `USER` LIMIT 10

-- 9
CREATE VIEW `random` AS
SELECT * FROM `USER`
ORDER BY RAND()
LIMIT 10

-- 10
CREATE VIEW `find_null` AS
SELECT * FROM `USER`
WHERE favourite_lines = NULL


-- 11
CREATE VIEW `like` AS
SELECT * FROM `USER`
WHERE `first_name` LIKE '%o'

-- 12
CREATE VIEW `sort_by_name` AS
SELECT * FROM `USER`
ORDER BY first_name

-- 13
CREATE VIEW `sort_by_name_surname` AS
SELECT * FROM `USER`
ORDER BY first_name, second_name

-- 14
CREATE VIEW `substring` AS
SELECT SUBSTRING(email, -3, 3) FROM  `USER`

-- 15

-- 16

-- 17
CREATE VIEW union_all AS
SELECT first_name, created_time FROM `USER`
UNION ALL
SELECT transport_type, created_type FROM TRANSPORT