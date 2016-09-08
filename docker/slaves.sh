#!/bin/sh

cd /usr/share/spark
cd /usr/local/spark
bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --webui-port 8081

# TODO: detect slave exit
tail -F /usr/share/spark/logs/*
