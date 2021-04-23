FROM alpine:3.12
RUN apk update && apk upgrade && apk add openrc \
     telegraf --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community

RUN telegraf -sample-config --input-filter cpu:mem --output-filter influxdb > telegraf.conf

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

CMD ["telegraf"]