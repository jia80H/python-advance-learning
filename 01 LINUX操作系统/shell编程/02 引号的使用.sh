#!/bin/bash

a=10  # shell里定义了一个变量a, 它的值是10,
# 注意: 等号两端不能有空格

echo 下午好$a  #
echo "good$a"
echo 'hi$a'  # 单引号里的内容会原样输出
echo `whoami`  # 反引号里的内容是Linux命令