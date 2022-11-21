FROM alpine:3.15

RUN apk update \
	&& apk add bash zip curl mariadb-client \
	php7 php7-fpm php7-opcache php7-phar \
	php7-iconv php7-gd php7-mysqli php7-curl php7-json

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/listen = 127.0.0.1/listen = 0.0.0.0/g' /etc/php7/php-fpm.d/www.conf

ADD start_wordpress.sh /

WORKDIR /var/www/localhost/htdocs/

EXPOSE 9000

CMD ["/bin/bash", "/start_wordpress.sh"]