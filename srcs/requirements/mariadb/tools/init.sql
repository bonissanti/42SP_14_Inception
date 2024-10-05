CREATE DATABASE IF NOT EXISTS wp_database;
CREATE USER 'admin_user'@'%' IDENTIFIED by 'password';
GRANT ALL PRIVILEGES ON wp_database. * TO 'admin_user'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_password';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
