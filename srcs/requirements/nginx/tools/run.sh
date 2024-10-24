#!/bin/bash

envsubst '\$DOMAIN_NAME \${KEY_CERTIFICATE} \${CRT_CERTIFICATE}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/nginx.conf && \
	chmod 644 /etc/nginx/conf.d/nginx.conf

nginx -g 'daemon off;'