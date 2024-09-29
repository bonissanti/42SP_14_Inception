#Setting the image && installing in your machine
FROM nginx:latest
# RUN	apt-get update && apt-get install -y nginx 

#Copying files from container to local & restricting permissions
COPY ./index.html /usr/share/nginx/html/index.html
RUN chmod 644 /usr/share/nginx/html/index.html

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod 644 /etc/nginx/conf.d

#SSL certificates
RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#Some container configurations
EXPOSE 80 443
HEALTHCHECK --start-period=1m --interval=1m --retries=3 \
	CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]