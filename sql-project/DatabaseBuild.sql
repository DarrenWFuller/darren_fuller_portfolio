
----------------------------------------------------------------------------------------------

CREATE TABLE customers
	(customer_id NUMBER (10,0) CONSTRAINT cus_cus_id_nn NOT NULL,
	last_name VARCHAR2 (25) CONSTRAINT cus_last_name_nn NOT NULL,
	first_name VARCHAR2 (25) CONSTRAINT cus_first_name_nn NOT NULL,
	home_phone VARCHAR2 (12) CONSTRAINT cus_home_phone_nn NOT NULL,
	address VARCHAR2 (100) CONSTRAINT cus_address_nn NOT NULL,
	city VARCHAR2 (30) CONSTRAINT cus_city_nn NOT NULL,
	state VARCHAR2 (2) CONSTRAINT cus_state_nn NOT NULL,
	email VARCHAR2 (25),
	cell_phone VARCHAR2 (12));

CREATE TABLE actors
	(actor_id NUMBER (10,0) CONSTRAINT actors_actor_id_nn NOT NULL,
	stage_name VARCHAR2 (40) CONSTRAINT actors_stage_name_nn NOT NULL,
	first_name VARCHAR2 (25) CONSTRAINT actors_first_name_nn NOT NULL,
	last_name VARCHAR2 (25) CONSTRAINT actors_last_name_nn NOT NULL,
	birth_date DATE CONSTRAINT actors_birth_date_nn NOT NULL);

CREATE TABLE movies
	(title_id NUMBER (10,0) CONSTRAINT movies_title_id_nn NOT NULL,
	title VARCHAR2 (60) CONSTRAINT movies_title_nn NOT NULL,
	description VARCHAR2 (400) CONSTRAINT movies_desc_nn NOT NULL,
	rating VARCHAR2 (4),
	category VARCHAR2 (20),
	release_date DATE CONSTRAINT movies_release_date_nn NOT NULL);

CREATE TABLE star_billings
	(actor_id NUMBER (10,0) CONSTRAINT strblngs_actor_id_nn NOT NULL,
	title_id NUMBER (10,0) CONSTRAINT strblngs_title_id_nn NOT NULL,
	"COMMENT" VARCHAR2 (40));

CREATE TABLE media
	(media_id NUMBER (10,0) CONSTRAINT media_media_id_nn NOT NULL,
	format VARCHAR2 (3) CONSTRAINT media_format_nn NOT NULL,
	title_id NUMBER (10,0) CONSTRAINT media_title_id_nn NOT NULL);

CREATE TABLE rental_history
	(media_id NUMBER (10,0) CONSTRAINT renthist_media_id_nn NOT NULL,
	rental_date DATE DEFAULT SYSDATE CONSTRAINT renthist_rental_date_nn NOT NULL,
	customer_id NUMBER (10,0) CONSTRAINT renthist_cus_id_nn NOT NULL,
	return_date DATE);

----------------------------------------------------------------------------------------------

ALTER TABLE customers
	ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);

ALTER TABLE actors
	ADD CONSTRAINT pk_actors PRIMARY KEY (actor_id);

ALTER TABLE movies
	ADD CONSTRAINT pk_movies PRIMARY KEY (title_id);

ALTER TABLE star_billings
	ADD CONSTRAINT pk_star_billings PRIMARY KEY (actor_id, title_id);

ALTER TABLE media
	ADD CONSTRAINT pk_media PRIMARY KEY (media_id);

ALTER TABLE rental_history
	ADD CONSTRAINT pk_rental_history PRIMARY KEY (media_id, rental_date);


ALTER TABLE star_billings
	ADD CONSTRAINT fk_strblngs_actor FOREIGN KEY (actor_id) REFERENCES actors (actor_id) ON DELETE CASCADE;

ALTER TABLE star_billings
	ADD CONSTRAINT fk_strblngs_title FOREIGN KEY (title_id) REFERENCES movies (title_id) ON DELETE CASCADE;

ALTER TABLE media
	ADD CONSTRAINT fk_media_title FOREIGN KEY (title_id) REFERENCES movies (title_id) ON DELETE CASCADE;

ALTER TABLE rental_history
	ADD CONSTRAINT fk_renthist_media FOREIGN KEY (media_id) REFERENCES media (media_id);

ALTER TABLE rental_history
	ADD CONSTRAINT fk_renthist_cus FOREIGN KEY (customer_id) REFERENCES customers (customer_id);


ALTER TABLE movies
	ADD CONSTRAINT chk_movie_rating CHECK (rating IN ('G', 'PG', 'R', 'PG13'));

ALTER TABLE movies
	ADD CONSTRAINT chk_movie_category CHECK (category IN ('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCUMENTARY'));

----------------------------------------------------------------------------------------------

INSERT INTO customers
	(customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES 
	(1, 'Cooksley', 'Trix', '305-654-6006', '59 Prairie Rose Court', 'Hollywood', 'FL', 'tcooksley0@noaa.gov', '772-565-0536');

INSERT INTO customers
	(customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES
	(2, 'Sidebotton', 'Abramo', '304-301-2509', '10860 Judy Lane', 'Charleston', 'WV', 'asidebotton1@hibu.com', '317-297-3458');

INSERT INTO customers
	(customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES
	(3, 'Benninck', 'Fransisco', '502-482-1681', '6970 Continental Road', 'Migrate', 'KY', 'fbenninck2@i2i.jp', '661-215-7739');

INSERT INTO customers
	(customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES
	(4, 'Fardoe', 'Lauren', '754-774-8654', '8 Mesta Junction', 'Pompano Beach', 'FL', 'lfardoe3@mapquest.com', '559-839-9267');

INSERT INTO customers
	(customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES
	(5, 'Slowley', 'Adeline', '801-135-5556', '9 Miller Trail', 'Provo', 'UT', 'aslowley4@umn.edu', '843-712-4813');

INSERT INTO customers
	(customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES
	(6, 'Skillern', 'Karlotte', '203-485-8362', '13478 Crescent Oaks Point', 'New Haven', 'CT', 'kskill@printfriendly.com', '804-821-8862');



INSERT INTO movies
	(title_id, title, description, rating, category, release_date)
VALUES
	(1, 'The Wrecking Crew', 'Estranged half-brothers Jonny and James reunite after their father''s mysterious death. As they search for the truth, buried secrets reveal a conspiracy threatening to tear their family apart.', 'R', 'ACTION', DATE '2026-01-28');

INSERT INTO movies
	(title_id, title, description, rating, category, release_date)
VALUES
	(2, 'Good Fortune', 'A well-meaning but rather inept angel named Gabriel meddles in the lives of a struggling gig worker and a wealthy venture capitalist.', 'R', 'COMEDY', DATE '2025-10-17');

INSERT INTO movies
	(title_id, title, description, rating, category, release_date)
VALUES
	(3, 'Zootopia 2', 'Brave rabbit cop Judy Hopps and her friend, the fox Nick Wilde, team up again to crack a new case, the most perilous and intricate of their careers.', 'PG', 'CHILD', DATE '2025-11-26');

INSERT INTO movies
	(title_id, title, description, rating, category, release_date)
VALUES
	(4, 'The Perfect Neighbor', 'A minor disagreement between neighbors in Florida takes a lethal turn, with police body camera footage and interviews probing the aftermath of the state''s controversial "stand your ground" laws.', 'R', 'DOCUMENTARY', DATE '2025-10-17');

INSERT INTO movies
	(title_id, title, description, rating, category, release_date)
VALUES
	(5, 'The Martian', 'An astronaut becomes stranded on Mars after his team assumes him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive and can survive until a potential rescue.', 'PG13', 'SCIFI', DATE '2015-10-02');

INSERT INTO movies
	(title_id, title, description, rating, category, release_date)
VALUES
	(6, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'R', 'DRAMA', DATE '1972-03-24');



INSERT INTO actors
	(actor_id, stage_name, first_name, last_name, birth_date)
VALUES
	(1, 'Jason Momoa', 'Joseph', 'Momoa', DATE '1979-08-01');

INSERT INTO actors
	(actor_id, stage_name, first_name, last_name, birth_date)
VALUES
	(2, 'Matt Damon', 'Matthew', 'Damon', DATE '1970-10-08');



INSERT INTO star_billings
	(actor_id, title_id, "COMMENT")
VALUES
	(1, 1, 'Good action acting.');

INSERT INTO star_billings
	(actor_id, title_id, "COMMENT")
VALUES
	(2, 5, 'Good scifi acting.');



INSERT INTO media
	(media_id, format, title_id)
VALUES
	(1, 'DVD', 1);

INSERT INTO media
	(media_id, format, title_id)
VALUES
	(2, 'VHS', 1);



INSERT INTO rental_history
	(media_id, rental_date, customer_id, return_date)
VALUES
	(1, DATE '2026-01-30', 1, DATE '2026-02-06');

INSERT INTO rental_history
	(media_id, rental_date, customer_id, return_date)
VALUES
	(2, DEFAULT, 2, NULL);

---------------------------------------------------------------------------------------------

CREATE VIEW title_unavail AS
	SELECT movie_title, media_id
	FROM movies
	JOIN media USING (title_id)
	JOIN rental_history USING (media_id)
	WHERE return_date IS NULL
	ORDER BY rental_date
WITH READ ONLY CONSTRAINT title_unavail_ro;

---------------------------------------------------

CREATE SEQUENCE customer_seq
	START WITH 101
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;

CREATE SEQUENCE title_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;

CREATE SEQUENCE media_seq
	START WITH 92
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;

CREATE SEQUENCE actor_seq
	START WITH 1001
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;

---------------------------------------------------

CREATE INDEX ix_cus_last_name
	ON customers(last_name);

---------------------------------------------------

CREATE SYNONYM TU
	FOR title_unavail;

---------------------------------------------------

