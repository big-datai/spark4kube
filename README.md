#This is a kuberenetes docker image that runs spark and slaves on kube, each instance is a pod.
#Installation instractions:
Kube running instractions. Download kube-deploy, from: https://github.com/kubernetes/kube-deploy.git and install docker on each instance of you linux server.


cd spark4kube 
#Create master instance
kubectl create -f spark-master.yaml 
#Create two services so workers can find the master and you can access the gui
kubectl create -f spark-master-service.yaml
kubectl create -f spark-webui-service.yaml
#Validate that service is available on 
http://$(hostname -i):8080/api/v1/proxy/namespaces/default/services/spark-webui/
#Run slaves, to change number os slaves open spark-slaves.yaml script and change number of pods from 3 to any number.
kubectl create -f spark-slaves.yaml 





#Version update instractions:
To change spark version just go to docker folder and opent Dockerfile -> change 
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz to a new binary pre compiled spark version, and replace all apperance of "spark-2.0.0-bin-hadoop2.7" with the file new name.



