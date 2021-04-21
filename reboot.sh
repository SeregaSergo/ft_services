#!/usr/bin/env /bin/bash
case "$1" in
    -n) kubectl delete deploy nginx-deployment
        docker build -t nginx_img ./srcs/nginx
        kubectl apply -f ./srcs/nginx/nginx.yaml;;
    -p) kubectl delete deploy pma-deployment
        docker build -t pma_img ./srcs/phpmyadmin
        kubectl apply -f ./srcs/phpmyadmin/pma.yaml;;
    -w) kubectl delete deploy wp-deployment
        docker build -t wp_img ./srcs/wordpress
        kubectl apply -f ./srcs/wordpress/wp.yaml;;
    -f) kubectl delete deploy ftps-deployment
        docker build -t ftps_img ./srcs/ftps
        kubectl apply -f ./srcs/ftps/ftps.yaml;;
esac