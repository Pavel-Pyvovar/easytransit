DELIMITER $$
CREATE DEFINER='root'@'localhost' PROCEDURE `add_favourite_station`(IN `station_id` INT)
    NO SQL
UPDATE `USER` SET favourite_stations=JSON_ARRAY_INSERT(favourite_stations, '$.favourite_stations[0]', station_id)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER='root'@'localhost' PROCEDURE `add_user`(IN `first_name` VARCHAR(10), IN `last_name` VARCHAR(20), IN `email` VARCHAR(40), IN `user_password` VARCHAR(30), IN `favourite_stations` TEXT, IN `favourite_lines` TEXT, IN `favourite_transport` TEXT, IN `liked_posts` TEXT)
    NO SQL
BEGIN
INSERT INTO `USER` 
(`first_name`, `second_name`, `email`, `user_password`, `favourite_stations`, `favourite_lines`, `favourite_transport`, `liked_posts`
)
VALUES
        (first_name,  last_name, email,
         user_password,
         favourite_stations,
         favourite_lines,
         favourite_transport,
         liked_posts
        );
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER='root'@'localhost' PROCEDURE `remove_user`(IN `_id` INT(4) UNSIGNED)
    NO SQL
DELETE FROM `USER`
WHERE id = _id$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER='root'@'localhost' PROCEDURE `trans`(IN fname VARCHAR(10), IN sname VARCHAR(10), IN email VARCHAR(20), IN user_password VARCHAR(20), IN favourite_stations JSON, IN favourite_lines JSON, IN favourite_transport JSON, IN liked_posts JSON)
    NO SQL
	START TRANSACTION;
	CALL `sys`.`add_user`(fname, sname, email, user_password, favourite_stations, favourite_lines, favourite_transport, liked_posts);
	SELECT COUNT(*) INTO n FROM `USER`
    IF n = 0 THEN
		ROLLBACK;
        RETURN 'ROLLBACK';
	ELSE
		COMMIT;
        RETURN 'COMMIT';
	END IF;
DELIMITER ;