#!/bin/sh
unset SPARK_MASTER_PORT
cd /usr/share/spark
bin/spark-class org.apache.spark.deploy.master.Master --ip spark-master.servicediscovery.internal

# TODO: detect master exit
tail -F /usr/share/spark/logs/*
