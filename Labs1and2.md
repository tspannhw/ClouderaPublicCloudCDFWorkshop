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

# Lab 0 - Environment Setup By Operations Team Before Workshop

Setup environment and get your security ready.

Step 1:  Make sure there are 3 data hubs created and you have permissions to access.   These are:   Flow Management, Operational Database and Streams Messaging.

Step 1:  Set up a machine user for NiFi to use to login to Schema Registry, Kafka, HBase, ...   You can create a group, many users or one user for all these different services.

Step 1:  Set a workload password for each one and your own account.

Step 1:  Synchronize users

Step 1:  Make sure you have Ranger Permissions, if not add Ranger permissions for NiFi, NiFi Registry, Kafka, HBase, Schema Registry.

https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-ranger.html

Step 3:  Download HBase Configuration Files

https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-connection-details.html

Step 4:  SCP Copy Your hbase-site.xml and core-site.xml to your 3+ NiFi servers /tmp directories.

Step 5:  SSH Login to your 3+ NiFi servers and change permissiosn on those files:   chmod 755 tmp/*-site.xml.

## Reference

* https://docs.cloudera.com/data-hub/cloud/access-clusters/topics/mc-accessing-cluster-via-ssh.html


# Labs 1 and 2 - Developers


# Lab 1:  CDP Public Cloud Data Flow Overview Exploration

* Explore CDP Data Hubs
* Explore Cloudera Manager for NiFi cluster, Kafka cluster, OpDB cluster
* Explore HBase UIs
* Explore Hue

# Lab 2:  Lab 2:  Apache NiFi →  Operation Database (Apache HBase)

In this lab you will write data to an Operational Database (HBase Table)

## Reference:   https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-table.html

Step 1:  From the OpDB Data Hub, click Hue

Step 2:  Create an HBase table:   Table Name:  'iottest'   Column Family Name:   'iot_details'

Step 3:  Query that table with Hue

Step 4:  You can enter Cloudera Manager and explore HBase UI

Step 5:  Let's access some data.   We will use a synthetic data generator for ease, but we could easily do HDFS/S3, REST API or a database.

Step 6:  From the Flow Management Data Hub, Click the link for NiFi.

https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-build.html


Step 7:  Create the data generator.   Add a "Generate Flow File" processor to the screen.

Set the schedule to 5 or 10 seconds.

Set the Custom Text to:

```
 {"id": "${UUID()}",
"te": "0.${random():mod(1000):plus(1)}",
"diskusage": "${math("random")}.3 MB",
"memory": ${random():mod(95):plus(10)},
"cpu": ${nextInt()}.${random():mod(99):plus(1)},
"host": "${ip()}",
"temperature": "${random():mod(60):plus(60)}",
"macaddress": "test",
"end": "${random():mod(1000):plus(1)}",
"systemtime": "${now():format("MM/dd/yyyy HH:mm:ss", "EST")}"}
```

Feel free to tweak this for your own data differences.

Step 7:  Add an UpdateAttribute processor and connect it from "Generate Flow File".

Step 8:  Add an attribute named "schema.name" and set it to:   iottest

Step 9:  From the Streams Messaging Data Hub, Click Schema Registry

Step 10:  Click the White Plug in Green Hexagon to add a new schema

Step 11:  Copy the schema text from here:   https://github.com/tspannhw/ClouderaPublicCloudCDFWorkshop/blob/main/iottest.avsc

Step 12:  Name the schema:  iottest and make it Backward compatible

Step 14:  Now that we have a schema we can use it for Filtering and Routing with a "Query Record Processor"

Step 15:  Create a JsonTreeReader as the reader and an AvroRecordSetWriter for writer.

Step 16:  Click into JsonTreeReader and set "Schema Access Strategy" to Use "Schema Name" property and create new controller service for "HortonworksSchemaRegistry".   Click Apply.   

Step 17:  From Controller Services, click configure icon for HortonworksSchemaRegistry.  You will need to get the URL from the registry from the datahub.

Step 18:  You can find the hostname on the Streams Messaging cluster overview page when selecting the Hardware tab.

Reference:    https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-kafka-ingest/topics/cdf-datahub-fm-kafka-ingest-create-cs.html

Step 19:  Example URL:   https://messaging-cluster-1-registry0.gvettica.xcu2-8y8x.dev.cldr.work:7790/api/v1  Please note make sure you lead with https:// and end with :7790/api/v1.

Step 20:  For SSL Context Service, choose the existing one usually named "New NiFi SSL Context Service".

Step 21:  Use the Service Account (or your own user name, such as "tspann") in the Kerberos Principal field.   This account needs permission in Ranger.

Step 22:  Use the Workload Password that you set for that Machine Account or your personal account in the Kerberos Password field.   Then click Apply.

Step 23:  For your AvroWriter, set "Schema Write Strategy" to "HWX Content-Encoded Schema Reference".

Step 24:  Set "Schema Access Strategy" to "Use 'Schema Name' Property.

Step 25:  Set "Schema Registry" to your existing Schema Registry from the drop down.

Step 26:  Start your schema registry by clicking the lightning bolt and enabling.   Enable the services also for your readers and writers.

Step 27:  Add an attribute tohbase and enter SELECT * FROM FLOWFILE as your query.  We can change that later and add things like WHERE memory > 10

Step 28:  Add a PutHBaseRecord processor on the screen and connect it from the tohbase query from the previous processor.

Step 29:  Create an AvroReader for the RecordReader.

Step 30:  Create an HBase_2_ClientService for HBase Client Service.

Step 31:  Set the "Table Name" to 'iottest'   

Step 32:  Set "Row Identifier Field Name" to 'id'

Step 33:  Set "Column Family" to 'iot_details'

Step 34:  Set "Batch Size" to 1000 (or more if you wish)

Step 35:  Click into Record Reader -> that will bring you into Controller Services.

Step 36:  Edit SchemaAwareAvroReader and set "Schema Access Strategy" to "HWX Content-Encoded Schema Reference" and Schema Registry to your existing Schema Registry then click Ok.    Start this reader with the lighting bolt.

Step 37:  Click into HBase Client Service, set Hadoop Configuration Files to /tmp/hbase/hbase-site.xml,/tmp/hbase/core-site.xml

Step 38:  Set your Kerberos Principal to your account name / machine user name.

Step 39:  Set your Kerberos Password to that password for that account.   ie. Workload password.

Step 40:  Hit Apply and the HBase service will validate.   You can now click the ligthing bolt to start it.   If things are taking too long for the lightning bolt to appear, click out of the controller and go back in.

Step 41:  Add a RetryFlowFile processor and connect PutHBaseRecord's failure to it.

Step 42:  For RetryFlowFile send failure and retries_exceeeded to a Funnel or a LogAttribute.   Finally for the retry, connect that to PutHBaseRecord.

Note:  To see the data you have processed so far, at any point you can right click and see View Data Provenance.


Extra Credit:  You can change any values that are specific to your example such as Schema Registry URL, usernames, passwords and such to parameters.
https://www.datainmotion.dev/2019/11/exploring-apache-nifi-110-parameters.html
