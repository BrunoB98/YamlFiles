#!/bin/sh

kubectl label node node1 etichetta=sonoEtichetta1
kubectl label node node2 etichetta=sonoEtichetta2
kubectl delete deployment appdb webserver
kubectl delete service appdb webserver
kubectl delete pvc appdb-pv-claim ws-pv-claim
kubectl delete pv local-pv-1 local-pv-2
kubectl apply -f Local-volumes.yml
kubectl apply -f Database-pvc.yml
kubectl apply -f Database-deployment.yml
kubectl apply -f Database-service.yml
kubectl apply -f Webserver-service.yml
kubectl apply -f Webserver-deployment.yml
