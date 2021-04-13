rm ~/Library/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.leases
minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

kubectl apply -f ./srcs/kub8s/configmap.yaml
kubectl apply -f ./srcs/kub8s/secret.yaml

docker build -t mysql_img ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

docker build -t wp_img ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wp.yaml

docker build -t pma_img ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/pma.yaml

docker build -t nginx_img ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
