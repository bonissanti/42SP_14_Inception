FROM debian:oldstable

ARG	KEY_CERTIFICATE
ARG CRT_CERTIFICATE

RUN apt-get update && apt-get install -y nginx openssl gettext
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	 -keyout ${KEY_CERTIFICATE} -out ${CRT_CERTIFICATE} \
	 -subj "/C=BR/ST=SP/L=São Paulo /O=42SP/OU=Cadet/CN=brunrodr.42.fr" \
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
COPY ./tools/run.sh /
RUN chmod a+rwx run.sh

CMD ["/run.sh"]