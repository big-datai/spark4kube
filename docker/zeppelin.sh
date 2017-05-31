#!/bin/bash
#This script downloads latest zeppelin, installs and configures it to local spark://spark-master:7077
wget http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar
wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.1/hadoop-aws-2.7.1.jar
wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.6.0/hadoop-aws-2.6.0.jar
wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.39/mysql-connector-java-5.1.39.jar
wget https://github.com/s3tools/s3cmd/archive/master.zip

wget http://apache-mirror.rbc.ru/pub/apache/zeppelin/zeppelin-0.7.1/zeppelin-0.7.1-bin-all.tgz
tar -zxvf zeppelin-0.7.1-bin-all.tgz
cd zeppelin-0.7.1-bin-all/conf
cp zeppelin-env.sh.template zeppelin-env.sh
echo 'export MASTER=spark://'$MASTERZ':7077'>>zeppelin-env.sh
echo 'export SPARK_SUBMIT_OPTIONS="--jars /usr/share/mysql-connector-java-5.1.39.jar,/usr/share/aws-java-sdk-1.7.4.jar,/usr/share/hadoop-aws-2.6.0.jar"'>>zeppelin-env.sh
#echo 'export ZEPPELIN_NOTEBOOK_STORAGE="org.apache.zeppelin.notebook.repo.VFSNotebookRepo, org.apache.zeppelin.notebook.repo.zeppelinhub.ZeppelinHubRepo"'>>zeppelin-env.sh
#echo 'export ZEPPELINHUB_API_ADDRESS="https://www.zeppelinhub.com"'>>zeppelin-env.sh
echo 'export ZEPPELIN_PORT=9995'>>zeppelin-env.sh
cd ../bin/
./zeppelin-daemon.sh start

tail -F /usr/share/zeppelin-0.7.1-bin-all/logs*
