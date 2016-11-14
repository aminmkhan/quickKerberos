#!/bin/bash
# (c) copyright 2016 martin lurie sample code not supported

echo have to import credentials into CM
echo admin -> kerb > import credentials
# pause until the user hits enter
read foo
# for debugging:
# set -x

# load configurations
source ./goKerberos.conf

kinit $kdc_hdfs_user@$kdc_realm
hadoop fs -mkdir /eraseme
hadoop fs -rmdir /eraseme

echo Requested user cloudera is not whitelisted and has id 501, which is below the minimum allowed 1000
echo must kinit prior to using cluster
# Application initialization failed (exitCode=255) with output: Requested user cloudera is not whitelisted
# and has id 501, which is below the minimum allowed 1000

kinit $kdc_standard_user@$kdc_realm
hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar pi 10 10000
