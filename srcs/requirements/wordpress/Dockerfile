FROM alpine:3.15

RUN apk update \
	&& apk add zip \
########### tmp ###########
	&& apk add nginx mariadb mariadb-client \
###########################
	&& apk add php7 php7-fpm php7-opcache \
	&& apk add php7-gd php7-mysqli php7-curl php7-json
#	&& apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

ADD nginx.conf /etc/nginx

RUN mkdir -p /var/www/localhost/htdocs \
	&& cd /var/www/localhost/htdocs/ && wget https://wordpress.org/latest.zip \
	&& unzip latest.zip && rm latest.zip \
	&& mv wordpress/* . && rm -rf wordpress \
	&& chown -R nginx:www-data /var/www/localhost/htdocs/

EXPOSE 80

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]