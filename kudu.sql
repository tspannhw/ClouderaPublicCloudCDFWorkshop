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

