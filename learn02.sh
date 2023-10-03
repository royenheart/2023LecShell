#!/bin/bash

# set -x # shell script 开启 DEBUG 模式，会把所有执行的语句对应的命令打印出来，方便进行调试
set +e # shell script 在命令执行错误时不退出，相反就设置为 set -e，避免错误滚雪球导致更大的错误

# @author: RoyenHeart
# @description: shell script 变量的使用
# 和大多数语言一样，shell script 同样可以使用变量

# 普通变量，注意 = 号前后不能加空格
var1="Hello World"
# 变量引用，当处在 '' 单引号时，$name 不解析为变量
# 使用 \ 反斜杠，对 " 双引号转义，使其被 echo 识别为普通字符进行输出
# 花括号括住变量名，可以使程序可读性提高，也能避免因为后接符号使得变量名解析错误，推荐使用
echo "this is var1: $var1 in \"\""
echo "this is var1 using {}: ${var1} in \"\""
echo 'this is var1: $var1 in '"'""'"

# 执行 `` 或 () 内的语句，并将语句的输出结果赋值给变量
var2=`ls`
var3=$(ls -al)
echo "var2 is : $var2"
echo "var3 is : $var3"

# 设置只读变量
rdonly_var="genshin impact"
readonly rdonly_var
rdonly_var="arknights"

# 删除变量，对只读变量无用
unset var2
echo "After unset, var2 is $var2"

# shell script 变量类型
echo $HOME # 环境变量，从父进程继承
echo "The return code of last command: $?" # shell 变量，由 shell 程序设置的特殊变量，可以侦测程序执行情况等
echo "The pid of process of this shell script: $$"
echo "The Flag set by 'set' command: $-"
echo "The params passed to the shell script process, output as \"\$1 \$2 \$3 ....\": $*"
echo "The params passed to the shell script process, output as \"\$1\" \"\$2\" \"\$3\" ....: $@"
echo "The number of params passed to the shell script process: $#"
echo "The filename of shell script itself: $0"
echo "The param: $1 $2 etc."
echo "Local var is: $var1" # 局部变量，在当前 shell script process（实例）中有效。

# export 和 source 的使用
# export 使得设置的环境变量对于该 shell 进程的子进程生效
# source 把 source 后面跟的命令在当前运行进程环境中执行
echo "Define LEARN02 without export/Call sublearn02 without source"
LEARN02="Hello RoyenHeart"
chmod u+x ./sublearn02.sh && ./sublearn02.sh
echo "Define LEARN02 with export/Call sublearn02 without source"
export LEARN02="Hello RoyenHeart"
chmod u+x ./sublearn02.sh && ./sublearn02.sh
unset LEARN02
echo "Define LEARN02 with export/Call sublearn02 with source"
export LEARN02="Hello RoyenHeart"
chmod u+x ./sublearn02.sh && source ./sublearn02.sh
unset LEARN02
echo "Define LEARN02 without export/Call sublearn02 with source"
LEARN02="Hello RoyenHeart"
chmod u+x ./sublearn02.sh && source ./sublearn02.sh

# shell script 字符串
str1="Hello World"
echo "str1: $str1"

# shell script 数组
arr1=("Hello" "Genshin")
arr2=(
    "Hello"
    "Rainbow"
    "Dash"
)
echo "arr1 first element is ${arr1[0]}"
echo "arr1 all elements are ${arr1[@]}"
for i in ${arr2[@]}; do
    echo $i
done