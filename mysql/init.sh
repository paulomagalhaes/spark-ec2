wget -O hive-schema-mysql.sql https://s3-us-west-2.amazonaws.com/uberdata-public/hive/scripts/mysql/hive-schema-0.13.0.mysql.sql
echo "Setting up hive metastore"
# install mysql jdbc driver in spark/lib
wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.tar.gz
tar -xzvf mysql-connector-java-5.1.34.tar.gz mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar
#install mysql server 
yum -y install mysql-server
