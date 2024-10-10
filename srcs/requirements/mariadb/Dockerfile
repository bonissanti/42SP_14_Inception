FROM debian:oldstable

RUN apt update && apt-get install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

EXPOSE 3306
COPY ./tools/init.sh /
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
RUN  chmod a+rwx /init.sh && bash /init.sh

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld_safe"]