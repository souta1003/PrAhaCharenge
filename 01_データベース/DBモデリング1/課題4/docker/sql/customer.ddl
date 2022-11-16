create database if not exists sushi_test;
use sushi_test;
drop table if exists customer;

CREATE TABLE IF NOT EXISTS customer(
	customer_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	customer_name VARCHAR(128) NOT NULL,
	tel_number    VARCHAR(20) NOT NULL,
	tel_number_0  VARCHAR(4)  NOT NULL,
	tel_number_1  VARCHAR(4) NOT NULL,
	tel_number_2  VARCHAR(4) NOT NULL,
	is_payment    BOOLEAN NOT NULL,
	total_volume  INT NOT NULL,
	total_price   INT NOT NULL,
	etc           TEXT,
	primary key(customer_id)
);