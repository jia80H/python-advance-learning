安装
    # 官网复制yum repository下载地址
    shell==>wget <url>
    shell==>yum isntall <name>
    # 查找需要安装版本的方法(官网指导)
    shell==>yum install mysql-community-server

mycli的使用
    下载
    pip3 install mycli
    配置
    vim ~/.myclirc
    使用(有语法高亮和提示)
    mycli -uroot

开启数据库服务
    shell==>systemctl start mysqld  # 开启服务(操作:start stop restart status)
    shell==>ps -aux|grep mysql  # 查看是否开启
    shell==>mysql --version  # 查看版本

连接数据库
    查看临时密码
    cat /var/log/mysqld.log |grep password

    语法: mysql -hloaclhost -uroot -p1234567 -P3306
        1. -h: host(ip地址) localhost = 127.0.0.1
        2. -u: username
        3. -p: password
        4. -P: port(端口,默认端口3306)

    用临时密码进入
    mysql -uroot -p<password>

    修改密码
    alter user root@localhost identified with mysql_native_password by '<password>'
    修改完临时密码失效

    退出数据库
        1. exit     2. quit     3. \q       4. ctrl+d

用户操作
    1. 创建用户,权限授予
        8.0之前的版本
        GRANT ALL PRIVILEGES on *.* to '用户名'@'主机' IDENTIFIED BY "密码" WITH GRANT OPTION;   # 这是危险操作
        flush privileges; # 刷新使用权限
            1. ALL PRIVILEGES: 授予全部权限,也可以指定
            select insert update delete create drop index alter grant references reload  shutdown
            process file十四个权限
            2. *.*: 运行操作的数据库和表
            3. 主机: 表示运行用户从哪个主机登录, %表示运行任意主机登录
            4. WITH GRANT OPTION: 待遇该子句说明允许用户将自己拥有的权限授予他人

        8.0之后的版本
        CREATE USER '用户名'@'主机' IDENTIFIED BY '密码';  # 创建用户
        GRANT ALL on *.* TO '用户名'@'主机' WITH GRANT OPTION;  # 授权
    
    2. 修改密码
        f1. update user set authentication_string=password('密码') where user="name";
        f2. alter user '用户名'@'主机' identified with mysql_native_password by '密码';
    
    3. 查看权限
        show grants;  # 查看当前用户的权限
        show grants for '用户名'@'主机';  # 查看指定用户权限
    
    4. 回收权限
        revoke all privileges on *.* from 'abc'@'localhost';  # 回收abc的所有权限
        revoke grant option on *.* from 'abc'@'localhost';  # 回收abc的权限传递
    
    5. 删除用户
        use mysql;
        select host, user from user;
        drop user '用户名'@'%';

数据库操作
    1. 创建数据库
    create database [if not exists] `数据库名` charset='utf8mb4'
        如果多次创建会报错
        如果不指定字符编码,默认utf8(一个汉族占四个字节)
        给数据库命名一定要习惯加上反引号,防止和关键字冲突
    2. 查看数据库
        show databases;
    3. 选择数据库
        use `数据库名`;
    4. 创建数据库
        create database `数据库名`;
    5. 修改数据库
        # 只能修改字符集
        alter database `数据库名` charset='字符集';
    6. 删除数据库
        drop database [if exists] `数据库名字`;

表的操作
    1. 表的创建
        create table [if not exists] `name` (
            id int null auto_increment primary key comment '主键',  # int类型的字段id,主键自增
            account char(255) comment '用户名' default 'admin',
            pwd text(16383) comment '密码' not null  # 至少要写字段的名字以及类型
        )charset=utf8mb4;   # 字符集如果不指定,默认继承库的字符集
    2. 查看表(选择数据库后才能查看表)
        show tables;
        show create table `name`;
    3. 删除表
        drop table [if exists] `name`
    4. 显示表结构
        desc `表名`;
        describe `name`;
    5. 修改表
        alter table `old_name` rename `new_name`;  # 修改表名
        alter table `name` rename to 数据库名.表名;  # 移动表到指定数据库
    6. 修改字段
        添加
            alter table `name` add '字段名` 数据类型 [属性];  # 添加一个新字段
            alter table `name` add `字段名` 数据类型 [属性] first;  # 添加一个新的字段并放到首位
            alter table `name` add `字段名` 数据类型 [属性] after 指定字段;  # 添加一个新的字段,并放到指定字段后

        修改
            alter table `name` modify `字段名` 数据类型 [属性];  # 修改属性
            alter table `name` change `原字段名` `新字段名` 数据类型 [属性];  # 修改名称
            alter table `name` change `原字段名` `新字段名` 数据类型 after `指定字段`;

        删除
            alter table `name` drop `字段名`;

操作数据
    增: Create
        insert语句来插入数据
            insert into <table_name>(key1,key2.....) value(v1,v2....)(...)(...)...
            insert into <table_name> value(v1,v2....)  # 如果省略字段,value必须一一对应
        
    查: Read
        select 语句来查询数据
            select * from <表名>  # 查询所有
            select <字段名> from <表名>  # 查询指定字段
        select配合where或having
            select * from students where name="tony";
            select * from students having name="tony";

    改: Update
        update语句来修改数据(一般配合where来进行条件判断)
        update <table_name> set 属性名=属性值 where 条件

    删: Delete
        delete 语句用来删除数据(一般配合where使用)
        delete from <table_name> where 条件
        delete from <table_name>   # 删除所有数据(一行一行删)
        truncate <table_name>  # 清空表格(直接清空)

    复制表格
        1. (不建议使用此法, 属性会改变)create table <new_name> select * from <old_name>  # 创建新表,并将旧表里的数据复制到表1
        2. create table <new_name> like <old_name>  # 复制表的字段和属性,不复制数据
           install into <new_name> select * from <old_name>  # 复制数据

校对集
    查看校对集
        show character set;  # 查看字符集和校对集
        show collation;  # 查看所有校对集
    
    指定校对集
    create table t1(
        str char(1)
    ) charset=utf8mb4 collation=utf8mb4_general_ci;  # ci不区分大小写，cs区分，bin二进制
    







