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
    与where类似，
    但是having要求过滤的条件字段必须在select中搜索,where不要求
    having可以使用select里命名的别名,where不可
    having可以使用聚合函数,where不可

--5. GROUP BY : 分组查询
    按照某一字段进行分组,会把该字段中值相对的归为一组, 将查询结果分类显示, 便于统计
    如果有where要放在where后面

    语法: select 字段from 表名  GROUP BY 分组字段;

    select sex,count(id) from student GROUP BY sex;
    -- 在group将需要的结果通过"聚合函数"拼接
    select sex, group_concat(name) from student GROUP BY sex;

--6. ORDER BY : 按字段排序
    ORDER BY 主要作用是排序
    ORDER BY 写在 GROUP BY 后边, 如果有 having 也要写在 having 的后面

    语法: select 字段 from 表名 ORDER BY 排序字段 asc|desc;

        分为升序 asc 降序 desc, 默认 asc (可以不写)
    
    select * from student ORDER BY age;
    select * from student ORDER BY age DESC ;
    select city,avg(money),group_concat(name),sum(money)
    from student GROUP BY city HAVING sum(money)>70
    ORDER BY sum(money);

-- 7. LIMIT : 限制取出数量

    select 字段 from 表名 limit m;  -- 从第1行到第m行
    select 字段 from 表名 limit m,n;  -- 从第m行到第n行
    select 字段 from 表名 limit m offset n;  -- 跳过前 n 行, 取后面的m行

--8. DISTINCT : 去重
    select distinct city from student;

-- 9. dual表
    dual 是一个虚拟表,仅仅为了保证 select ... from ... 语句的完整性

    select now() dual;














