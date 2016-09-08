This is a kuberenetes docker image that runs spark and slaves on kube, each instance is a pod.
Installation instractions:
Kube running instractions. Download kube-deploy, from: https://github.com/kubernetes/kube-deploy.git and install docker on each instance of you linux server.


cd spark4kube 
#Create master instance
kubectl create -f spark-master.yaml 
#Create two services so workers can find the master and you can access the gui
kubectl create -f spark-master-service.yaml
kubectl create -f spark-webui-service.yaml
#Validate that service is available on 
#http://<your ip>:8080/api/v1/proxy/namespaces/default/services/spark-webui/
#Run slaves to change number os slaves open this script and change it from 3 to any number.
kubectl create -f spark-slaves.yaml 





Version update instractions:



