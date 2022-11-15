create database if not exists sushi_test;
use sushi_test;
drop database if exists detail;

CREATE TABLE IF NOT EXISTS product(
	product_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(128) NOT NULL,
	product_type TINYINT(1) UNSIGNED NOT NULL,
	primary key(product_id)
);