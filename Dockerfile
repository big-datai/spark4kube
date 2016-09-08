FROM centos:latest
USER root
WORKDIR /usr/share/
ADD master.sh /usr/share/
ADD slaves.sh /usr/share/
ADD slaves_local.sh /usr/share/
RUN cd /usr/share/
RUN yum update -y
RUN yum install -y vim
RUN yum install -y yum-utils && yum clean all
RUN yum install -y zsh
RUN yum install -y wget
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
RUN tar -zxvf spark-2.0.0-bin-hadoop2.7.tgz
RUN mv spark-2.0.0-bin-hadoop2.7 spark
RUN yum install -y java-1.8.0-openjdk-devel.x86_64
ENV PATH $PATH:/usr/share/spark/bin

# quiet the logging
#RUN sed -i 's/log4j.rootCategory=.*/log4j.rootCategory=WARN, console/' \
#     /usr/share/spark/conf/log4j.properties
