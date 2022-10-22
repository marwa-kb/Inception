FROM alpine:3.15

RUN	apk update \
	&& apk add nginx

ADD nginx.conf /etc/nginx/
COPY ./index.html /usr/share/nginx/html/index.html
 
#EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]