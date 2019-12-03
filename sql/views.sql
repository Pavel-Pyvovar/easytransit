CREATE VIEW `1` AS
    SELECT 
        *
    FROM
        `USER`;
        
CREATE VIEW `2` AS
    SELECT 
        *
    FROM
        `USER`
    WHERE
        id = 1;
    
CREATE VIEW `3` AS
    SELECT 
        *
    FROM
        `USER`
    WHERE
        DATEDIFF(updated_time, created_time) = 0
            AND LENGTH(user_password) > 15;

CREATE VIEW `4` AS
    SELECT 
        first_name, second_name
    FROM
        `USER`;
        
CREATE VIEW `5` AS
    SELECT 
        first_name AS `name`, second_name AS surname
    FROM
        `USER`;

CREATE VIEW `6` AS
    SELECT 
        CONCAT(first_name, ' ', second_name) AS initials
    FROM
        `USER`;

CREATE VIEW `7` AS
    SELECT 
        CASE
            WHEN LENGTH(user_password) < 15 THEN 'Password is invalid'
            ELSE 'Password is valid'
        END
    FROM
        `USER`;

CREATE VIEW `8` AS
    SELECT 
        *
    FROM
        `USER`
    LIMIT 3;

CREATE VIEW `9` AS
    SELECT 
        *
    FROM
        (SELECT 
            *
        FROM
            `USER`
        ORDER BY RAND()) x
    LIMIT 5;

CREATE VIEW `10` AS
    SELECT 
        *
    FROM
        `USER`
    WHERE
        first_name = NULL;
        
CREATE VIEW `11` AS
    SELECT 
        *
    FROM
        `USER`
    WHERE
        first_name LIKE 'S%';

CREATE VIEW `12` AS
    SELECT 
        *
    FROM
        `USER`
    ORDER BY first_name;

CREATE VIEW `13` AS
    SELECT 
        *
    FROM
        `USER`
    ORDER BY first_name ASC , second_name DESC;

CREATE VIEW `14` AS
    SELECT 
        first_name
    FROM
        `USER`
    ORDER BY SUBSTR(first_name, - 1, 1);

CREATE VIEW `15` AS
    SELECT 
        favourite_lines
    FROM
        (SELECT 
            favourite_lines,
                CASE
                    WHEN favourite_lines != NULL THEN 1
                    ELSE 0
                END AS is_null
        FROM
            `USER`) AS x
    ORDER BY is_null , favourite_lines;

CREATE VIEW `16` AS
    SELECT 
        first_name, second_name, liked_posts
    FROM
        (SELECT 
            first_name,
                second_name,
                liked_posts,
                CASE
                    WHEN JSON_LENGTH(liked_posts, '$.liked_posts') <= 3 THEN 0
                    WHEN JSON_LENGTH(liked_posts, '$.liked_posts') > 3 THEN 1
                    ELSE NULL
                END AS is_active
        FROM
            `USER`) x
    ORDER BY CASE
        WHEN is_active = 1 THEN first_name
        WHEN is_active = 0 THEN second_name
    END;

CREATE VIEW `17` AS
    SELECT 
        first_name
    FROM
        `USER` 
    UNION ALL SELECT 
        second_name
    FROM
        `USER`;

CREATE VIEW `18` AS
    SELECT 
        first_name, second_name, posts
    FROM
        `USER`
            LEFT OUTER JOIN
        AUTHOR a ON a.user_id = id;

CREATE VIEW `19` AS
    SELECT 
        first_name, second_name, content
    FROM
        `USER` AS u
            LEFT OUTER JOIN
        (SELECT 
            user_id, content
        FROM
            AUTHOR AS a
        LEFT OUTER JOIN POST AS p ON p.author_id = a.author_id) x ON x.user_id = u.id;

CREATE VIEW `20` AS
    SELECT 
        first_name, second_name
    FROM
        (SELECT 
            first_name, second_name, user_id
        FROM
            `USER` AS u
        LEFT OUTER JOIN AUTHOR AS a ON a.user_id = u.id) x
    WHERE
        user_id IS NULL;
        
CREATE VIEW `22` AS
    SELECT 
        first_name, second_name, posts, content
    FROM
        `USER` AS u
            LEFT OUTER JOIN
        AUTHOR AS a ON a.user_id = u.id
            LEFT OUTER JOIN
        POST AS p ON p.author_id = a.author_id;

CREATE VIEW `23` AS
    SELECT 
        SUM(JSON_LENGTH(liked_posts, '$.liked_posts')) AS likes_count,
        SUM(JSON_LENGTH(posts, '$.posts')) AS posts_count
    FROM
        `USER` u,
        AUTHOR a
    WHERE
        a.user_id = u.id;
        
CREATE VIEW `24` AS
    SELECT 
        SUM(JSON_LENGTH(liked_posts, '$.liked_posts')) AS likes_count,
        SUM(JSON_LENGTH(posts, '$.posts')) AS posts_count
    FROM
        `USER` u
            LEFT OUTER JOIN
        AUTHOR a ON a.user_id = u.id;

CREATE VIEW `25` AS
    SELECT 
        a.author_id, posts, content
    FROM
        AUTHOR AS a
            LEFT OUTER JOIN
        POST p ON p.author_id = a.author_id 
    UNION SELECT 
        p.author_id, posts, content
    FROM
        AUTHOR AS a
            RIGHT OUTER JOIN
        POST p ON p.author_id = a.author_id;

CREATE VIEW `26` AS
    SELECT 
        first_name, second_name
    FROM
        (SELECT 
            first_name,
                second_name,
                CASE
                    WHEN posts IS NOT NULL THEN JSON_LENGTH(posts, '$.posts')
                    ELSE 0
                END AS posts_count
        FROM
            (SELECT 
            first_name, second_name, posts
        FROM
            `USER` AS u
        LEFT OUTER JOIN AUTHOR AS a ON a.user_id = u.id) x) y
    WHERE
        posts_count > 2;

CREATE VIEW `27` AS
    SELECT 
        SUBSTR('Pavlo', id, 1)
    FROM
        t10;

CREATE VIEW `28` AS
    SELECT 
        CONCAT(first_name, "'s")
    FROM
        `USER`
    WHERE
        first_name = 'Pavlo';

CREATE VIEW `29` AS
    SELECT 
        REPLACE(email, '@gmail.com', '') AS login
    FROM
        `USER`;

CREATE VIEW `30` AS
    SELECT 
        REGEXP_REPLACE(user_password, '[a-zA-Z+]', '') AS digits,
        REGEXP_REPLACE(user_password, '[0-9+]', '') AS letters
    FROM
        `USER`;

CREATE VIEW `31` AS
    SELECT 
        CONCAT(SUBSTRING(first_name, 1, 1),
                '.',
                SUBSTRING(second_name, 1, 1),
                '.') AS initials
    FROM
        `USER`;

CREATE VIEW `32` AS
    SELECT 
        *
    FROM
        `USER`
    WHERE
        id IN (SELECT 
                digits
            FROM
                (SELECT 
                    SUBSTR('1, 2, 3, 4', id, 1) AS digits
                FROM
                    t10) x
            WHERE
                digits != ',' AND digits != ' ');

CREATE VIEW `33` AS
    SELECT 
        first_name,
        second_name,
        (JSON_LENGTH(liked_posts, '$.liked_posts')) AS min_liked_posts
    FROM
        `USER`;

CREATE VIEW `34` AS
    SELECT 
        COUNT(id) AS table_size
    FROM
        `USER`;

CREATE VIEW `35` AS
    SELECT 
        COUNT(favourite_transport)
    FROM
        `USER`
    WHERE
        favourite_transport IS NOT NULL;

CREATE VIEW `36` AS
    SELECT 
        SUM(JSON_LENGTH(favourite_lines, '$.favourite_lines'))
    FROM
        `USER`;

CREATE VIEW `37` AS
    SELECT 
        DATEDIFF(updated_time, created_time)
    FROM
        `USER`;

CREATE VIEW `38` AS
    SELECT 
        COUNT(someday)
    FROM
        (SELECT 
            DAYOFWEEK(MAKEDATE(2019, id)) AS someday
        FROM
            t365) x
    GROUP BY someday;

CREATE VIEW `39` AS
    SELECT 
        y AS 'leap years'
    FROM
        years
    WHERE
        YEAR(MAKEDATE(y, 366)) = y;

CREATE VIEW `40` AS
    SELECT 
        d AS curr_date,
        LAST_DAY(d) AS last_date,
        DATE_SUB(LAST_DAY(d),
            INTERVAL DAYOFMONTH(LAST_DAY(d)) - 1 DAY) AS first_date
    FROM
        dates;

CREATE VIEW `41` AS
    SELECT 
        MAX(CASE
            WHEN dow = 2 THEN d
        END) AS Monday,
        MAX(CASE
            WHEN dow = 3 THEN d
        END) AS Tuesday,
        MAX(CASE
            WHEN dow = 4 THEN d
        END) AS Wednesday,
        MAX(CASE
            WHEN dow = 5 THEN d
        END) AS Thursday,
        MAX(CASE
            WHEN dow = 6 THEN d
        END) AS Friday,
        MAX(CASE
            WHEN dow = 7 THEN d
        END) AS Saturday,
        MAX(CASE
            WHEN dow = 1 THEN d
        END) AS Sunday
    FROM
        (SELECT 
            WEEKOFYEAR(dates) AS woy,
                DAY(dates) AS d,
                DAYOFWEEK(dates) AS dow
        FROM
            (SELECT 
            MAKEDATE(2019, id) AS dates
        FROM
            t365) y
        WHERE
            MONTH(dates) = 12 AND DAY(dates) <= 31) x
    GROUP BY woy
    ORDER BY woy;
    

SELECT 
    COUNT(CASE
        WHEN MONTH(created_time) = 11 THEN 1
    END) AS November,
    COUNT(CASE
        WHEN MONTH(created_time) = 12 THEN 1
    END) AS December
FROM
    `USER`;

CREATE VIEW `42` AS
    SELECT 
        dates,
        SUM(CASE
            WHEN DATE(dates) = DATE(u.created_time) THEN 1
            ELSE 0
        END) AS new_users
    FROM
        (SELECT 
            MAKEDATE(2019, id) AS dates
        FROM
            t365) AS x,
        `USER` AS u
    WHERE
        MONTH(dates) = 12
    GROUP BY dates;

CREATE VIEW `43` AS
    SELECT 
        *
    FROM
        (SELECT 
            first_name,
                second_name,
                a.created_time AS user_created,
                p.created_time posted
        FROM
            `USER` AS u
        JOIN AUTHOR a ON a.user_id = u.id
        JOIN POST p ON p.author_id = a.author_id) x
    WHERE
        user_created > posted;