#!/bin/sh

echo "$(hostname -i) spark-master" >>/etc/hosts
unset SPARK_MASTER_PORT
cd /usr/share/spark
bin/spark-class org.apache.spark.deploy.master.Master --ip spark-master

# TODO: detect master exit
tail -F /usr/share/spark/logs/*
