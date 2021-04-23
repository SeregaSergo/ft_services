FROM alpine:3.12

RUN apk update && apk upgrade && apk add influxdb openrc

VOLUME /var/lib/influxdb

EXPOSE 8086
CMD ["influxd"]