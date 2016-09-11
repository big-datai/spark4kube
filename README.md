#This is a kuberenetes docker image that runs spark and slaves on kube, each instance is a pod.
##Installation instractions:
Download kube-deploy: 
1. git clone https://github.com/kubernetes/kube-deploy.git
2. Install docker on each instance of you linux server, make sure it is the same version of docker and it is the same version kubernetes was tested on to avoid strange issues.
3. Download spark4kube: git clone https://github.com/2dmitrypavlov/spark4kube.git
4. cd kube-deploy
5. Run ./master.sh or follow kube-deploy instractions to start kubernetes, after a minute make sure it is running, by going to dashboard or running kubectl get svc/pods.
6. cd spark4kube 
7. Run: sh README.md it should start all the scripts, or as alternative run line by line:
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



