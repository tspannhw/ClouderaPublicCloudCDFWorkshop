# Overview of Data Flow Details

Welcome to the Cloudera Data Platform for Public Cloud Data Flow hands-on workshop,
I am your instructor, Timothy Spann.  [@PaasDev](https://dev.to/tspannhw)


![Tim](https://raw.githubusercontent.com/tspannhw/tspannhw/main/headshots/mlx90640-2020-01-05-20-52-14.gif)

* [https://www.youtube.com/watch?v=lrV-EwD4G8w](https://www.youtube.com/watch?v=lrV-EwD4G8w)
* [https://www.youtube.com/watch?v=kn6-8f8Vrq8](https://www.youtube.com/watch?v=kn6-8f8Vrq8)


## Please see slides and some articles.

* [https://www.datainmotion.dev/2020/04/streaming-data-with-cloudera-data-flow.html)](https://www.datainmotion.dev/2020/04/streaming-data-with-cloudera-data-flow.html)
* [https://www.datainmotion.dev/2021/02/ingest-into-cloud.html](https://www.datainmotion.dev/2021/02/ingest-into-cloud.html)
* [https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html](https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html)
* [https://www.cloudera.com/products/cdf.html](https://www.cloudera.com/products/cdf.html)
* [https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-overview.html](https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-overview.html)
* https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-hive-ingest/topics/cdf-datahub-hive-ingest-data-target.html

## Pre-Requisite


### Environment Setup Details


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/setworkloadpassword.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/Envsetworkloadpassword.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/synchronizeuserspreclick.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/synchronizeusers.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/synccomplete.png)



## Labs 1 and 2 - For Developers

In our first lab you are free to explore your environments and test permissions.


## Lab 1:  CDP Public Cloud Data Flow Overview Exploration

* Explore CDP Data Hubs

* Explore Cloudera Manager for NiFi cluster, Kafka cluster

* Explore Hue

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/datahubs.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/datalake.png)


## Lab 2:  Apache NiFi → Apache Hive (Data Engineering Hub)

In this lab you will write data to an Apache Hive 3 table in Cloudera Data Platform.

[Hive Ingest Example](https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html)

### Flow Management


Step 1:  From the Flow Management Data Hub, Click the link for NiFi.

Step 2: You will begin to add data.

Step 3:  Create the data generator.   Add a "Generate Flow File" processor to the screen.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/001generateData.png)

Set the Run Schedule (see Scheduling tab) any number between 3 and 60 seconds.

Set the Custom Text to:

```
 {
 "id": "${UUID()}",
"te": "0.${random():mod(1000):plus(1)}",
"diskusage": "${math("random")}.3 MB",
"memory": ${random():mod(95):plus(10)},
"cpu": ${nextInt()}.${random():mod(99):plus(1)},
"host": "${ip()}",
"temperature": "${random():mod(60):plus(60)}",
"macaddress": "test",
"end": "${random():mod(1000):plus(1)}",
"systemtime": "${now():format("MM/dd/yyyy HH:mm:ss", "EST")}"
}
```

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/generateFlowFile.png)

Feel free to tweak this for your change the data, but if you add or remove fields you will need to update the schema linked below.



### Flow Management

Step :  Now that we have a schema we can use it for Filtering and Routing with a "Query Record Processor"

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/configureQueryProcessor.png)

Step :  Create a JsonTreeReader as the reader and an AvroWriter for writer.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/NEWschemaawareavrowriter.png)

Step :  Click into JsonTreeReader and leave defaults.  

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/inferjsontreereader.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/inferjsontreereader.png)


Step :  Add an attribute tohdfs and enter SELECT * FROM FLOWFILE as your query.  We can change that later and add things like WHERE memory > 10


Step :  Create an Avro for the RecordReader.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/NEWschemaawareavroreader.png)


Step :  Create a JSONSetWRiter

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/jsonsetrecordwriter1.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/jsonrecordsetwriter2.png)

[](https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-hive-ingest/topics/cdf-datahub-hive-ingest-connection-detail.html)

[](https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-hive-ingest/topics/cdf-datahub-hive-ingest-build.html)

Step :  Add a PutHive3Streaming processor and set the following parameters.  Your admin will give which Hive configuration resources.  It may be /tmp/hive/hdfs-site.xml, /tmp/hive/hive-site.xml, /tmp/hive/core-site.xml

[](https://docs.cloudera.com/cdf-datahub/7.2.8/nifi-hive-ingest/topics/cdf-datahub-hive-ingest-data-target.html)


Step :  Set your Kerberos Principal to your account name / machine user name.

Step :  Set your Kerberos Password to that password for that account.   ie. Workload password.

Step :  Set Hive Metastore URI from main Hive server

Step : Set database, like default

Step : Set table name, like iottesthv

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/puthive3streaming.png)



Step :  Add a RetryFlowFile processor and connect PutHDFS failure to it.

Step :  For RetryFlowFile send failure and retries_exceeeded to a Funnel or a LogAttribute.   Finally for the retry, connect that to PutHBaseRecord.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/logattribute.png)


Step : Check the output

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/hive3provenanceevent.png)

You can query the final table.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/HUEHive3Details.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/dasqueryhive3.png)


## Another Option to Write to Hive
## PutORC For External Tables

Step : Merge Record

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/0000mergerecord.png)

Step:  Put ORC

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/0001putorc.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/0002putorc.png)



## Final Flow


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/flow.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/puthive3streamingflow.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/mainflowhive.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hive/ALLFLOW.png)


## Wrap-Up

Note:  To see the data you have processed so far, at any point you can right click and see View Data Provenance.


### You can see your flow running in Apache Atlas linked from the data lake

![parm](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/atlas.png)


Extra Credit:  You can change any values that are specific to your example such as Schema Registry URL, usernames, passwords and such to parameters.

![parm](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/updateParameterContext.png)

https://www.datainmotion.dev/2019/11/exploring-apache-nifi-110-parameters.html
