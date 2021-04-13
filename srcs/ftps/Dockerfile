FROM alpine:3.12

RUN apk update && apk upgrade && apk add vsftpd openssl supervisor

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt \
	-subj "/C=RU/ST=Moscow/L=.../O=.../OU=.../CN=.../emailAddress=bswag@student.21-school.ru"
RUN addgroup bswag;
RUN echo -e "bswag\nbswag" | adduser bswag
COPY ./supervisord.conf /etc/

EXPOSE 21
CMD ["supervisord"]