#!/bin/bash
if ls /;then  # if 可以用来执行一个命令
    echo 'success'  # 如果命令执行成功,执行这个语句
else
    echo 'faile'  # 如果执行失败,执行这个语句
fi

# 条件测试

# 数值比较
# >:-gt <:-lt >=:ge <=:le =:eq
if [ 3 -gt 2 ];then  # 中括号里加条件;中括号内两侧都需要空格
    echo '3 > 2'
else
    echo '3 <= 2'
fi

#.....不想学了
# 还要case语句 循环语句 函数 数组
# 有需要时面向Google等即可