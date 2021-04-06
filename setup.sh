minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube -p minikube docker-env)
kubectl apply -f ./srcs/configmap.yaml
docker build -t nginx_img ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
