create database if not exists sushi_test;
use sushi_test;
drop table if exists customer_detail;

CREATE TABLE IF NOT EXISTS customer_detail(
	customer_detail_id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
	customer_id         INT NOT NULL,
	product_id          INT NOT NULL,
	volume              INT(12) NOT NULL,
	price               INT(4) NOT NULL,
	is_wasabi           BOOLEAN NOT NULL,
	primary key(customer_detail_id)
);