#!/bin/bash

# start_mariadb(){
	service mysql start

	# creating database
	echo "CREATE DATABASE IF NOT EXISTS wp_database;" > init.sql
	echo "CREATE USER 'admin_user'@'%' IDENTIFIED by 'password';" >> init.sql
	echo "GRANT ALL PRIVILEGES ON wp_database. * TO 'admin_user'@'%';" >> init.sql

	# security config (not yet)
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_password';" >> init.sql
	echo "DELETE FROM mysql.user WHERE User='';" >> init.sql
	echo "DROP DATABASE IF EXISTS test;" >> init.sql
	echo "FLUSH PRIVILEGES;" >> init.sql

	mysql < init.sql
	# mysqld
# }

# start_mariadb