# FROM debian:oldstable

# ARG WORDPRESS_DATABASE
# ARG WORDPRESS_USER
# ARG WORDPRESS_PASSWORD

# RUN apt-get update -y && \
#     apt-get upgrade -y && \
#     apt-get install mariadb-server -y

# RUN mkdir -p /var/run/mysqld && \
#     chown -R mysql:mysql /var/run/mysqld && \
#     chmod 777 /var/run/mysqld

# COPY conf/my.cnf /etc/mysql/my.cnf
# COPY tools/db_init.sh /tmp/db_init.sh

# RUN chmod 777 /tmp/db_init.sh && bash /tmp/db_init.sh

# CMD ["mysqld_safe"]

FROM debian:bullseye

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

RUN apt update && apt-get install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

COPY ./tools/init.sh /
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
RUN  chmod a+rwx /init.sh && bash /init.sh 

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld_safe"]