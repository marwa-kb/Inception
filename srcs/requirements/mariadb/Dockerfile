FROM alpine:3.15

RUN	apk update \
	&& apk add bash mariadb mariadb-client

WORKDIR /usr

ADD start_mariadb.sh .
#ADD config.sql .

RUN sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

RUN chown -R mysql /var/lib/mysql
RUN chmod 777 /var/lib/mysql

EXPOSE 3306

CMD ["/bin/sh", "start_mariadb.sh"]