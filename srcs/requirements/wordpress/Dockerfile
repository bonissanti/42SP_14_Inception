FROM debian:oldstable

RUN apt-get update
RUN apt-get install -y php \
				wget \
				php-fpm \ 
				php-bcmath \
				php-curl \
				php-imagick \
				php-intl \
				php-json \
				php-mbstring \
				php-mysql \
				php-xml \
				apache2 && rm -rf /var/lib/apt/lists/*

COPY ./tools/install-wp.sh /
RUN chmod a+rwx  /install-wp.sh && bash /install-wp.sh

CMD ["apache2ctl", "-D", "FOREGROUND"]