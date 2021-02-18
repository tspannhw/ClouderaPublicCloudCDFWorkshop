# Overview of Data Flow Details

![Tim](https://raw.githubusercontent.com/tspannhw/tspannhw/main/headshots/mlx90640-2020-01-05-20-52-14.gif)

* https://www.youtube.com/watch?v=lrV-EwD4G8w
* https://www.youtube.com/watch?v=kn6-8f8Vrq8

## Please see slides and some articles.

* https://www.datainmotion.dev/2020/04/streaming-data-with-cloudera-data-flow.html
* https://www.datainmotion.dev/2021/02/ingest-into-cloud.html
* https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html
* https://www.cloudera.com/products/cdf.html
* https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-understand.html

# Lab 0

Setup environment and get your security ready.

* https://docs.cloudera.com/data-hub/cloud/access-clusters/topics/mc-accessing-cluster-via-ssh.html


# Labs 1 and 2

# Lab 1:  CDP Public Cloud Data Flow Overview Exploration

* Explore datahubs
* Explore Cloudera Manager for NiFi cluster, Kafka cluster, OpDB cluster
* Explore HBase UIs
* Explore Hue

# Lab 2:  Lab 2:  Apache NiFi →  Operation Database (Apache HBase)

In this lab you will write data to an Operational Database (HBase Table)

Step 1:   From the OpDB Data Hub, click Hue

Step 2:   Create an HBase table:   Table Name:  'iottest'   Column Family Name:   'iot_details'

Step 3:  Query that table with Hue

Step 4:   You can enter Cloudera Manager and explore HBase UI

Step 5:  Let's access some data.   We will use a synthetic data generator for ease, but we could easily do HDFS/S3, REST API or a database.

Step 6:  Create the data generator.   Add a "Generate Flow File" processor to the screen.

Set the schedule to 5 or 10 seconds.

Set the Custom Text to:

 {"id": "${UUID()}}",
"te": "0.${random():mod(1000):plus(1)}",
"diskusage": "${math("random")}.3 MB",
"memory": ${random():mod(95):plus(10)},
"cpu": ${nextInt()}.${random():mod(99):plus(1)},
"host": "${ip()}}",
"temperature": "${random():mod(60):plus(60)}",
"macaddress": "test",
"end": "${random():mod(1000):plus(1)}",
"systemtime": "${now():format("MM/dd/yyyy HH:mm:ss", "EST")}"}


Feel free to tweak this for your own data differences.

Step 7:   Add an UpdateAttribute processor and connect it from "Generate Flow File".

Step 8:   Add an attribute named "schema.name" and set it to:   iottest


