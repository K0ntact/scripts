#!/bin/bash

# Install Java 8
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> ~/.bashrc
source ~/.bashrc

# Install neofetch
sudo apt-get install -y neofetch

# Install Hadoop
HADOOP_URL="https://dlcdn.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz "
wget $HADOOP_URL
HADOOP_FILENAME=$(basename $HADOOP_URL)
mkdir ~/hadoop
tar -zxvf $HADOOP_FILENAME -C ~/
HADOOP_FOLDERNAME=$(tar -tf $HADOOP_FILENAME | head -1 | cut -f1 -d"/" )
mv ~/$HADOOP_FOLDERNAME/* ~/hadoop
rm -r  ~/$HADOOP_FOLDERNAME
mkdir ~/hadoop/hadoop-data
mkdir ~/hadoop/hadoop-data/dfs
mkdir ~/hadoop/hadoop-data/dfs/name
mkdir ~/hadoop/hadoop-data/dfs/data

echo "export HADOOP_HOME=~/hadoop" >> ~/.bashrc
echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> ~/.bashrc
echo "export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin" >> ~/.bashrc
source ~/.bashrc

# Install Spark
SPARK_URL="https://dlcdn.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz"
wget $SPARK_URL
SPARK_FILENAME=$(basename $SPARK_URL)
mkdir ~/spark
tar -zxvf $SPARK_FILENAME -C ~/
SPARK_FOLDERNAME=$(tar -tf $SPARK_FILENAME | head -1 | cut -f1 -d"/" )
mv ~/$SPARK_FOLDERNAME/* ~/spark
rm -r  ~/$SPARK_FOLDERNAME

echo "export SPARK_HOME=~/spark" >> ~/.bashrc
echo "export SPARK_CONF_DIR=$SPARK_HOME/conf" >> ~/.bashrc
source ~/.bashrc