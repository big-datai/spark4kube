echo 'c.NotebookApp.ip = '$(hostname -i)>>/root/.jupyter/jupyter_notebook_config.py

PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser" pyspark --packages com.databricks:spark-csv_2.10:1.1.0,com.amazonaws:aws-java-sdk-pom:1.11.37,org.apache.hadoop:hadoop-aws:2.7.0 --master spark://spark-master:7077 >>/root/logs.jupyter &
tail -F >>tail -F /usr/share/spark/logs/*
