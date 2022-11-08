FROM alpine:3.15

RUN apk update \
	&& apk add zip \
	&& apk add php7 php7-fpm php7-opcache \
	&& apk add php7-gd php7-mysqli php7-curl php7-json

#ADD nginx.conf /etc/nginx
ADD start.sh /
ADD config.sql /
ADD www.conf /etc/php7/php-fpm.d/www.conf

VOLUME [ "/var/www/html" ]

RUN mkdir -p /var/www/html/ \
	&& cd /var/www/html && wget https://wordpress.org/latest.zip \
	&& unzip latest.zip && rm latest.zip \
	&& mv wordpress/* . && rm -rf wordpress \
	&& chmod -R 777 /var/www/html

EXPOSE 9000

CMD ["/bin/sh", "start.sh"]