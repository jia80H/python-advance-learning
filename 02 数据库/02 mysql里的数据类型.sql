整数
    整数类型    字节       有符号min    无符号min      有符号max    无符号max
    tinyint     1           -128          0             127         255
    smallint    2
    mediumint   3
    int integer 4
    bigint      8

    实例
        创建一个无符号tinyint类型
            create table t3(
                age tinyint unsignd
            )

        显示宽带, 位数不足用0填充
            create table t4(
                id int(10) zerofill primary key AUTO_INCREMENT ,
                name char(32)
            )
            insert into t4 value(12345, '5个')
            insert into t4 value(1234567890, '10个')
            insert into t4 value(12345789012, '12个')

浮点型
    FLOAT 字节4     DOUBLE 字节8
    DEC(M,D) 或 DECIMAL(M,D)  字节M+2  
        最大取值范围与double相同,
        给定 DECIMAL 的有效取值范围由M和D决定
        M是支持多少个长度, D是小数点后面的位数

    BIT(M)  字节 1~8    最小值 BIT(1)   最大值 BIT(64)

    create table t5 (
        a FLOAT(10, 2),
        b DOUBLE(10, 2),
        c DECIMAL(10, 2)
    )

字符串类型
    CHAR(n) 固定占n位，不足用空格补全
    VARCHAR(n) 删除结尾空格,加上一个字节用来记录位长,不固定所占字节,拿出有键入的空格
    TEXT LONGTEXT 当有大量数据时使用(博客等)
    BLOB 非文字信息

枚举
    多选一的时候使用的一种数据类型
    create table t6(
        name VARCHAR(32),
        sex enum('男', '女', '保密') DEFAULT '保密'
    );

    insert INTO t6 set name='jack', sex=1

集合(不常用)
    set 最多可有64个不同的成员.类似于复选框

    create table t7 (
        name VARCHAR(32),
        hobby ser('吃', '喝', '玩', '乐')
    );

    insert INTO t7 value('张三','吃,喝')

时间
    时间和时间类型      字节        最小值              最大值
    DATE                4       1000-01-01          9999-12-31
    DATETIME            8    1000-01-01 00:00:00    9999-12-31 23:59:59
    TIMESTAMP           4    1970101080001          2038年的某个时刻
    TIME                3    -838:59:59             838:59:59
    YEAR                1       1901                2155

    1.DATETIME
    create table DATETIME_test (
        create_at DATETIME
    );

    INSERT into DATETIME_test value('2021/2/17 19:54:00')
    INSERT into DATETIME_test value('2021-2-17 19:54:00')
    INSERT into DATETIME_test value(now());

    时间戳传入时间也是'2021-2-17 19:59:00'

布尔类型
    True Fale
    其实是以int类型存储 0~127
    0 为Fale    非0为True
