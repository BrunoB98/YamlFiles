#!/bin/sh

kubectl delete deployment appdb webserver
kubectl delete service appdb webserver
kubectl delete pvc appdb-pv-claim
kubectl delete pv local-pv-1
kubectl delete secret mysql-root-password mysql-config
kubectl apply -f Local-volume.yml
kubectl apply -f PersistentVolumeClaim.yml
kubectl apply -f Database-deployment.yml
kubectl apply -f Services.yml
kubectl apply -f Webserver-deployment.yml
kubectl create secret generic mysql-config --from-literal=password=0000 --from-literal=username=bruno --from-literal=dbname=shoppingBB
kubectl create secret generic mysql-root-password --from-literal=password=root
minikube service webserver --url
