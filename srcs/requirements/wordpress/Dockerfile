FROM alpine:3.15

RUN apk update \
	&& apk add bash zip nginx \
	&& apk add php7 php7-fpm php7-opcache \
	&& apk add php7-gd php7-mysqli php7-curl php7-json

RUN mkdir -p /var/www/localhost/htdocs \
	&& cd /var/www/localhost/htdocs && wget https://wordpress.org/wordpress-6.0.3.zip \
	&& unzip wordpress-6.0.3.zip && rm wordpress-6.0.3.zip \
	&& mv wordpress/* . && rm -rf wordpress \
	&& chmod -R 777 /var/www/localhost/htdocs

# Make reachable outside the container
RUN sed -i 's/listen = 127.0.0.1/listen = 0.0.0.0/g' /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7 -F"]