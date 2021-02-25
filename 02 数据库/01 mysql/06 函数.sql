聚合函数
    AVG()                       返回参数的平均值
    BIG_AND()                   按位返回AND
    BIG_OR()                    按位返回OR
    BIG_XOR()                   按位返回XOR
    COUNT()                     返回行数
    COUNT(DISTINCT)             返回不同值的个数
    GROUP_CONCAT()              返回连接的字符串
    JSON_ARRAY()                将结果作为单个JSON数组返回
    JSON_OBJECT()               将结果作为单个JSON对象返回
    MAX()                       返回最大值
    MIM()                       返回最小值
    STD()                       返回样本标准差
    STDDEV()                    返回样本标准差
    STDDEV_POP()                返回样本标准差
    STDDEV_SAMP()               返回样本标准差
    SUM()                       求和
    VAR_POP()                   返回样本的标准异差
    VARIANCE()                  返回样本的标准异差
    VAR_SAMO()                  返回样本方差

数值计算类函数
    ABS(x)              绝对值
    CEIL(x)             向上取整
    FLOOR(x)            向下取整
    MOD(x, y)           取x/y的模
    RAND()              0~1随机数
    ROUND(x, y)         x四舍五入的有y位小数的值
    TRUNCATE(x,y)       返回x截断为y位小数的结果

日期计算类函数
    CURDEATE()                              当前日期
    CURTIME()                               当前时间
    NOW()                                   当前日期和时间
    UNIX_TIMESTAMP(data)                    返回日期date的unix时间戳
    FROM_UNIXTIME()                         返回unix时间戳的日起值
    WEEK(date)                              返回date位一年中的第几周
    YEAR(date)                              返回年份
    HOUR(time)                              反击小时值
    MINUTE(time)                            返回分钟值
    MONTHNAME(date)                         返回月份名
    DATE_FORMATE(date, fmt)                 返回按字符串fmt 格式日期date值
    DATE_ADD(date, INTERVAL expr type)      返回一个日期或时间加上一个时间间隔的时间值
    DATEDIFF(expr, expr2)                   返回起始时间expr和结束时间expr2之间的天数

字符串相关的函数
    CANCAT(S1,S2,S3....Sn)          连接S1,S2,S3....Sn为一个字符串
    INSERT(str,x,y,instr)           将字符串str从第x位置开始，y个字符长的子串替换为字符串instr
    LOWER(str)                      将字符串str 中所有字符变为小写
    UPPER(str)                      将字符串str 中所有字符变为大写
    LEFT(str,x)                     返回字符串str最左边的x个字符
    RIGHT(str,x)                    返回字符串str最右边的x个字符
    LPAD(str,n,pad)                 用字符串pad对str最左边进行填充，直到长度为n个字符长度
    RPAD(str,n,pad)                 用字符串pad对str最右边进行填充，直到长度为n个字符长度
    LTRIM(str)                      去掉字符串str 左侧的空格
    RTRIM(str)                      去掉字符串str行尾的空格
    REPEAT(str,x)                   返回str重复x次的结果
    REPLACE(str,a,b)                用字符串b替换字符串str 中所有出现的字符串a
    STRCMP(s1,s2)                   比较字符串s1和s2
    TRIM(str)                       去掉字符串行尾和行头的空格
    SUBSTRING(str,x,y)              返回从字符串strx位置起y个字符长度的字串

其他函数
    DATABASE()              返回当前数据库名
    VERSION()               返回当前数据库版本
    USER()                  返回当前登录用户名
    INET_ATON(IP)           返回IP地址的数字表示
    INET_NTOA(num)          返回数字代表的IP地址
    PASSWORD(str)           返回字符串str 的加密版本  -- 8.0以后没有了
    MD5()                   返回字符串str的MD5值
