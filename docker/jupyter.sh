#!/bin/sh


echo 'c.NotebookApp.ip = "'"$(hostname -i)"'"'>>/root/.jupyter/jupyter_notebook_config.py
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser" pyspark --packages com.databricks:spark-csv_2.10:1.1.0,com.amazonaws:aws-java-sdk:1.7.4,org.apache.hadoop:hadoop-aws:2.7.1 --master spark://spark-master:7077 &
tail -F /usr/share/spark/logs/*
