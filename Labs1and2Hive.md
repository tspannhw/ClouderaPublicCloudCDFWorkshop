# Overview of Data Flow Details

Welcome to the Cloudera Data Platform for Public Cloud Data Flow hands-on workshop,
I am your instructor, Timothy Spann.  [@PaasDev](https://dev.to/tspannhw)


![Tim](https://raw.githubusercontent.com/tspannhw/tspannhw/main/headshots/mlx90640-2020-01-05-20-52-14.gif)

* [https://www.youtube.com/watch?v=lrV-EwD4G8w](https://www.youtube.com/watch?v=lrV-EwD4G8w)
* [https://www.youtube.com/watch?v=kn6-8f8Vrq8](https://www.youtube.com/watch?v=kn6-8f8Vrq8)


## Please see slides and some articles.

* [https://www.datainmotion.dev/2020/04/streaming-data-with-cloudera-data-flow.html)](https://www.datainmotion.dev/2020/04/streaming-data-with-cloudera-data-flow.html)
* [https://www.datainmotion.dev/2021/02/ingest-into-cloud.html](https://www.datainmotion.dev/2021/02/ingest-into-cloud.html)
* [https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html](https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hive-ingest/topics/cdf-datahub-nifi-hive-ingest.html)
* [https://www.cloudera.com/products/cdf.html](https://www.cloudera.com/products/cdf.html)
* [https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-overview.html](https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-overview.html)


## Pre-Requisite


### Environment Setup Details


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/setworkloadpassword.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/Envsetworkloadpassword.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/synchronizeuserspreclick.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/synchronizeusers.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/synccomplete.png)


### Create an HDFS directory in Hue for use with permissions (or create in AWS)

* Perhaps /tmp/mydir
* (or) a hive external directory

* if it is not under CDP HDFS managed, you will need some more details and we will use PutS3.

https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-target-processor.html

If you want to use the PutS3Object processor to store the data in S3, you have to configure your S3 connection in a secure way:

You add the AWS access key or secret access key as properties of the processor
You configure these access keys in a credentials file and add that as a property of the processor
You use a AWS Credentials provider service and configure it with the required information for authenticating against AWS.


### Setup IDBroker mapping for S3

To enable your CDP user to utilize the central authentication features CDP provides and to exchange credentials for AWS access tokens, you have to map your CDP user to the correct IAM role.

The option to add / modify the mappings is available from the Management Console in your CDP environment.

[https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-create-idbroker-mapping.html](https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/topics/cdf-datahub-fm-s3-ingest-create-idbroker-mapping.html)

![](https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/images/idbroker-mapping-1.png)

![](https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/images/idbroker-mapping-2.png)

![](https://docs.cloudera.com/cdf-datahub/7.2.2/nifi-aws-ingest/images/idbroker-mapping-3.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/idbrokermapping.png)


## Labs 1 and 2 - For Developers

In our first lab you are free to explore your environments and test permissions.


## Lab 1:  CDP Public Cloud Data Flow Overview Exploration

* Explore CDP Data Hubs

* Explore Cloudera Manager for NiFi cluster, Kafka cluster

* Explore Hue

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/datahubs.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/datalake.png)


## Lab 2:  Apache NiFi → HDFS (Managed AWS S3)

In this lab you will write data to an S3 bucket managed by HDFS under Cloudera Data Platform.



### Flow Management


Step :  From the Flow Management Data Hub, Click the link for NiFi.

[https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-build.html](https://docs.cloudera.com/cdf-datahub/7.2.7/nifi-hbase-ingest/topics/cdf-datahub-hbase-ingest-build.html)

Step : You will begin to add data.

Step :  Create the data generator.   Add a "Generate Flow File" processor to the screen.

Set the schedule to 5 or 10 seconds.

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

Step :  Create a JsonTreeReader as the reader and an JsonRecordSetWriter for writer.



Step :  Click into JsonTreeReader and leave defaults.  

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/inferjsontreereader.png)


Step :  Add an attribute tohdfs and enter SELECT * FROM FLOWFILE as your query.  We can change that later and add things like WHERE memory > 10


Step :  Create an JSONTreeReader for the RecordReader.


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/inferjsontreereader.png)

Step : Add a MergeRecord processor

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/mergerecord.png)

Step :  Create a JSONSetWRiter

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/jsonsetrecordwriter1.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/jsonrecordsetwriter2.png)


Step :  Add a PutHDFS processor and set the following parameters.  Your admin will give which Hadoop configuration file directories.  It may be /etc/hadoop/conf/hdfs-site.xml,/etc/hadoop/conf/core-site.xml

Step :  Set your Kerberos Principal to your account name / machine user name.

Step :  Set your Kerberos Password to that password for that account.   ie. Workload password.


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/putHDFSProperties.png)


Step :  Add a RetryFlowFile processor and connect PutHDFS failure to it.

Step :  For RetryFlowFile send failure and retries_exceeeded to a Funnel or a LogAttribute.   Finally for the retry, connect that to PutHBaseRecord.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/logattribute.png)



Step : Check the output

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/resultsHDFSSave.png)

You can see the raw JSON files in Hue under HDFS/S3.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/hueResultsHDFS.png)

You can query an external table on your JSON data.

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/hiveonjsoninhue.png)


## Final Flow


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/hdfs/flow.png)


## Wrap-Up

Note:  To see the data you have processed so far, at any point you can right click and see View Data Provenance.


### You can see your flow running in Apache Atlas linked from the data lake

![parm](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/atlas.png)


Extra Credit:  You can change any values that are specific to your example such as Schema Registry URL, usernames, passwords and such to parameters.

![parm](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/updateParameterContext.png)

https://www.datainmotion.dev/2019/11/exploring-apache-nifi-110-parameters.html
