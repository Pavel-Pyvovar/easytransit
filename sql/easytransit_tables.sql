CREATE TABLE IF NOT EXISTS `USER`
       (id TINYINT unsigned NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(10) NOT NULL,
        second_name VARCHAR(10) NOT NULL,
        email VARCHAR(20) NOT NULL,
        user_password VARCHAR(20) NOT NULL,
        favourite_stations JSON,
        favourite_lines JSON,
        favourite_transport JSON,
        liked_posts JSON,
        created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS TRANSPORT (
    transport_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    transport_type VARCHAR(10) NOT NULL,
    line_number SMALLINT NOT NULL,
    created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (transport_id)
);

CREATE TABLE IF NOT EXISTS STATIONS
        (station_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
        station_name VARCHAR(20) NOT NULL,
        transport JSON NOT NULL,
        created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (station_id));


CREATE TABLE IF NOT EXISTS AUTHOR
       (author_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
        user_id TINYINT UNSIGNED NOT NULL,
        posts JSON NOT NULL,
        created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (author_id));


CREATE TABLE IF NOT EXISTS POST (
    post_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_id TINYINT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (post_id)
);

INSERT INTO `USER` (first_name, second_name, email, user_password,
                favourite_stations, favourite_lines, favourite_transport,
                liked_posts) VALUES
        ('SMITH',  'CLERK', 'csmith@gmail.com',
         'asdfsdagds23q234',
         '{"favourite_stations": [1, 2, 3]}',
         '{"favourite_lines": [1, 2, 3]}',
         '{"favourite_transport": [1, 2, 3]}',
         '{"liked_posts": [1, 2, 3]}'
        ),
        ('Nataly', 'Jefferson', 'natjef@gmail.com',
        'adfasdfhjyhlui/',
		 '{"favourite_stations": [1, 2, 3, 4]}',
         '{"favourite_lines": [2, 3, 4]}',
         '{"favourite_transport": [1, 2, 3]}',
         '{"liked_posts": [1, 2, 5, 6]}'
        ),
		('Jorge', 'Washington', 'jwash@gmail.com',
        'adfasdfcvbnjfjyhlui/',
		 '{"favourite_stations": [1, 2, 3, 4]}',
         '{"favourite_lines": [2, 3, 4]}',
         '{"favourite_transport": [1, 2, 3]}',
         '{"liked_posts": [1, 2, 5, 6]}'
        ),
		('Sarra', 'Anderson', 'sarraa@gmail.com',
        'adbvmujxzxhkju',
		 '{"favourite_stations": [1, 2, 3, 4]}',
         '{"favourite_lines": [2, 3, 4]}',
         '{"favourite_transport": [5, 6]}',
         '{"liked_posts": [5, 6]}'
        ),
	     ('Margaret', 'Winner', 'marg@gmail.com', 'jp[o;5623464[l,,.;][',
		 '{"favourite_stations": [1, 4]}',
         '{"favourite_lines": [2, 4]}',
         '{"favourite_transport": [5, 6]}',
         '{"liked_posts": [5]}'),
		 ('Jaque', 'Fresco', 'jacfres@gmail.com', 'jp[o;mkoj[l,,.;][',
		 '{"favourite_stations": [1, 2, 3, 4]}',
         '{"favourite_lines": [2, 3, 4]}',
         '{"favourite_transport": [5, 6]}',
         '{"liked_posts": [5, 6]}'),
	     ('Margaret', 'Winner', 'marg@gmail.com', 'jp[o;5623464[l,,.;][',
		 '{"favourite_stations": [1, 4]}',
         '{"favourite_lines": [2, 4]}',
         '{"favourite_transport": [5, 6]}',
         '{"liked_posts": [5]}'),
		 ('Joanna', 'Liberty', 'jliberty@gmail.com', ';oihnnaw3092',
		 '{"favourite_stations": [1]}',
         '{"favourite_lines": [2]}',
         '{"favourite_transport": [5]}',
         '{"liked_posts": [5]}');

INSERT INTO TRANSPORT (transport_type, line_number) VALUES
        ('bus', 46),
        ('bus', 114),
        ('trolleybus', 37),
        ('tram', 33),
        ('tram', 28),
        ('tram', 35),
        ('tram', 22);

INSERT INTO STATIONS (station_name, transport) VALUES
('Chernihivska', '{"transport": [4, 5, 6, 7]}'),
('Livoberezhna', '{"transport": [1]}'),
('Mykoly Zakrevskoho St', '{"transport": [2]}');

INSERT INTO AUTHOR (user_id, posts) VALUES
(1, '{"posts": [1, 2, 3, 4, 5]}'),
(2, '{"posts": [6, 7, 9]}'),
(3, '{"posts": [8, 10]}');

INSERT INTO AUTHOR (user_id, posts) VALUES
(4, '{"posts": [12]}');

INSERT INTO POST (author_id, content) VALUES
(1, 'There have to be shedule update for trolleybus on line 37'),
(1, 'There are heavy traffic jams on line 46 this week'),
(1, 'New trams will appear on line 33 next month'),
(1, 'Next year Kyiv Smart Card will dominate over other payment methods in public transport'),
(1, 'A car crash on line 114 blocks traffic on 19th of November'),
(2, 'A a newbie'),
(2, 'Kyiv could be a wonderful city, if not ...'),
(3, 'Good day'),
(2, 'The transport system is not optimized'),
(3, 'Some text'),
(3, 'The Great New World'),
(4, 'This is a post from a user who is not yet created');

CREATE TABLE t10 (
    id TINYINT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE t100 (
    id TINYINT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE t365 (
    id INT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY (id)
);

alter table t365 auto_increment = 1;

insert into t10 ()values
(), (), (), (), (), (), (), (), (), ();

insert into t100 ()values
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), ();

insert into t365 ()values
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), (),
(), (), (), (), (), (), (), (), (), ();

CREATE TABLE alphabet (
    letter CHAR(1),
    PRIMARY KEY (letter)
);

insert into alphabet () values
('a'), ('b'), ('c'), ('d'), ('e'),
('f'), ('g'), ('h'), ('i'), ('j'),
('k'), ('l'), ('m'), ('n'), ('o'),
('p'), ('q'), ('r'), ('s'), ('t'),
('u'), ('v'), ('w'), ('x'), ('y'), ('z');

CREATE TABLE years (
    y INT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY (y)
);

alter table years AUTO_INCREMENT = 2019;

insert into years ()values
(), (), (), (), (), (), (), (), (), ();

CREATE TABLE dates (
    id INT AUTO_INCREMENT,
    d TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
);

insert into dates (d) values
(date_add(now(), interval 1 month)),
(date_add(now(), interval 3 month)),
(date_add(now(), interval 1 year)),
(date_add(now(), interval 20 week)),
(date_add(now(), interval 754 day));

CREATE TABLE t1 (
    id INT UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY (id)
);

insert into t1 () values
();


