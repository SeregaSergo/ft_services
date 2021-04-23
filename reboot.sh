#!/usr/bin/env /bin/bash
case "$1" in
    -n) kubectl delete deploy nginx-deployment
        docker build -t nginx_img ./srcs/nginx
        kubectl apply -f ./srcs/nginx/nginx.yaml;;
    -p) kubectl delete deploy pma-deployment
        docker build -t pma_img ./srcs/phpmyadmin
        kubectl apply -f ./srcs/phpmyadmin/pma.yaml;;
    -m) kubectl delete deploy mysql-deployment
        docker build -t mysql_img ./srcs/mysql
        kubectl apply -f ./srcs/mysql/mysql.yaml;;
    -w) kubectl delete deploy wp-deployment
        docker build -t wp_img ./srcs/wordpress
        kubectl apply -f ./srcs/wordpress/wp.yaml;;
    -f) kubectl delete deploy ftps-deployment
        docker build -t ftps_img ./srcs/ftps
        kubectl apply -f ./srcs/ftps/ftps.yaml;;
    -i) kubectl delete deploy inflx-deployment
        docker build -t inflx_img ./srcs/influxdb
        kubectl apply -f ./srcs/influxdb/influxdb.yaml;;
    -t) kubectl delete deploy telegraf-deployment
        docker build -t telegraf_img ./srcs/telegraf
        kubectl apply -f ./srcs/telegraf/telegraf.yaml;;
    -g) kubectl delete deploy grafana-deployment
        docker build -t grafana_img ./srcs/grafana
        kubectl apply -f ./srcs/grafana/grafana.yaml;;
esac