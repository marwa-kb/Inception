FROM alpine:3.15

RUN	apk update \
	&& apk add nginx

RUN mkdir /etc/ssl/private \
	&& chmod 700 /etc/ssl/private \
	&& mkdir -p /var/www/html/


ADD ./certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
ADD ./certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
ADD nginx.conf /etc/nginx/

## tmp ##
COPY ./index.html /var/www/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]