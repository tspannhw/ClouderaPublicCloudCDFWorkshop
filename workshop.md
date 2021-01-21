# CDP Public Cloud DataFlow - Flow Management - Workshop


# Pre-Lab Setup

* Have your Amazon .pem
* Have CDP Account login
* Have AWS and Azure Accounts
* Have CDP CLI, AWS CLI, Docker, Python3 installed
* Have AWS CLI Automation Access
* Have SSH Client
* Set CDP Workload Password
* Set all CDP credentials and download
* Environments/YourEnv/Clusters Manage Access
* Environments/YourEnv/Synchronize Users/Details

# Per Developer

* Create NiFi Datahub (Light Duty)
* Create Kafka Datahub (Light Duty)

# Or Per 4 Developers

* Create NiFi Datahub (Heavy Duty)
* Create Kafka Datahub (Heavy Duty)

# Build Data Sources

* Build HBase or Hive or Kudu or Impala

* Download HBase Configuration ZIP From OpDb/Cloudera Manager/HBase/Download

* Download Hive configuration ZIP from DE/Cloudera Manager/Hive/Download

Security

* Set Workload password and give permissions to both datahubs.
* Add to User Group
* Add permissions to Ranger

Tables

* Build Tables https://github.com/tspannhw/ClouderaPublicCloudCDFWorkshop/edit/main/script.sh

# Labs

## Lab 1


## References

* https://docs.cloudera.com/cdf-datahub/7.2.1/index.html
* https://docs.cloudera.com/cdf-datahub/7.2.1/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html
* https://docs.cloudera.com/cdf-datahub/7.2.1/nifi-hbase-ingest/topics/cdf-datahub-nifi-hbase-ingest.html
* https://docs.cloudera.com/cdf-datahub/7.2.1/nifi-kudu-ingest/topics/cdf-datahub-nifi-kudu-ingest.html
* https://docs.cloudera.com/cdf-datahub/7.2.1/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-overview.html 
* https://www.datainmotion.dev/2020/04/streaming-data-with-cloudera-data-flow.html
* https://www.datainmotion.dev/2020/07/using-cloudera-data-platform-with-flow.html
