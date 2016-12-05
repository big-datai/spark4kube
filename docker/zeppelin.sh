#!/bin/bash
#This script downloads latest zeppelin, installs and configures it to local spark://spark-master:7077

wget http://www-eu.apache.org/dist/zeppelin/zeppelin-0.6.2/zeppelin-0.6.2-bin-all.tgz
tar -zxvf zeppelin-0.6.2-bin-all.tgz
cd zeppelin-0.6.2-bin-all/conf
cp zeppelin-env.sh.template zeppelin-env.sh
echo 'export MASTER=spark://spark-master:7077'>>zeppelin-env.sh
#echo 'export ZEPPELIN_NOTEBOOK_STORAGE="org.apache.zeppelin.notebook.repo.VFSNotebookRepo, org.apache.zeppelin.notebook.repo.zeppelinhub.ZeppelinHubRepo"'>>zeppelin-env.sh
#echo 'export ZEPPELINHUB_API_ADDRESS="https://www.zeppelinhub.com"'>>zeppelin-env.sh
echo 'export ZEPPELIN_PORT=9995'>>zeppelin-env.sh
cd ../bin/
./zeppelin-daemon.sh start

tail -F /usr/share/spark/logs/*
