#!/bin/bash

# set -x # shell script 开启 DEBUG 模式，会把所有执行的语句对应的命令打印出来，方便进行调试
set +e # shell script 在命令执行错误时不退出，相反就设置为 set -e，避免错误滚雪球导致更大的错误

# @author: RoyenHeart
# @description: shell script 基本运算符
# shell script 可以通过运算符来判断两个变量是否相等，大于等于，进行相加相减等等操作
# 原生 bash 不支持简单数学运算，可以使用 expr 命令实现运算

# 主要包括以下几类运算符：
# 1. 算数运算符

num1=$(expr 1 + 4)
echo "num1 is ${num1}"

num2=$(expr $num1 - -1)
echo "num2 is ${num2}"

num2=$(expr $num1 \* 2)
echo "num2 is ${num2}"

num2=$(expr $num1 / 1)
echo "num2 is ${num2}"

num2=$(expr $num1 % 2) # 取余
echo "num2 is ${num2}"

num2=$num1
echo "num2 is ${num2}"

echo "now num1 ${num1} and num2 is ${num2}"

if [[ $num1 == $num2 ]]; then
    echo "num1 equal to num2"
else
    echo "num1 not equal to num2"
fi

if [[ 4 != 3 ]]; then
    echo "4 != 3 is true"
else
    echo "4 != 3 is false"
fi

# 2. 关系运算符

if [[ 4 -eq 3 ]]; then # equal
    echo "4 == 3 is true"
else
    echo "4 == 3 is false"
fi

if [[ 4 -ne 3 ]]; then # not equal
    echo "4 != 3 is true"
else
    echo "4 != 3 is false"
fi

if [[ 4 -gt 3 ]]; then # greater than
    echo "4 > 3 is true"
else
    echo "4 > 3 is false"
fi

if [[ 4 -lt 3 ]]; then # less than
    echo "4 < 3 is true"
else
    echo "4 < 3 is false"
fi

if [[ 4 -ge 3 ]]; then # greater than or equal to
    echo "4 >= 3 is true"
else
    echo "4 >= 3 is false"
fi

if [[ 4 -le 3 ]]; then # less than or equal to
    echo "4 <= 3 is true"
else
    echo "4 <= 3 is false"
fi

# 3. 布尔运算符

if [[ ! 4 -le 3 ]]; then
    echo "not 4 <= 3 is true"
else
    echo "not 4 <= 3 is false"
fi

## -o 和 -a 不支持 [[ expr... ]] 写法

if [ 4 -le 3 -o 10 -gt 9 ] # or
then
    echo "4 <= 3 or 10 > 9 is true"
else
    echo "4 <= 3 or 10 > 9 is false"
fi

if [ 4 -le 3 -a 10 -gt 9 ] # and
then
    echo "4 <= 3 and 10 > 9 is true"
else
    echo "4 <= 3 and 10 > 9 is false"
fi

# 4. 逻辑运算符

if [[ 4 -le 3 || 10 -gt 9 ]]; then # logic or
    echo "4 <= 3 or 10 > 9 is true"
else
    echo "4 <= 3 or 10 > 9 is false"
fi

if [[ 4 -le 3 && 10 -gt 9 ]]; then # logic and
    echo "4 <= 3 and 10 > 9 is true"
else
    echo "4 <= 3 and 10 > 9 is false"
fi

# 5. 字符串运算符

if [[ "Hello" = "Hello" ]]; then
    echo "\"Hello\" = \"Hello\" is true"
else
    echo "\"Hello\" = \"Hello\" is false"
fi

if [[ "Hello" != "Hello" ]]; then
    echo "\"Hello\" != \"Hello\" is true"
else
    echo "\"Hello\" != \"Hello\" is false"
fi

if [[ -z "Hello" ]]; then
    echo "length of str \"Hello\" is 0 is true"
else
    echo "length of str \"Hello\" is 0 is false"
fi

if [[ -n "Hello" ]]; then
    echo "length of str \"Hello\" is not 0 is true"
else
    echo "length of str \"Hello\" is not 0 is false"
fi

if [[ "Hello" ]]; then
    echo "str \"Hello\" is not null is true"
else
    echo "str \"Hello\" is not null is false"
fi

# 6. 文件测试运算符
# 用于检测文件是否存在，文件类型等
# 这里只测试部分运算符

if [[ -s sublearn02.sh ]]; then
    echo "sublearn02.sh not null(size > 0)"
else
    echo "sublearn02.sh null(size = 0)"
fi

if [[ -e sublearn02.sh ]]; then
    echo "sublearn02.sh exists"
else
    echo "sublearn02.sh not exists"
fi

if [[ -d sublearn02.sh ]]; then
    echo "sublearn02.sh is a folder"
else
    echo "sublearn02.sh is not a folder"
fi