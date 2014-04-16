#!/bin/bash

# Clear the screen first to make room
clear 

# ~/.bashrc
echo '############################ ~/.bashrc ###############################################'
awk '/^[^#]/ {print}' ~/.bashrc
echo ''

# /etc/hosts
echo '############################ /etc/hosts ##############################################'
cat /etc/hosts
echo ''

# core-site
echo '############################ core-site.xml ############################'
grep "<name>" $HADOOP_INSTALL/etc/hadoop/core-site.xml; grep "<value>" $HADOOP_INSTALL/etc/hadoop/core-site.xml
echo ''

# hdfs-site
echo '############################ hdfs-site.xml ############################################'
grep "<name>" $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml; grep "<value>" $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml
echo ''

# mapred-site
echo '############################ mapred-site.xml ##########################################'
grep "<name>" $HADOOP_INSTALL/etc/hadoop/mapred-site.xml; grep "<value>" $HADOOP_INSTALL/etc/hadoop/mapred-site.xml
echo ''

# yarn-site
echo '########################### yarn-site.xml ############################################'
grep "<name>" $HADOOP_INSTALL/etc/hadoop/yarn-site.xml; grep "<value>" $HADOOP_INSTALL/etc/hadoop/yarn-site.xml
echo ''

# ~/.ssh/config
echo '###########################  ~/.ssh/config ############################################'
cat ~/.ssh/config
echo ''

# masters y slaves
echo '############################ masters / slaves ################################################'
awk '{print "masters: " $1}' $HADOOP_INSTALL/etc/hadoop/masters
awk '{print "slaves: " $1}' $HADOOP_INSTALL/etc/hadoop/slaves
echo ''
