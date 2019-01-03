#!/usr/bin/env bash

#查看物理cpu个数：
CPU_COUNT=`cat /proc/cpuinfo | grep 'physical id' | uniq | wc -l`

#查看cpu核数：
CPU_CORES=`cat /proc/cpuinfo | grep 'cpu cores' | uniq`

#查看逻辑cpu个数：
CPU_COUNT_LOGIC=`cat /proc/cpuinfo | grep 'processor' | wc -l`


#抓取cpu的总核数
cpu_num=`grep -c 'model name' /proc/cpuinfo`

#抓取当前系统15分钟的平均负载值
load_15=`uptime | awk '{print $12}'`

#计算当前系统单个核心15分钟的平均负载值，结果小于1.0时前面个位数补0。
average_load=`echo "scale=2;a=$load_15/$cpu_num;if(length(a)==scale(a)) print 0;print a" | bc`

#设置系统单个核心15分钟的平均负载的告警值为0.70(即使用超过70%的时候告警)。
load_warn=0.70



#https://www.cnblogs.com/clarke/p/5447321.html




/home/az-user/cdh5/jdk/bin/java
-Dproc_nodemanager -Xmx8192m
-Dhadoop.log.dir=/mnt/resource/.data/logs/yarn
-Dyarn.log.dir=/mnt/resource/.data/logs/yarn
-Dhadoop.log.file=yarn-az-user-nodemanager-zk1.log
-Dyarn.log.file=yarn-az-user-nodemanager-zk1.log
-Dyarn.home.dir=
-Dyarn.id.str=az-user
-Dhadoop.root.logger=INFO,RFA
-Dyarn.root.logger=INFO,RFA
-Dyarn.policy.file=hadoop-policy.xml
-server
-Dhadoop.log.dir=/mnt/resource/.data/logs/yarn
-Dyarn.log.dir=/mnt/resource/.data/logs/yarn
-Dhadoop.log.file=yarn-az-user-nodemanager-zk1.log
-Dyarn.log.file=yarn-az-user-nodemanager-zk1.log
-Dyarn.home.dir=/home/az-user/cdh5/hadoop
-Dhadoop.home.dir=/home/az-user/cdh5/hadoop
-Dhadoop.root.logger=INFO,RFA
-Dyarn.root.logger=INFO,RFA
-classpath
/home/az-user/cdh5/hadoop/etc/hadoop:
/home/az-user/cdh5/hadoop/etc/hadoop:
/home/az-user/cdh5/hadoop/etc/hadoop:
/home/az-user/cdh5/hadoop/share/hadoop/common/lib/*:
/home/az-user/cdh5/hadoop/share/hadoop/common/*:
/home/az-user/cdh5/hadoop/share/hadoop/hdfs:
/home/az-user/cdh5/hadoop/share/hadoop/hdfs/lib/*:
/home/az-user/cdh5/hadoop/share/hadoop/hdfs/*:
/home/az-user/cdh5/hadoop/share/hadoop/yarn/lib/*:
/home/az-user/cdh5/hadoop/share/hadoop/yarn/*:
/home/az-user/cdh5/hadoop/share/hadoop/mapreduce/lib/*:
/home/az-user/cdh5/hadoop/share/hadoop/mapreduce/*:
/home/az-user/cdh5/hadoop/contrib/capacity-scheduler/*.jar:
/home/az-user/cdh5/hadoop/contrib/capacity-scheduler/*.jar:
/home/az-user/cdh5/hadoop/share/hadoop/yarn/*:
/home/az-user/cdh5/hadoop/share/hadoop/yarn/lib/*:
/home/az-user/cdh5/hadoop/etc/hadoop/nm-config/log4j.properties
org.apache.hadoop.yarn.server.nodemanager.NodeManager