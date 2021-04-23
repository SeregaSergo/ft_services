FROM alpine:3.12

RUN apk update && apk upgrade && \
    apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community

COPY config/grafana.ini /usr/share/grafana/conf/
COPY config/provisioning/dashboards/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY config/provisioning/datasources/influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboards/* /var/lib/grafana/dashboards/

EXPOSE 3000
CMD ["grafana-server", "--config=/usr/share/grafana/conf/grafana.ini", "--homepath", "/usr/share/grafana"]