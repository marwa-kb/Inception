FROM alpine:3.15

RUN apk update \
	&& apk add zip \
	&& apk add nginx mariadb mariadb-client \
	&& apk add php7 php7-fpm php7-opcache \
	&& apk add php7-gd php7-mysqli php7-curl php7-json

RUN mkdir /etc/ssl/private \
	&& chmod 700 /etc/ssl/private

ADD ./certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
ADD ./certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
ADD nginx.conf /etc/nginx
ADD config.sql /
ADD start.sh /

RUN mkdir -p /var/www/html/ \
	&& cd /var/www/html && wget https://wordpress.org/latest.zip \
	&& unzip latest.zip && rm latest.zip \
	&& mv wordpress/* . && rm -rf wordpress \
	&& chmod -R 777 /var/www/html

EXPOSE 443

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]