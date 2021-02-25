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

left&right join: 左(右)连接
    left join 关键字从左表(table1)返回所有行,
    即使右表没有匹配,如果右表没有匹配,返回null

    语法
        select column_name(s)
        from table1
        left join table2
        on table1.column_name=table2.column_name;
        或
        select column_name(s)
        from table1
        left outer join table2
        on table1.column_name=table2.column_name;

full join: 全连接(MySQL不支持)
    FULL join的连接方式是
    只要table1和table2其中一个表存在匹配,则返回行.
    相当于结合left join&right join的结果

    语法
        select column_name(s)
        from table1
        full join table2
        on table1.column_name=table2.column_name;

子查询
    查询语句里还有一个查询
    select name from
    student where
    id in
    (select id from scor wheere math > 10)

视图表
    视图是数据的特定子集，是从其他表里提取出数据而形成的虚拟表，或者说临时表。
    创建视图表依赖一一个查询。
    视图是永远不会自己消失的除非手动删除它。
    视图有时会对提高效率有帮助。临时表不会对性能有帮助，是资源消耗者。
    视图般随该数据库存放在一起，临时表永远都是在tempdb里的。
    视图适合于多表连接浏览时使用,不适合增、删、改,这样可以提高执行效率。
    一般视图表的名称以V_为前缀,用来与正常表进行区分。
    对原表的修改会影响到视图中的数据。

    创建
        语法: create view 视图表 as 查询语句

        creat algorithm=temptable view v_exam as
        select max(math) from
        student inner join score
        on student.id=scor.id
        group by city

    删除
        drop VIEW 视图表
    修改
        视图表能否被修改,依赖于创建视图表时的算法值
        algorithm 有三个可选值
        undfined merge temptable 
        默认位undefined,效果是允许修改
        merge 和undefined效果一致
        temptable 是不允许修改的



    