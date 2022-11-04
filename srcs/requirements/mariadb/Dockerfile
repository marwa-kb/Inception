FROM alpine:3.15

#VOLUME /home/mkhabou/data/mariadb
#VOLUME /var/lib/mysql

RUN	apk update \
	&& apk add mariadb mariadb-client

ADD config.sh /

EXPOSE 3306

CMD ["/bin/sh", "config.sh"]