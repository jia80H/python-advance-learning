#!/bin/bash
# 第一行的注释, 电脑在运行脚本时, 会解析, 用来表示默认的脚本命令


# 字符串可以夹银行,也可以不加引号
# 也可以加单引号 双引号甚至反引号(反引号有特殊效果)
# echo用来输出内容
echo "hello"
echo i am `whoami`  # 反引号里的内容, 会被解释成Linux命令
echo i love Linux
echo 'The cpu in my computer has `cat /proc/cpuinfo |grep -c processor` cores'


# bash <脚本名>  执行脚本