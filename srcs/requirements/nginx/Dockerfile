FROM alpine:3.15

RUN	apk update \
	&& apk add nginx

COPY default /etc/nginx/sites-available/default
 
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]