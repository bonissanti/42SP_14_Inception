#!/bin/bash

service mariadb start

# creating database
mariadb -u root -e \
"CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE; \
CREATE USER '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWORD'; \
GRANT ALL PRIVILEGES ON wp_database.* TO '$WORDPRESS_USER'@'%'; \
FLUSH PRIVILEGES;"
