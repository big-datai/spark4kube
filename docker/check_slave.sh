#!/bin/bash
#This script monitores disconnection of slave from master and kills slave if it is disconnected so 
# a new slave started
while (true)
do
line=$(tail -n 1 /usr/share/logs/spark_log.log)
#echo $line
if [[ $line == *"Connection to master failed"* ]]; then
  echo "Connection to master failed"
  kill -9 $(jps -l|grep Worker|awk '{print $1}')
fi

sleep 10
#echo "Connected"
done
