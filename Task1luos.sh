//1
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir --table Employees --split-by eid --target-dir /tmp/sqoopOutput -P

//2
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir --table Employees -m 1 --target-dir /tmp/sqoopMapOutput -P

//3 
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir -m 2 --table Employees --target-dir /tmp/sqoopSeqOutput --split-by eid --as-sequencefile -P

//4
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir -m 2 --table Employees --warehouse-dir /tmp/sqoop --split-by eid -P

//5
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir --split-by eid -m 2 --table Employees --warehouse-dir /tmp/sqoop --fields-terminated-by '\t' --null-string 'This is a Null String' --null-non-string '\\N' -P

//6
	hive -e 'CREATE DATABASE IF NOT EXISTS sqooptest'

//7
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive -m 2 --split-by eid --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees -P

//8
	sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir -m 2 --split-by eid --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees --fields-terminated-by '\t' --null-string 'This is a Null String' --null-non-string '\\N' -P
	
//9
	sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username hive -m 1 --warehouse-dir /tmp/sqoopAll/ --fields-terminated-by ',' --null-string '\\N' --null-non-string '\\N' -P