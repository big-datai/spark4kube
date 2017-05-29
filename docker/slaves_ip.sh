#!/bin/sh

cd /usr/share/spark
cd /usr/local/spark
SPARK_PUBLIC_DNS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) bin/spark-class org.apache.spark.deploy.worker.Worker spark://$MASTER:7077 --webui-port 8081

# TODO: detect slave exit
tail -F /usr/share/spark/logs/*
