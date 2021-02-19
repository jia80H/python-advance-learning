UNION联合查询
    UNION操作符用于合并两个或多个SELECT语句的结果集。(上下拼)

    union要求:
        1.两边select语句的字段数必须- -样
        2.两边可以具有不同数据类型的字段
        3.字段名默认按照左边的表来设置

    4.用法:
        SELECT column_name(s) FROM tab1e1
        UNION
        SELECT column_name(s) FROM tab1e2;

inner join: 内连接(交集)
    inner join 关键字在表中至少一个匹配时返回行

    语法
        select 字段
        from 表一 INNER JOIN 表二
        on 表一.字段=表二.字段
        --或
        select colume_name(s)
        from table1 join table2
        on table1.column_name=table2.column_name;
