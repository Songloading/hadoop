sqoop export --connect jdbc:mysql://$1/sqooptest --username hive -m 1 --table EmployeesExportData --export-dir /tmp/sqoop/Employees --input-fields-terminated-by '\t' --input-null-string 'This is a Null String' --input-null-non-string '\\N' -P


sqoop export --connect jdbc:mysql://$1/sqooptest --username hive -m 1 --table EmployeesExportData --export-dir /tmp/sqoop/Employees --input-fields-terminated-by '\t' --input-null-string 'This is a Null String' --input-null-non-string '\\N' --update-key eid --update-mode allowinsert -P
