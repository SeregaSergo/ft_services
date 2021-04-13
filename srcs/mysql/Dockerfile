FROM alpine:3.11

RUN apk update && apk upgrade && apk add mysql mysql-client openrc

RUN rm -rf /var/cache/apk && \
    mkdir -p /run/mysqld && \
    mkdir /etc/mysql/conf.d
    #chown -R mysql:mysql /var/lib/mysql && \
    #chown -R mysql:mysql /run/mysqld

COPY ./start_script.sh /tmp/start_script.sh
RUN chmod +x /tmp/start_script.sh
COPY ./my.cnf /etc/

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["/tmp/start_script.sh"]