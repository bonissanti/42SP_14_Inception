FROM debian:oldstable

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

RUN apt update -y && apt upgrade -y && apt-get install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

COPY ./tools/init.sh /
COPY ./conf/my.cnf /etc/mysql/my.cnf
RUN  chmod a+rwx /init.sh && bash /init.sh 

CMD ["mysqld_safe"]