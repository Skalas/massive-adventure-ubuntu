#!/bin/bash
## Dependencias.
sudo apt-get update
sudo locale-gen es_MX.UTF-8
sudo apt-get install -y openjdk-7-jdk curl wget unzip tar git libcurl4-openssl-dev build-essential python-pip python-dev build-essential libboost-all-dev 
sudo pip install --upgrade pip
sudo pip install awscli
## Substituyo para que el hostname jalara.
DOM_C="127.0.0.1 localhost   localhost.localdomain $HOSTNAME" 
DOM_W="127.0.0.1 localhost"
sudo sed -i "s/$DOM_W/$DOM_C/g" /etc/hosts
## Actualizo java y las librerías.
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-7-openjdk-amd64/bin/java" 2
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-7-openjdk-amd64/bin/javac" 2
echo "0" | sudo update-alternatives --config java
cd /usr/lib/jvm/
sudo rm default-java
sudo ln -s java-7openjdk-amd64 default-java
## Versión 2.7 de hadoop 
cd /tmp/
## Usuario para hadoop.
sudo groupadd hadoop
sudo useradd -ms /bin/bash hduser && sudo usermod -a -G sudo hduser &&  sudo usermod -a -G hadoop hduser
wget http://apache.webxcreen.org/hadoop/common/current/hadoop-2.7.0.tar.gz && \
tar -xzf hadoop-2.7.0.tar.gz && sudo mv hadoop-2.7.0 /usr/local/hadoop  && sudo chown -R hduser:hadoop /usr/local/hadoop
mkdir -p /usr/local/hadoop_store/hdfs/namenode
mkdir -p /usr/local/hadoop_store/hdfs/datanode
sudo chown -R hduser:hadoop /usr/local/hadoop_store/
sudo -u root bash <<EOF 
echo 'hduser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
EOF
## Descarga y descompresión de archivos 
sudo -u hduser bash <<EOF
cat /dev/zero | ssh-keygen -t rsa -P ''
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
echo '
#### Llaves ssh para que se comuniquen 
#HADOOP VARIABLES START
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_INSTALL=/usr/local/hadoop
export PATH=\$PATH:\$HADOOP_INSTALL/bin
export PATH=\$PATH:\$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=\$HADOOP_INSTALL
export HADOOP_COMMON_HOME=\$HADOOP_INSTALL
export HADOOP_HDFS_HOME=\$HADOOP_INSTALL
export YARN_HOME=\$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="-Djava.library.path=\$HADOOP_INSTALL/lib"
#HADOOP VARIABLES END 
' >> /home/hduser/.bashrc
cd /usr/local/hadoop/etc/hadoop
aws s3 cp s3://opi-configs/Hadoop/Hadoop/ . --recursive 
/usr/local/hadoop/bin/hdfs namenode -format
source /home/hduser/.bashrc
/usr/local/hadoop/sbin/start-dfs.sh
/usr/local/hadoop/sbin/start-yarn.sh
EOF
cd /tmp/
wget https://archive.apache.org/dist/hive/stable/apache-hive-1.2.0-bin.tar.gz
tar zxvf apache-hive-1.2.0-bin.tar.gz
sudo mv apache-hive-1.2.0-bin /usr/local/hive
sudo chown -R hduser:hadoop /usr/local/hive/
sudo apt-get install -y postgresql libpostgresql-jdbc-java
sudo ln -s /usr/share/java/postgresql-jdbc4.jar /usr/local/hive/lib/postgresql-jdbc4.jar
sudo -u hduser bash <<EOF
echo '
#HIVE VARIABLES START
export HIVE_HOME=/usr/local/hive
export HIVE_CONF_DIR=\$HIVE_HOME/conf
export PATH=:\$HIVE_HOME/bin:\$PATH
#HIVE VARIABLES END 
' >> /home/hduser/.bashrc
## ahora vamos con HIVE
EOF

sudo -u postgres bash <<EOF
psql -c "create user hiveuser with login password 'hiveuser';"
psql -c "create database metastore;"
EOF

sudo -u hduser bash <<EOF
echo "localhost:*:*:hiveuser:hiveuser" > /home/hduser/.pgpass
chmod 0600 /home/hduser/.pgpass
cd /usr/local/hive/scripts/metastore/upgrade/postgres/
psql -h localhost -d metastore -U hiveuser -f hive-schema-1.2.0.postgres.sql 
psql -h localhost -t -d metastore -U hiveuser -c "select 'grant select, insert,update, delete on \"'  || tablename || '\" to hiveuser;' from pg_tables where tableowner = CURRENT_USER and schemaname = 'public';" > /tmp/file.sql
psql -h localhost -d metastore -U hiveuser -f /tmp/file.sql
source /home/hduser/.bashrc
cd \$HIVE_CONF_DIR
aws s3 cp s3://opi-configs/Hadoop/Hive/ . --recursive 
cd 
hadoop fs -mkdir -p /tmp/scratch
hadoop fs -mkdir -p /user/hive/warehouse
hadoop fs -chmod g+w /user/hive/warehouse
hadoop fs -chown -R hduser:hduser /user/hive
hadoop fs -chmod -R 755 /user/hive
hadoop fs -chmod -R g+w /tmp
hadoop fs -chown -R hduser:hduser /tmp/scratch
hadoop fs -chmod -R 777 /tmp/scratch
EOF

