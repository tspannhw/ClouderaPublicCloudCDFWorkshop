

CREATE EXTERNAL TABLE IF NOT EXISTS `iottest` 
(`id` STRING, `systemtime` STRING, `diskusage` STRING, `memory` INT, 
 `macaddress` STRING, `host` STRING, `end` STRING, `te` STRING, `cpu` INT, `temperature` STRING) 
 STORED AS ORC
LOCATION '/tmp/iottest5';


CREATE EXTERNAL TABLE IF NOT EXISTS `iottestjson` 
(`id` STRING, `systemtime` STRING, `diskusage` STRING, `memory` INT, 
 `macaddress` STRING, `host` STRING, `end` STRING, `te` STRING, `cpu` INT, `temperature` STRING) 
 STORED AS ORC
LOCATION '/tmp/iot5';

CREATE TABLE IF NOT EXISTS `iottesthv` 
(`id` STRING, `systemtime` STRING, `diskusage` STRING, `memory` INT, 
 `macaddress` STRING, `host` STRING, `end` STRING, `te` STRING, `cpu` INT, `temperature` STRING);





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
