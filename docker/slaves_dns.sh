#!/bin/sh

cd /usr/share/spark
bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master.servicediscovery.internal:7077 --webui-port 8081

# TODO: detect slave exit
tail -F /usr/share/spark/logs/*
