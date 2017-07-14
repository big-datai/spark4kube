##Distributed Spark on docker in stand alone mode 5 minutes and you have a distibuted cluster running
## Install docker on ubuntu use the script :
https://github.com/2dmitrypavlov/spark4kube/blob/master/ubuntuInstallDocker
## Install docker on Centoes/ aws linux, run this script :
https://github.com/2dmitrypavlov/rabbitmqSparkCassandra/blob/master/dockers/install-docker.sh

# How to take cluster up
Lets start master first, 0.0.0.0 is the master ip so every one can connect using private or public ip, if you want to allow only private ips then just substitude it with a private ip of the master.

* ```docker run -d -p 4040:4040 -p 4041:4041 -p 8080:8080 -p 7077:7077 --ulimit nofile=64000:64000 -v /home/ec2-user/logs:/usr/share/logs -v /home/ec2-user/tmp:/tmp -e MASTER=0.0.0.0 --net=host dpavlov/spark:latest /usr/share/master_ip.sh```

Lets start slaves now, the first one on the same machine(if it is big enough), and run the same command on all host machines that we want to be a part of cluster, note that network must be open between machines

* ```docker run -d -p 4040:4040 -p 4041:4041 -p 8080:8080 -p 7077:7077 --ulimit nofile=64000:64000 -v /home/ec2-user/work:/usr/share/spark/work -v /home/ec2-user/logs:/usr/share/logs -v /home/ec2-user/tmp:/tmp -e SPARK_WORKER_OPTS="-Dspark.worker.cleanup.enabled=true -Dspark.worker.cleanup.interval=3600 -Dspark.worker.cleanup.appDataTtl=20000" -e MASTER=52.202.173.248 --net=host dpavlov/spark:latest /usr/share/slaves_ip.sh```

# Lets take Zeppelin up so we can access it, our cluster and use its computing power from a nice UI.

* ```docker run -d -p 4040:4040 -p 4041:4041 -p 8080:8080 -p 9999:9999 -e MASTERZ=52.202.173.248 --ulimit nofile=64000:64000 -v /home/ec2-user/logs2:/usr/share/zeppelin-0.7.1-bin-all/logs -v /home/ec2-user/tmp2:/tmp --net=host dpavlov/spark:latest /usr/share/zeppelin.sh```

## Build docker if you need changes like spark version (not needed as image is pre build in hub.docker)
https://hub.docker.com/r/dpavlov/spark/
###Build the image localy

docker build -t dpavlov/spark:latest .

### Login to docker hub to push your local changes to your hub.docker.com repo
docker login

docker push dpavlov/spark
