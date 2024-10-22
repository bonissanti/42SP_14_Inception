FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt-get update && \
    apt-get install -y php \
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
                       && rm -rf /var/lib/apt/lists/*

COPY ./tools/run.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x /run.sh \
    && mkdir -p /run/php

RUN chown -R www-data:www-data /var/www/html \
    && chmod 755 /var/www/html

ENTRYPOINT ["/run.sh"]
