-- 1. SELECT : 字段表达式
    select 既可以查询, 也可以输出

    select rand();  --随机数
    SELECT unix_timestamp();  --显示unix时间戳
    SELECT id, name FROM student;

-- 2. FROM 子句

    语法: select 字段 from 表名;

    FROM 后边时数据源,数据源可有多个,
    数据源一般是表名,也可以是其他查询的结果

    select student.name, score.match FROM student, score;

-- 3. where 子句: 按指定条件过滤
    语法: select 字段 from 表名 where 条件;

    where 是做条件查询,只返回结果为True的数据
    SELECT name from student where city = '上海';
    可以用来判断空值 范围

--4. having
    与where类似