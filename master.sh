#!/bin/sh

# start-master.sh uses SPARK_MATER_PORT and expects it to be an int, not a tcp:// url
export SPARK_MASTER_PORT=${SPARK_MASTER_SERVICE_PORT:-7077}
echo $(hostname -i) spark-master>>/etc/hosts

cd /usr/share/spark
bin/spark-class org.apache.spark.deploy.master.Master --ip spark-master

# TODO: detect master exit
tail -F /usr/share/spark/logs/*
