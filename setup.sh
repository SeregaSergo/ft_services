minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube -p minikube docker-env)
kubectl apply -f ./srcs/kub8s/configmap.yaml

docker build -t nginx_img ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t wp_img ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wp.yaml