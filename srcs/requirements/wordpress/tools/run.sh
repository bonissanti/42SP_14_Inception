#!/bin/bash

#installing wp-cli
wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#downloading wordpress
wp core download --allow-root --path=/var/www/html

#generating config file
rm -rf wordpress
wp --allow-root config create --dbname="$WORDPRESS_DATABASE" --dbuser="$WORDPRESS_USER" \
    --dbpass="$WORDPRESS_PASSWORD" --dbhost="mariadb"

#installing wordpress
wp --allow-root core install --url=brunrodr.42.fr --title="Inception" --admin_user=$WORDPRESS_USER \
    --admin_password=$WORDPRESS_PASSWORD --admin_email=lalala@email.com

# Second user (non admin)
wp --allow-root user create second_user second_user@email.com --role=editor --user_pass=$WORDPRESS_SECOND_USER_PWD

exec php-fpm7.4 -F



