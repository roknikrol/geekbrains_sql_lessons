---Создаем таблицы

CREATE TABLE users(
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	birthday DATE,
	home_country_id INT(10) UNSIGNED NOT NULL ,
	home_city_id INT(10) UNSIGNED NOT NULL ,
	email VARCHAR(255),
	phone_num VARCHAR(255),
	profile_pic JSON,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
CREATE TABLE users_logins (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	users_id INT(10) UNSIGNED NOT NULL,
	login VARCHAR(255),
	password VARCHAR(255),
	secret_question_1 VARCHAR(255),
	secret_answer_1 VARCHAR(255),
	secret_question_2 VARCHAR(255),
	secret_answer_2 VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
	
CREATE TABLE hotels (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	hotel_name_eng VARCHAR(255),
	hotel_name_native VARCHAR(255),
	hotel_country_id INT(10) UNSIGNED NOT NULL,
	hotel_city_id INT(10) UNSIGNED NOT NULL,
	hotel_geo_tag  VARCHAR(255),
	hotel_address  VARCHAR(255), 
	hotel_phone_1 VARCHAR(255),
	hotel_phone_2 VARCHAR(255),
	hotel_type_id INT(10) UNSIGNED NOT NULL,
	hotel_stars INT(10),
	legal_entity_id INT(10) UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
CREATE TABLE hotel_logins (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	hotel_id INT(10) UNSIGNED NOT NULL,
	login VARCHAR(255),
	password VARCHAR(255),
	secret_question_1 VARCHAR(255),
	secret_answer_1 VARCHAR(255),
	secret_question_2 VARCHAR(255),
	secret_answer_2 VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
CREATE TABLE hotel_legal_entities (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	hotel_id INT(10) UNSIGNED NOT NULL,
	le_country_id INT(10) UNSIGNED NOT NULL,
	le_city_id INT(10) UNSIGNED NOT NULL,
	local_tax_number VARCHAR(255),
	le_name_eng VARCHAR(255),
	le_name_native VARCHAR(255),
	le_address VARCHAR(255),
	le_entity_type VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
CREATE TABLE hotel_types (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	type_name VARCHAR(255),
	type_description VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
	
CREATE TABLE hotel_rooms (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	hotel_id INT(10) UNSIGNED NOT NULL,
	room_name VARCHAR(255),
	room_type VARCHAR(255),
	beds_count INT(10),
	sep_rooms BOOLEAN,
	own_bath BOOLEAN,
	window_view BOOLEAN,
	breakfast BOOLEAN,
	wifi BOOLEAN,
	kitchen BOOLEAN,
	parking BOOLEAN,
	parking_paid BOOLEAN,
	smoking BOOLEAN,
	restraunt BOOLEAN,
	reception BOOLEAN,
	safe BOOLEAN,
	tv BOOLEAN,
	bath BOOLEAN,
	shower BOOLEAN,
	with_pets BOOLEAN,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )
	
CREATE TABLE hotel_rooms_bookings (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	room_id INT(10) UNSIGNED NOT NULL,
	booked_from DATETIME,
	booked_to DATETIME,
    days_booked INT(10),
	is_booked BOOLEAN,
	users_id INT(10) UNSIGNED NOT NULL,
	residents_count INT(10),
	with_kids BOOLEAN,
	with_pets BOOLEAN,
	booking_comment BLOB,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id) )	


CREATE TABLE regions (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	country_name VARCHAR(255) NOT NULL,
	country_id INT(10) unsigned NOT NULL,
	city_name VARCHAR(255) NOT NULL,
	city_id INT(10) unsigned NOT NULL,
	city_geo_tag VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)


CREATE TABLE reviews (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	users_id INT(10) unsigned NOT NULL,
	hotel_id INT(10) unsigned NOT NULL,
	review_text BLOB,
	review_grade ENUM('1','2','3','4','5'),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id))

CREATE TABLE media_types (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id));
	
CREATE TABLE messages (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	id_from INT(10) unsigned NOT NULL,
	id_to INT(10) unsigned NOT NULL,
	text BLOB,
	delivered BOOLEAN,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id));
	
CREATE TABLE booking_status_types (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	name varchar(255),
	description varchar(255),
	id_to INT(10) unsigned NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id));
	
CREATE TABLE media (
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
	hotel_id INT(10) unsigned NOT NULL,
	room_id INT(10) unsigned NOT NULL,
	media_target ENUM('room','hotel'),
	media_path VARCHAR(255),
	media_description VARCHAR(255),
	media_type ENUM('photo', 'video'),
	media_size INT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id));

