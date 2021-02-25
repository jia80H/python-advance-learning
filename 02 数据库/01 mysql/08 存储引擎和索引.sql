存储引擎
    什么是存储引擎
    数据库存储引擎是数据库底层软件组件，数据库管理系统使用数据引擎进行创建、查询、更新和删除数据操作。不同的存储引擎提供不同的存储机制、索引技巧、锁定水平等功能，使用不同的存储引擎还可以获得特定的功能。

    现在许多数据库管理系统都支持多种不同的存储引擎。MySQL 的核心就是存储引擎。

    提示：InnoDB 事务型数据库的首选引擎，支持事务安全表（ACID），支持行锁定和外键。MySQL 5.5.5 之后，InnoDB 作为默认存储引擎。

    MyISAM 是基于 ISAM 的存储引擎，并对其进行扩展，是在 Web、数据仓储和其他应用环境下最常使用的存储引擎之一。MyISAM 拥有较高的插入、查询速度，但不支持事务。

    MEMORY 存储引擎将表中的数据存储到内存中，为查询和引用其他数据提供快速访问。
    MySQL 5.7 支持的存储引擎
    MySQL 支持多种类型的数据库引擎，可分别根据各个引擎的功能和特性为不同的数据库处理任务提供各自不同的适应性和灵活性。在 MySQL 中，可以利用 SHOW ENGINES 语句来显示可用的数据库引擎和默认引擎。

    MySQL 提供了多个不同的存储引擎，包括处理事务安全表的引擎和处理非事务安全表的引擎。在 MySQL 中，不需要在整个服务器中使用同一种存储引擎，针对具体的要求，可以对每一个表使用不同的存储引擎。

    MySQL 5.7 支持的存储引擎有 InnoDB、MyISAM、Memory、Merge、Archive、Federated、CSV、BLACKHOLE 等。可以使用SHOW ENGINES语句查看系统所支持的引擎类型，结果如图所示。

    MySQL数据库中的存储引擎

    Support 列的值表示某种引擎是否能使用，YES表示可以使用，NO表示不能使用，DEFAULT表示该引擎为当前默认的存储引擎。
    如何选择 MySQL 存储引擎
    不同的存储引擎都有各自的特点，以适应不同的需求，如表所示。为了做出选择，首先要考虑每一个存储引擎提供了哪些不同的功能。

    功能	MylSAM	MEMORY	InnoDB	Archive
    存储限制	256TB	RAM	64TB	None
    支持事务	No	No	Yes	No
    支持全文索引	Yes	No	No	No
    支持树索引	Yes	Yes	Yes	No
    支持哈希索引	No	Yes	No	No
    支持数据缓存	No	N/A	Yes	No
    支持外键	No	No	Yes	No
    可以根据以下的原则来选择 MySQL 存储引擎：
    如果要提供提交、回滚和恢复的事务安全（ACID 兼容）能力，并要求实现并发控制，InnoDB 是一个很好的选择。
    如果数据表主要用来插入和查询记录，则 MyISAM 引擎提供较高的处理效率。
    如果只是临时存放数据，数据量不大，并且不需要较高的数据安全性，可以选择将数据保存在内存的 MEMORY 引擎中，MySQL 中使用该引擎作为临时表，存放查询的中间结果。
    如果只有 INSERT 和 SELECT 操作，可以选择Archive 引擎，Archive 存储引擎支持高并发的插入操作，但是本身并不是事务安全的。Archive 存储引擎非常适合存储归档数据，如记录日志信息可以使用 Archive 引擎。

    提示：使用哪一种引擎要根据需要灵活选择，一个数据库中多个表可以使用不同的引擎以满足各种性能和实际需求。使用合适的存储引擎将会提高整个数据库的性能。
    MySQL 默认存储引擎
    InnoDB 是系统的默认引擎，支持可靠的事务处理。

    使用下面的语句可以修改数据库临时的默认存储引擎
    SET default_storage_engine=< 存储引擎名 >

    例如，将 MySQL 数据库的临时默认存储引擎修改为 MyISAM，输入的 SQL 语句和运行结果如图所示。

    修改MySQL数据库中的默认存储引擎

    此时，可以发现 MySQL 的默认存储引擎已经变成了 MyISAM。但是当再次重启客户端时，默认存储引擎仍然是 InnoDB。

索引
    MySQL 索引
    MySQL索引的建立对于MySQL的高效运行是很重要的，索引可以大大提高MySQL的检索速度。

    打个比方，如果合理的设计且使用索引的MySQL是一辆兰博基尼的话，那么没有设计和使用索引的MySQL就是一个人力三轮车。

    拿汉语字典的目录页（索引）打比方，我们可以按拼音、笔画、偏旁部首等排序的目录（索引）快速查找到需要的字。

    索引分单列索引和组合索引。单列索引，即一个索引只包含单个列，一个表可以有多个单列索引，但这不是组合索引。组合索引，即一个索引包含多个列。

    创建索引时，你需要确保该索引是应用在 SQL 查询语句的条件(一般作为 WHERE 子句的条件)。

    实际上，索引也是一张表，该表保存了主键与索引字段，并指向实体表的记录。

    上面都在说使用索引的好处，但过多的使用索引将会造成滥用。因此索引也会有它的缺点：虽然索引大大提高了查询速度，同时却会降低更新表的速度，如对表进行INSERT、UPDATE和DELETE。因为更新表时，MySQL不仅要保存数据，还要保存一下索引文件。

    建立索引会占用磁盘空间的索引文件。

    普通索引
    创建索引
    这是最基本的索引，它没有任何限制。它有以下几种创建方式：

    CREATE INDEX indexName ON table_name (column_name)
    如果是CHAR，VARCHAR类型，length可以小于字段实际长度；如果是BLOB和TEXT类型，必须指定 length。

    修改表结构(添加索引)
    ALTER table tableName ADD INDEX indexName(columnName)
    创建表的时候直接指定
    CREATE TABLE mytable(  
    
    ID INT NOT NULL,   
    
    username VARCHAR(16) NOT NULL,  
    
    INDEX [indexName] (username(length))  
    
    );  
    删除索引的语法
    DROP INDEX [indexName] ON mytable; 
    唯一索引
    它与前面的普通索引类似，不同的就是：索引列的值必须唯一，但允许有空值。如果是组合索引，则列值的组合必须唯一。它有以下几种创建方式：

    创建索引
    CREATE UNIQUE INDEX indexName ON mytable(username(length)) 
    修改表结构
    ALTER table mytable ADD UNIQUE [indexName] (username(length))
    创建表的时候直接指定
    CREATE TABLE mytable(  
    
    ID INT NOT NULL,   
    
    username VARCHAR(16) NOT NULL,  
    
    UNIQUE [indexName] (username(length))  
    
    );  
    使用ALTER 命令添加和删除索引
    有四种方式来添加数据表的索引：

    ALTER TABLE tbl_name ADD PRIMARY KEY (column_list): 该语句添加一个主键，这意味着索引值必须是唯一的，且不能为NULL。
    ALTER TABLE tbl_name ADD UNIQUE index_name (column_list): 这条语句创建索引的值必须是唯一的（除了NULL外，NULL可能会出现多次）。
    ALTER TABLE tbl_name ADD INDEX index_name (column_list): 添加普通索引，索引值可出现多次。
    ALTER TABLE tbl_name ADD FULLTEXT index_name (column_list):该语句指定了索引为 FULLTEXT ，用于全文索引。
    以下实例为在表中添加索引。

    mysql> ALTER TABLE testalter_tbl ADD INDEX (c);
    你还可以在 ALTER 命令中使用 DROP 子句来删除索引。尝试以下实例删除索引:

    mysql> ALTER TABLE testalter_tbl DROP INDEX c;
    使用 ALTER 命令添加和删除主键
    主键作用于列上（可以一个列或多个列联合主键），添加主键索引时，你需要确保该主键默认不为空（NOT NULL）。实例如下：

    mysql> ALTER TABLE testalter_tbl MODIFY i INT NOT NULL;
    mysql> ALTER TABLE testalter_tbl ADD PRIMARY KEY (i);
    你也可以使用 ALTER 命令删除主键：

    mysql> ALTER TABLE testalter_tbl DROP PRIMARY KEY;
    删除主键时只需指定PRIMARY KEY，但在删除索引时，你必须知道索引名。

    显示索引信息
    你可以使用 SHOW INDEX 命令来列出表中的相关的索引信息。可以通过添加 \G 来格式化输出信息。

    尝试以下实例:

    mysql> SHOW INDEX FROM table_name; \G