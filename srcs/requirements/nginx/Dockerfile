FROM debian:oldstable

RUN apt-get update && apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	 -keyout /etc/ssl/private/brunrodr.key -out /etc/ssl/certs/brunrodr.crt \
	 -subj "/C=BR/ST=SP/L=São Paulo /O=42SP/OU=Cadet/CN=brunrodr.42.fr" \
	&& rm -rf /var/lib/apt/lists/*


# COPY ./index.html /usr/share/nginx/html/index.html
# RUN chown -R www-data: /var/www/html
# RUN chmod 644 /usr/share/nginx/html/index.html

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod 644 /etc/nginx/conf.d/nginx.conf

# EXPOSE 1027 443
HEALTHCHECK --start-period=1m --interval=1m --retries=3 \
	CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]