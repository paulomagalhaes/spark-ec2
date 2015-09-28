pushd /root > /dev/null
wget https://s3-us-west-2.amazonaws.com/uberdata-public/nutch/apache-nutch-1.10-bin.tar.gz
echo "Unpacking Nutch"
tar xvzf apache-nutch-*.tar.gz > /tmp/nutch_spark.log
rm apache-nutch-*.tar.gz
mv apache-nutch-* nutch
cp ephemeral-hdfs/conf/* nutch/conf
popd > /dev/null