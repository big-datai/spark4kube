#!/bin/bash
# Download jars
cd /root/jars
wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.39/mysql-connector-java-5.1.39.jar

cd /usr/share/
wget http://archive.apache.org/dist/zeppelin/zeppelin-0.7.1/zeppelin-0.7.1-bin-all.tgz
tar -zxvf zeppelin-0.7.1-bin-all.tgz
cd zeppelin-0.7.1-bin-all/conf
cp zeppelin-env.sh.template zeppelin-env.sh
echo 'export MASTER=spark://'$MASTERZ':7077'>>zeppelin-env.sh
echo 'export SPARK_SUBMIT_OPTIONS="--jars /root/jars/mysql-connector-java-5.1.39.jar,/root/jars/aws-java-sdk-1.7.4.jar,/root/jars/hadoop-aws-2.6.0.jar"'>>zeppelin-env.sh
echo 'export ZEPPELIN_NOTEBOOK_STORAGE="org.apache.zeppelin.notebook.repo.VFSNotebookRepo, org.apache.zeppelin.notebook.repo.zeppelinhub.ZeppelinHubRepo"'>>zeppelin-env.sh
echo 'export ZEPPELINHUB_API_ADDRESS="https://www.zeppelinhub.com"'>>zeppelin-env.sh
echo 'export ZEPPELIN_PORT=9999'>>zeppelin-env.sh
echo 'export SPARK_HOME=/usr/share/spark'>>zeppelin-env.sh

cd ../bin/
./zeppelin.sh
