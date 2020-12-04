# resources
# https://www.datainmotion.dev/2019/10/migrating-apache-flume-flows-to-apache_7.html
# https://www.datainmotion.dev/2019/10/using-grovepi-with-raspberry-pi-and.html

# referencesw
# https://github.com/tspannhw/ApacheConAtHome2020
# https://github.com/tspannhw/cdp-datahub-azure-nifikafka
# https://github.com/tspannhw/airline-sentiment-streaming/

# Download Hbase client configs from CM
# Download Hive client configs from CM

# Load Schemas

CREATE EXTERNAL TABLE weatherkudu 
(`location` STRING,`observation_time` STRING, `credit` STRING, `credit_url` STRING, `image` STRING, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT,
`station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE,  `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING,
`temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_gust_mph` DOUBLE, `wind_kt` BIGINT,
`wind_gust_kt` BIGINT, `pressure_string` STRING, `pressure_mb` DOUBLE, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `windchill_string` STRING,
`windchill_f` BIGINT, `windchill_c` BIGINT, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING,
`copyright_url` STRING, `privacy_policy_url` STRING)
STORED BY 'org.apache.hadoop.hive.kudu.KuduStorageHandler'
TBLPROPERTIES (
  "kudu.table_name"="default.weatherkudu", 
  "kudu.master_addresses"="ace-ww-workshop-rtkudu-master10.ace-aw-w.ylcu-atmi.cloudera.site:7051,ace-ww-workshop-rtkudu-master30.ace-aw-w.ylcu-atmi.cloudera.site:7051, ace-ww-workshop-rtkudu-master20.ace-aw-w.ylcu-atmi.cloudera.site:7051"
);

CREATE EXTERNAL TABLE IF NOT EXISTS `weatherorc` (`credit` STRING, `credit_url` STRING, `image` STRUCT<`url`:STRING, `title`:STRING, `link`:STRING>, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT, `location` STRING, `station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE, `observation_time` STRING, `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING, `temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_kt` BIGINT, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING, `copyright_url` STRING, `privacy_policy_url` STRING) 
STORED AS ORC
LOCATION 's3a://aceawworkshopuat1/user/tspann/weatherorc'

CREATE EXTERNAL TABLE IF NOT EXISTS `weatherparquet` (`credit` STRING, `credit_url` STRING, `image` STRUCT<`url`:STRING, `title`:STRING, `link`:STRING>, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT, `location` STRING, `station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE, `observation_time` STRING, `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING, `temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_kt` BIGINT, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING, `copyright_url` STRING, `privacy_policy_url` STRING) 
STORED AS PARQUET
LOCATION 's3a://aceawworkshopuat1/user/tspann/weatherparquet'

CREATE EXTERNAL TABLE weatherkudu 
(`location` STRING,`observation_time` STRING, `credit` STRING, `credit_url` STRING, `image` STRING, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT,
`station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE,  `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING,
`temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_gust_mph` DOUBLE, `wind_kt` BIGINT,
`wind_gust_kt` BIGINT, `pressure_string` STRING, `pressure_mb` DOUBLE, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `windchill_string` STRING,
`windchill_f` BIGINT, `windchill_c` BIGINT, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING,
`copyright_url` STRING, `privacy_policy_url` STRING,
PRIMARY KEY (`location`, `observation_time`)
STORED BY 'org.apache.hadoop.hive.kudu.KuduStorageHandler'
TBLPROPERTIES (
  "kudu.table_name"="default.weatherkudu", 
  "kudu.master_addresses"="ace-ww-workshop-rtkudu-master10.ace-aw-w.ylcu-atmi.cloudera.site:7051"
);



# HBase
# 7.2.2 - Operational Database: Apache HBase, Phoenix-COD-v3

create table weather, weather_details

CREATE EXTERNAL TABLE IF NOT EXISTS `twitterorc` (`msg` STRING, `unixtime` STRING, `friends_count` STRING, `hashtags` STRING, `listed_count` STRING, `tweet_id` STRING, `user_name` STRING, `favourites_count` STRING, `source` STRING, `placename` STRING, `media_url` STRING, `retweet_count` STRING, `user_mentions_name` STRING, `geo` STRING, `urls` STRING, `countrycode` STRING, `user_url` STRING, `place` STRING, `coordinates` STRING, `handle` STRING, `profile_image_url` STRING, `time_zone` STRING, `ext_media` STRING, `statuses_count` STRING, `followers_count` STRING, `location` STRING, `user_mentions` STRING, `user_description` STRING) STORED AS ORC
LOCATION 's3a://aceawworkshopuat1/user/tspann/twitterorc'

# Hive streaming table
# Hive external table
# 7.2.2 - Data Engineering: Apache Spark, Apache Hive, Apache Oozie

CREATE TABLE `weatherhive` (
`location` STRING,`observation_time` STRING, `credit` STRING, `credit_url` STRING, `image` STRING, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT,
`station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE,  `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING,
`temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_gust_mph` DOUBLE, `wind_kt` BIGINT,
`wind_gust_kt` BIGINT, `pressure_string` STRING, `pressure_mb` DOUBLE, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `windchill_string` STRING,
`windchill_f` BIGINT, `windchill_c` BIGINT, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING,
`copyright_url` STRING, `privacy_policy_url` STRING
);


CREATE TABLE `twitterhive` (
  `msg` STRING,
  `unixtime` STRING,
  `friends_count` STRING,
  `hashtags` STRING,
  `listed_count` STRING,
  `tweet_id` STRING,
  `user_name` STRING,
  `favourites_count` STRING,
  `source` STRING,
  `placename` STRING,
  `media_url` STRING,
  `retweet_count` STRING,
  `user_mentions_name` STRING,
  `geo` STRING,
  `urls` STRING,
  `countrycode` STRING,
  `user_url` STRING,
  `place` STRING,
  `coordinates` STRING,
  `handle` STRING,
  `profile_image_url` STRING,
  `time_zone` STRING,
  `ext_media` STRING,
  `statuses_count` STRING,
  `followers_count` STRING,
  `location` STRING,
  `user_mentions` STRING,
  `user_description` STRING
);

CREATE TABLE `globaltwitter` (
     `friends_count` STRING,`tweet_id` STRING,  `source` STRING, `systemtime` STRING, `location` STRING, `sentiment` STRING
);


# Kudu Table

CREATE TABLE IF NOT EXISTS twitterkudu (tweetid STRING, `timestamp` STRING, friends_count STRING, hashtags STRING, listed_count STRING, 
annonym STRING, favourites_count STRING, airlinesentiment STRING, airlinepolarity STRING, retweet_count STRING, 
statuses_count STRING, followers_count STRING, `location` STRING, text STRING, time STRING, airline STRING, 
PRIMARY KEY (tweetid, `timestamp`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

CREATE TABLE IF NOT EXISTS airlinesentimentkudu
(tweet_id STRING, `unixtime` STRING, friends_count STRING, hashtags STRING, listed_count STRING, 
source STRING, favourites_count STRING, 
statuses_count STRING, followers_count STRING, `location` STRING, msg STRING, time STRING, airline STRING, 
user_name STRING, placename STRING, retweet_count STRING, 
user_mentions_name STRING, geo STRING, urls STRING, countryCode STRING, user_url STRING,
place STRING, coordinates STRING, handle STRING, profile_image_url STRING, time_zone STRING,
 ext_media STRING, user_description STRING,
PRIMARY KEY (tweet_id, `unixtime`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

CREATE TABLE weatherkudu
(`location` STRING,`observation_time` STRING, `credit` STRING, `credit_url` STRING, `image` STRING, `suggested_pickup` STRING, `suggested_pickup_period` BIGINT,
`station_id` STRING, `latitude` DOUBLE, `longitude` DOUBLE,  `observation_time_rfc822` STRING, `weather` STRING, `temperature_string` STRING,
`temp_f` DOUBLE, `temp_c` DOUBLE, `relative_humidity` BIGINT, `wind_string` STRING, `wind_dir` STRING, `wind_degrees` BIGINT, `wind_mph` DOUBLE, `wind_gust_mph` DOUBLE, `wind_kt` BIGINT,
`wind_gust_kt` BIGINT, `pressure_string` STRING, `pressure_mb` DOUBLE, `pressure_in` DOUBLE, `dewpoint_string` STRING, `dewpoint_f` DOUBLE, `dewpoint_c` DOUBLE, `windchill_string` STRING,
`windchill_f` BIGINT, `windchill_c` BIGINT, `visibility_mi` DOUBLE, `icon_url_base` STRING, `two_day_history_url` STRING, `icon_url_name` STRING, `ob_url` STRING, `disclaimer_url` STRING,
`copyright_url` STRING, `privacy_policy_url` STRING,
PRIMARY KEY (`location`, `observation_time`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

CREATE TABLE IF NOT EXISTS sentiment_tweets 
(tweet_id STRING, `unixtime` STRING, friends_count STRING, hashtags STRING, listed_count STRING, 
source STRING, favourites_count STRING, 
statuses_count STRING, followers_count STRING, `location` STRING, msg STRING, time STRING, sentiment STRING, 
user_name STRING, placename STRING, retweet_count STRING, 
user_mentions_name STRING, geo STRING, urls STRING, countryCode STRING, user_url STRING,
place STRING, coordinates STRING, handle STRING, profile_image_url STRING, time_zone STRING,
 ext_media STRING, user_description STRING,  `media_url` STRING,`timestamp` STRING, user_mentions STRING,
PRIMARY KEY (tweet_id, `unixtime`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

# HDFS Hive Table External

CREATE EXTERNAL TABLE IF NOT EXISTS airlinesentiment (friendscount STRING, hashtags STRING, listedcount STRING,  
annonym STRING, favouritescount STRING, airlinesentiment STRING, airlinepolarity STRING,  retweetcount STRING, 
tweetid STRING, statusescount STRING, followerscount STRING, tweetlocation STRING, tweettext STRING, 
tweettime STRING, airline STRING,  tweettimestamp STRING ) 
STORED AS PARQUET
LOCATION 's3a://cdp-sandbox-default-se/datalake/warehouse/tablespace/external/hive/airlinesentiment'
 ;

# ORC


CREATE EXTERNAL TABLE IF NOT EXISTS `twitterorc` (`msg` STRING, `unixtime` STRING, `friends_count` STRING, `hashtags` STRING, `listed_count` STRING, `tweet_id` STRING, `user_name` STRING, `favourites_count` STRING, `source` STRING, `placename` STRING, `media_url` STRING, `retweet_count` STRING, `user_mentions_name` STRING, `geo` STRING, `urls` STRING, `countrycode` STRING, `user_url` STRING, `place` STRING, `coordinates` STRING, `handle` STRING, `profile_image_url` STRING, `time_zone` STRING, `ext_media` STRING, `statuses_count` STRING, `followers_count` STRING, `location` STRING, `user_mentions` STRING, `user_description` STRING) 
STORED AS ORC
LOCATION '/twitterorc'


# Test Queries


select count(*) as NumberOfUsers, airlinesentiment, airline
from airlinesentimentkudu
where airline != 'None'
group by airlinesentiment, airline;

select `location`, observation_time, latitude,longitude,temperature_string, weather, pressure_string
from weatherkudu
where `location` like '%NJ%'
order by observation_time desc;



select dayofweek(to_timestamp(time,'yyyy-MMM-dd HH:mm:ss.SSSSSS')), unixtime, `timestamp`, msg from sentiment_tweets

select from_unixtime(CAST(STRLEFT(unixtime,LENGTH(unixtime)-3) as bigint), 'yyyy-MM-dd HH:mm:ss'), unixtime, time, `timestamp`
from sentiment_tweets
where unixtime is not null

select dayofweek(from_unixtime(CAST(STRLEFT(unixtime,LENGTH(unixtime)-3) as bigint), 'yyyy-MM-dd HH:mm:ss')), 
count(dayofweek(from_unixtime(CAST(STRLEFT(unixtime,LENGTH(unixtime)-3) as bigint), 'yyyy-MM-dd HH:mm:ss'))) as Count 
from sentiment_tweets 
group by dayofweek(from_unixtime(CAST(STRLEFT(unixtime,LENGTH(unixtime)-3) as bigint), 'yyyy-MM-dd HH:mm:ss'))
                                 
select 'Privacy Rule X2YZ applies', count(user_name) from rawpostsunicef group by user_name order by count(user_name) DESC
                                 
 select sentiment, count(sentiment) from rawpostsunicef group by sentiment;
 
 
 
echo ""
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo "Build HBase Tables"
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo ""
echo ""
hbase shell tables.tbl 

echo ""
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo " Building Kudu Impala Tables"
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo ""
echo ""

# Build Kudu tables

impala-shell -i edge2ai-1.dim.local -d default -f kudu.sql 

echo ""
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo " Building Apache Hive ORC Tx Tables"
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo ""
echo ""

# Build Hive Tables
beeline -u jdbc:hive2://edge2ai-1.dim.local:10000/default -f hive.sql
 
                                 
                                 
                                 
