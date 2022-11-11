FROM alpine:3.15

RUN	apk update \
	&& apk add bash mariadb mariadb-client

ADD start.sh /
ADD config.sql /

EXPOSE 3306

CMD ["/bin/sh", "start.sh"]