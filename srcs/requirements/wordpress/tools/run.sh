#!/bin/bash

# mkdir -p /var/www/html/
# chown -R www-data: /var/www/html

# wget https://wordpress.org/latest.tar.gz
# tar -xzvf latest.tar.gz
# rm latest.tar.gz

# rm -rf /var/www/html/wordpress
# mv wordpress /var/www/html/

#installing wp-cli
wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#downloading wordpress
wp core download --allow-root --path=/var/www/html

#generating config file
wp --allow-root config create --dbname="$WORDPRESS_DATABASE" --dbuser="$WORDPRESS_USER" \
    --dbpass="$WORDPRESS_PASSWORD" --dbhost="mariadb"

#installing wordpress
wp --allow-root core install --url=brunrodr.42.fr --title="Inception" --admin_user=$WORDPRESS_USER \
    --admin_password=$WORDPRESS_PASSWORD --admin_email=lalala@email.com

exec php-fpm7.4 -F



