#!/bin/bash

mkdir -p /var/www/html/
chown -R www-data: /var/www/html

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz

rm -rf /var/www/html/wordpress
mv wordpress /var/www/html/
