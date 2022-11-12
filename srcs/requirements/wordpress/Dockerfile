FROM alpine:3.15

RUN apk update \
	&& apk add bash zip curl nginx \
	php7 php7-fpm php7-opcache php7-phar \
	php7-iconv php7-gd php7-mysqli php7-curl php7-json

RUN mkdir -p /var/www/localhost/htdocs \
	&& cd /var/www/localhost/htdocs && wget https://wordpress.org/wordpress-6.0.3.zip \
	&& unzip wordpress-6.0.3.zip && rm wordpress-6.0.3.zip \
	&& mv wordpress/* . && rm -rf wordpress \
	&& chmod -R 777 /var/www/localhost/htdocs

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR [ "/var/www/localhost/htdocs/" ]

RUN wp config create --dbname=wordpress --dbuser=mk --dbpass=mdp \
	&& wp config set --add FS_METHOD direct \
	&& wp core install --url=mkhabou.42.fr --title=Welcome --admin_user=mk \
	--admin_password=mdp --admin_email=marwa2000@hotmail.fr

# Make reachable outside the container
RUN sed -i 's/listen = 127.0.0.1/listen = 0.0.0.0/g' /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7 -F"]