
echo "Setting up hive metastore"
# install mysql jdbc driver in spark/lib
wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.tar.gz
tar -xzvf mysql-connector-java-5.1.34.tar.gz mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar
#install mysql server 
cp mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar  spark/lib
yum -y install mysql-server
/sbin/chkconfig mysqld on
service mysqld start
SCRIPT="CREATE DATABASE metastore;USE metastore;SOURCE hive-schema-mysql.sql;"
SCRIPT=$SCRIPT"CREATE USER '"$METASTORE_USER"' IDENTIFIED BY '"$METASTORE_PASSWD"';"
SCRIPT=$SCRIPT"REVOKE ALL PRIVILEGES, GRANT OPTION FROM '"$METASTORE_USER"';"
SCRIPT=$SCRIPT"GRANT SELECT,INSERT,UPDATE,DELETE,LOCK TABLES,EXECUTE ON metastore.* TO '"$METASTORE_USER"';"
SCRIPT=$SCRIPT"CREATE USER '"$METASTORE_USER"'@'localhost' IDENTIFIED BY '"$METASTORE_PASSWD"';"
SCRIPT=$SCRIPT"REVOKE ALL PRIVILEGES, GRANT OPTION FROM '"$METASTORE_USER"'@'localhost';"
SCRIPT=$SCRIPT"GRANT SELECT,INSERT,UPDATE,DELETE,LOCK TABLES,EXECUTE ON metastore.* TO '"$METASTORE_USER"'@'localhost';"
SCRIPT=$SCRIPT"FLUSH PRIVILEGES;"
echo $SCRIPT
mysql -u root  -e "$SCRIPT"