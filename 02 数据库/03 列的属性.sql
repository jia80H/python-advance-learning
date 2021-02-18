插入的值是否可以为空
    null: 可以为空, 默认不写
    not null: 不可以为空,如果插入时某给字段为空会报错

    username varchar(16) not null,
    pwd varchar(16) NULL ;  

default
    默认值一般和null做搭配
    username varchar(16) default 'admin' not null,
    pwd varchar(16) default 123456;

列描述
    列描述：comment，是专门用于给开发人员进行维护的一个注释说明
    查看Comment：必须通过查看表创建语句

    基本语法：comment ‘字段描述’;
    pwd varchar(16) default 123456 COMMENT '密码';
    
主键
    顾名思义：主要的键，primary key，在一张表中，有且只有一个字段，里面的值具有唯一性

    添加主键
        随表添加
            1. 添加 PRIMARY KEY 属性
            2. 在所有字段之后添加 PRIMARY key <字段名》

        表后增加
            基本语法：alter table 表名 add primary key(字段);

    查看主键
        查看建表语句
        查看表结构

    删除主键
        alter TABLE <table_name> drop PRIMARY KEY ;

自动增长
    自动增长：auto_increment，当给定某个字段该属性之后，
    该列的数据在没有提供确定数据的时候，系统会根据之前已经
    存在的数据进行自动增加后，填充数据。

    基本语法：在字段之后增加一个属性auto_increment

    1、 查看自增长：自增长一旦触发使用之后，会自动的在表选项
        中增加一个选项（一张表最多只能拥有一个自增长）
    2、 表选项可以通过修改表结构来实现
        alter table 表名 auto_increment = 值;

唯一键
    唯一键：unique key，用来保证对应的字段中的数据唯一的。
    主键也可以用来保证字段数据唯一性，但是一张表只有一个主键。

    1、 唯一键在一张表中可以有多个。
    2、 唯一键允许字段数据为NULL，NULL可以有多个（NULL不参与比较）

    创建唯一键
        1、 直接在表字段之后增加唯一键标识符：unique[ key]
        2、 在所有的字段之后使用unique key(字段列表)
        3、 在创建完表之后也可以增加唯一键
            alter table 表名 add unique key(字段列表);

    删除唯一键
        删除的基本语法：alter table 表名 drop index 唯一键名字;

















