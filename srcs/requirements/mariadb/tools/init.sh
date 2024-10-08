#!/bin/bash

service mariadb start

# creating database
mariadb -u root -e \
"CREATE DATABASE IF NOT EXISTS wp_database; \
CREATE USER 'admin_user'@'%' IDENTIFIED BY 'password'; \
GRANT ALL PRIVILEGES ON wp_database.* TO 'admin_user'@'%'; \
FLUSH PRIVILEGES;"