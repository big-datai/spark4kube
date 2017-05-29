#!/bin/sh

echo "$(hostname -i) spark-master" >>/etc/hosts
unset SPARK_MASTER_PORT
cd /usr/share/spark
SPARK_PUBLIC_DNS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) bin/spark-class org.apache.spark.deploy.master.Master --ip $MASTER

# TODO: detect master exit
tail -F /usr/share/spark/logs/*
