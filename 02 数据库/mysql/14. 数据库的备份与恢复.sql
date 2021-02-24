备份
mysqldump -uroot -p db_name > name.sql
恢复
mysql -h localhost -u root dbname < name.sql
