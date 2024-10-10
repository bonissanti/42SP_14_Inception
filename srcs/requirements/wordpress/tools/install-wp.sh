#!/usr/bin

mkdir -p /var/www/html/
chown -R www-data: /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz

mv wordpress /var/www/html/

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i 's/database_name_here/wordpress/' /var/www/html/wordpress/wp-config.php #colocar variavel de ambiente
sed -i 's/username_here/wordpress/' /var/www/html/wordpress/wp-config.php
sed -i 's/password_here/<your-password>/' /var/www/html/wordpress/wp-config.php
sed -i 's/localhost/mariadb/' /var/www/html/wordpress/wp-config.php