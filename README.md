# ClouderaPublicCloudCDFWorkshop

Cloudera Public Cloud CDF Workshop - AWS or Azure

# NiFi - Kafka Data Hubs Tutorial



# See 
https://docs.cloudera.com/cdf-datahub/7.2.2/index.html

# See also 
https://github.com/tspannhw/ClouderaFlowManagementWorkshop

# See also 
https://github.com/cloudera-labs/edge2ai-workshop

# See also 
https://github.com/tspannhw/ClouderaStreamingAnalyticsSQLWorkshop

## Workshop

# General Cloud Activities

* Create Hbase table - See SSH
* Create Hive table - Apache Hue (From DWH)
* Create Kudu table - Apache Hue (From DWH)
* Create schema in Schema Registry(From Kafka DH)


# NiFi Focused

* NiFi Ingest Kafka https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-kafka-ingest/topics/cdf-datahub-fm-kafka-ingest-overview.html
* NiFi Ingest Hive https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html
* NiFi Ingest HBase https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-hbase-ingest/topics/cdf-datahub-nifi-hbase-ingest.html
* NiFi Ingest Kudu https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-kudu-ingest/topics/cdf-datahub-nifi-kudu-ingest.html
* NiFi Ingest S3 https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-overview.html
* NiFi Ingest ADLS https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-azure-ingest/topics/cdf-datahub-fm-adls-ingest-overview.html

# Kafka

* Kafka Latency & Monitoring https://github.com/asdaraujo/cdp-examples

# Flink SQL

* https://docs.cloudera.com/csa/1.2.0/sql-client/topics/csa-sql-client-config.html
* https://github.com/cloudera/flink-tutorials/tree/master/flink-sql-tutorial

# Initial Setup

* https://docs.cloudera.com/data-hub/cloud/access-clusters/topics/mc-accessing-cluster-via-ssh.html

# HBase Connectivity

* Download Configuration Files
* SCP Configuration Files
* Use Configuration Files in NiFi /etc/hadoop/conf.cloudera.core_settings/core-site.xml,/tmp/hbase-site.xml

# Kafka Connectivity

* Get brokers (multiple) from hardware tab of Kafka Data Hub, they use port 9093 and are SSL.

# Hive Connectivity

* thrift://HIVEServerNameVeryLong.cloudera.site:9083
* Download Configuration Files
* SCP Configuration Files
* Use Configuration Files in NiFi /tmp/hive-site.xml,/tmp/core-site.xml,/tmp/hdfs-site.xml

# Security Credentials Location

* /var/lib/nifi/cm-auto-host_keystore.jks

* /var/lib/nifi/cm-auto-in_cluster_truststore.jks

* the keystore password can be found in this file, on a DH node: /var/lib/cloudera-scm-agent/agent-cert/cm-auto-host_key.pw

* the truststore password can be found by calling this API: https://[your_cm_host]/api/v40/certs/truststorePassword


# Example SSH Connection

ssh -i MySSHPemIsAwesome.pem cloudbreak@3.82.183.16

# Example NiFi CDP CDF Azure Application

https://github.com/tspannhw/cdp-datahub-azure-nifikafka

# Resources

* https://community.cloudera.com/t5/Community-Articles/How-to-configure-NiFi-S2S-from-local-machine-to-CDP-Public/ta-p/301235
* https://github.com/tspannhw/airline-sentiment-streaming



