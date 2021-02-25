# Labs 3 and 4 - For Developers


We will be using the Flow Management and Streams Messaging datahubs for these two labs.   We will be creating data pipelines in Apache NiFi that 
produce and consume messages to/from Apache Kafka.  We will monitor that data with Apache NiFi provenance and Streams Messaging Manager's monitoring capabilities.



## Lab 3: Apache Kafka ←→ Apache NiFi

* Explore CDP Data Hubs - Streams Messaging - Kafka
* Explore CDP Data Hubs - Flow Management - NiFi

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/queryToKafkaFlow.png)


# Producing Kafka Messages

* Add a query to QueryRecord "tokafka"

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/queryRecordToKafka.png)

* Add a PublishKafkaRecord producer


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/producekafka1a.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/producekafka2.png)



* Connect "tokafka" from QueryRecord to PublishKafkaRecord

* Add RetryFlowFile processor for failure


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/retryflowfike.png)


* Add LogAttribute for failure





![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/consumeFlowOverview.png)

* Consuming kafka Messages

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/consumekafka1.png)

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/consumekafka2.png)




* Validate Records


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/validateRecord.png)


 
* Query, Filter  & Enrich

![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/queryRecord.png)




## Lab 4: Monitoring and Managing Apache Kafka with Cloudera Streams Messaging Manager



### Streams Messaging Manager (SMM)


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/smm.png)


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/smmmetrics.png)


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/smmoverview.png)


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/smmshowrecords.png)


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/smmrecord.png)





### Schema Registry (SR)


![](https://raw.githubusercontent.com/tspannhw/ClouderaPublicCloudCDFWorkshop/main/images/labs3and4/schema.png)



