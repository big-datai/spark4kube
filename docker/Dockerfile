FROM centos:latest
MAINTAINER 2dmitrypavlov@gmail.com
USER root
WORKDIR /usr/share/
COPY RedshiftJDBC4-1.1.17.1017.jar RedshiftJDBC4-1.1.17.1017.jar ojdbc7.jar log4j.properties jupyter.sh zeppelin.sh mykey.key mycert.pem master_ip.sh master.sh slaves.sh slaves_ip.sh master_dns.sh slaves_dns.sh .bashrc oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm /usr/share/
ENV PATH $PATH:/usr/share/spark/bin

#RUN mkdir /root/.jupyter
#ADD jupyter_notebook_config.py /root/.jupyter
#RUN chmod 600 mykey.key mycert.pem
RUN mkdir /root/jars/ \
&& mv /usr/share/*jar  /root/jars/  \
&& export TERM=xterm \
&& yum install -y libaio.x86_64 \
&& yum clean all -y \
 && yum update -y \
 && yum install -y vim \
 && yum install -y bind-utils \
 && yum install -y yum-utils \
 && yum install -y zsh \
 && yum install -y wget \
 && yum install -y bzip2 \
 && yum install -y git \
 && yum install -y java-1.8.0-openjdk-devel.x86_64\
 && yum install -y openssl.x86_64
#RUN wget https://github.com/s3tools/s3cmd/archive/master.zip
#RUN wget https://s3.amazonaws.com/cxa-redshift-dev/spark_jars/sandbox-all.jar
#RUN wget http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar
#RUN wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.1/hadoop-aws-2.7.1.jar
#RUN wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.6.0/hadoop-aws-2.6.0.jar
#RUN wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.39/mysql-connector-java-5.1.39.jar
#RUN wget http://central.maven.org/maven2/com/databricks/spark-redshift_2.11/2.0.1/spark-redshift_2.11-2.0.1.jar
#RUN wget http://central.maven.org/maven2/org/postgresql/postgresql/9.4-1201-jdbc41/postgresql-9.4-1201-jdbc41.jar
#RUN wget http://central.maven.org/maven2/com/eclipsesource/minimal-json/minimal-json/0.9.4/minimal-json-0.9.4.jar
# Enable to use jupyter notebook
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem
#RUN wget --quiet https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh
#RUN /bin/bash ~/anaconda.sh -b -p /opt/conda && \
#    rm ~/anaconda.sh
#RUN cd /usr/share/
#RUN rpm -ivh oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
#RUN rpm -ivh oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm
RUN wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz\
&& tar -zxvf spark-2.1.1-bin-hadoop2.7.tgz \
&& mv spark-2.1.1-bin-hadoop2.7 spark \
&& yum install net-tools -y \
&& mv log4j.properties /usr/share/spark/conf/

#:/opt/conda/bin/

#RUN mv *.jar /root/jars/
#RUN rm -rf *tgz
#RUN wget http://central.maven.org/maven2/org/postgresql/postgresql/9.4-1201-jdbc41/postgresql-9.4-1201-jdbc41.jar
# Uncomment for adding jars, so disk will not explode of multiple jars copied, usually build one uber jar 
# like in the example
#ADD spark-defaults.conf /usr/share/spark/conf/
# Enable for using python and ML on it
#RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
#RUN python get-pip.py
#RUN pip install numpy
#RUN pip install scipy
#RUN pip install scikit-learn
#RUN pip install pandas
