#!/bin/bash
cd spark4kube  
#Run: sh start-all.sh it should start all the scripts, or as alternative run line by line:  
echo "Create master instance"
kubectl create -f spark-master.yaml   
echo "Create two services so workers can find the master and you can access the gui"  
kubectl create -f spark-master-service.yaml  
kubectl create -f spark-webui-service.yaml  
echo "Validate that service is available on "  
echo $(http://$(hostname -i):8080/api/v1/proxy/namespaces/default/services/spark-webui/)
#Run slaves, to change number os slaves open spark-slaves.yaml script and change number of pods from 3 to any number.  
kubectl create -f spark-slaves.yaml 
#Start zeppelin - it can take a few minutes to download zeppelin
kubectl create -f spark-zeppelin.yaml 
#start zeppelin service
kubectl create -f spark-zeppelin-service.yaml

sleep 15m
./set_zeppelin.sh
