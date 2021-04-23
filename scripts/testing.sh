#!/bin/bash

kubectl exec deploy/ftps-deployment -- pkill vsftpd
kubectl exec deploy/inflx-deployment -- pkill influxd
kubectl exec deploy/wp-deployment -- pkill nginx
kubectl exec deploy/wp-deployment -- pkill php-fpm7
kubectl exec deploy/pma-deployment -- pkill php-fpm7
kubectl exec deploy/pma-deployment -- pkill nginx
kubectl exec deploy/mysql-deployment -- pkill /usr/bin/mysqld
kubectl exec deploy/nginx-deployment -- pkill /usr/sbin/sshd
kubectl exec deploy/nginx-deployment -- pkill nginx
kubectl exec deploy/telegraf-deployment -- pkill telegraf
kubectl exec deploy/grafana-deployment -- pkill grafana-server