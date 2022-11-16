#!/usr/bin/env bash

#run the setup script to create the DB and the schema in the DB
mysql --defaults-extra-file=/etc/mysql/conf.d/my.cnf -t --show-warnings sushi_test < "/docker-entrypoint-initdb.d/customer.ddl"
mysql --defaults-extra-file=/etc/mysql/conf.d/my.cnf -t --show-warnings sushi_test < "/docker-entrypoint-initdb.d/customer_detail.ddl"
mysql --defaults-extra-file=/etc/mysql/conf.d/my.cnf -t --show-warnings sushi_test < "/docker-entrypoint-initdb.d/product.ddl"
