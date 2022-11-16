create database if not exists sushi_test;
use sushi_test;
drop table if exists product;

CREATE TABLE IF NOT EXISTS product(
	product_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(128) NOT NULL,
	product_price INT UNSIGNED NOT NULL,
	product_type TINYINT UNSIGNED NOT NULL,
	primary key(product_id)
);