DELIMITER $$
CREATE DEFINER='root'@'localhost' FUNCTION `activity_score`(`_id` INT(10) UNSIGNED) RETURNS int(11)
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE score INT;
    SET score = (SELECT JSON_LENGTH(favourite_stations, '$.favourite_stations') FROM `USER` WHERE id = _id);
    SET score =  score +(SELECT JSON_LENGTH(favourite_lines, '$.favourite_lines') FROM `USER` WHERE id = _id);
    SET score = score + (SELECT JSON_LENGTH(favourite_transport, '$.favourite_transport') FROM `USER` WHERE id = _id);
    SET score = score + (SELECT JSON_LENGTH(liked_posts, '$.liked_posts') FROM `USER` WHERE id = _id);
    RETURN score;
END$$
DELIMITER ;
