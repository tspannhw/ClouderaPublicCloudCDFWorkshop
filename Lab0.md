## Lab 0 - Environment Setup By Operations Team Before Workshop

Setup environment and get your security ready.

Step 1:  Make sure there are 3 data hubs created and you have permissions to access.   These are:   Flow Management, Operational Database and Streams Messaging.

Step 2:  Set up a machine user for NiFi to use to login to Schema Registry, Kafka, HBase, ...   You can create a group, many users or one user for all these different services.

Step 3:  Set a workload password for each one and your own account.

![Workload Password(https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/Envsetworkloadpassword.png)

Step 4:  Synchronize users

Step 5:  Make sure you have Ranger Permissions, if not add Ranger permissions for NiFi, NiFi Registry, Kafka, HBase, Schema Registry.

[https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-ranger.html](https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-ranger.html)

Step 6:  Download HBase Configuration Files

https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-connection-details.html

Step 7:  SCP Copy Your hbase-site.xml and core-site.xml to your 3+ NiFi servers /tmp directories.

Step 8:  SSH Login to your 3+ NiFi servers and change permissiosn on those files:   chmod 755 tmp/*-site.xml.

### Reference

* https://docs.cloudera.com/data-hub/cloud/access-clusters/topics/mc-accessing-cluster-via-ssh.html
