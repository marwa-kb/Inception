FROM alpine:3.15

RUN	apk update \
	&& apk add bash mariadb mariadb-client

ADD start.sh /
ADD config.sql /

#RUN sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

CMD ["/bin/sh", "start.sh"]