FROM centos:latest
MAINTAINER 2dmitrypavlov@gmail.com
USER root
WORKDIR /usr/share/
ADD master.sh /usr/share/
ADD slaves.sh /usr/share/
ADD slaves_local.sh /usr/share/
ADD zeppelin.sh /usr/share/
ADD mykey.key /usr/share/
ADD mycert.pem /usr/share/
ADD jupyter.sh /usr/share/
RUN mkdir /root/.jupyter
ADD jupyter_notebook_config.py /root/.jupyter
RUN cd /usr/share/
RUN chmod 600 mykey.key mycert.pem
RUN export TERM=xterm
RUN yum clean all -y
RUN yum update -y
RUN yum install -y vim
RUN yum install -y yum-utils
RUN yum install -y zsh
RUN yum install -y wget bzip2
RUN yum install openssl.x86_64 -y
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem
RUN wget --quiet https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh
RUN /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh
RUN cd /usr/share/
RUN pwd
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
RUN tar -zxvf spark-2.0.0-bin-hadoop2.7.tgz
RUN mv spark-2.0.0-bin-hadoop2.7 spark
RUN yum install -y java-1.8.0-openjdk-devel.x86_64
ENV PATH $PATH:/usr/share/spark/bin:/opt/conda/bin/

#RUN sh /usr/share/jupyter.sh
# quiet the logging
#RUN sed -i 's/log4j.rootCategory=.*/log4j.rootCategory=WARN, console/' \
#     /usr/share/spark/conf/log4j.properties
