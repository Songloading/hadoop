CREATE DATABASE IF NOT EXISTS '$db';
CREATE TABLE IF NOT EXISTS '$tb'(year STRING, temperature INT, quality INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE ;
LOAD DATA INPATH '$path' OVERWRITE INTO TABLE task1records; 
SELECT year,MAX(temperature) as max, MIN(temperature) as min, AVG(temperature) as AVG FROM records WHERE quality in (0,1) GROUP BY year;