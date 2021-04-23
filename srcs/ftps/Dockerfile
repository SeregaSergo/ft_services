FROM alpine:3.12

RUN apk update && apk upgrade && apk add vsftpd openssl openrc

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt \
	-subj "/C=RU/ST=Moscow/L=.../O=.../OU=.../CN=.../emailAddress=bswag@student.21-school.ru"

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN adduser -D -h /ftp bswag
RUN echo "bswag:bswag" | chpasswd
RUN touch /etc/vsftpd.user_list
RUN	mkdir -p /var/log/vsftpd
RUN touch /var/log/vsftpd/vsftpd.log

EXPOSE 21 20 30021
VOLUME /ftp

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]