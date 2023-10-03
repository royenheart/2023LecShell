#!/bin/bash

# set -x # shell script 开启 DEBUG 模式，会把所有执行的语句对应的命令打印出来，方便进行调试
set +e # shell script 在命令执行错误时不退出，相反就设置为 set -e，避免错误滚雪球导致更大的错误

# @author: RoyenHeart
# @description: shell script 流程控制和函数
# 和很多编程语言一样，shell script 同样支持 if/while/until/switch..case 流程控制以及函数声明与调用
# 我们可以使用这些来简化很多操作

# 函数声明

function parse_params() {
    while [[ $# -ne 0 ]]; do
        case $1 in
            "help")
                echo "get param help"
                # shift 进行参数的移动，销毁第一个参数，将后面的参数往前移动 
                shift
                ;;
            "Genshin")
                echo "Start!"
                shift
                ;;
            *)
                echo $1
                shift
                ;;
        esac
    done
}

# 控制语句，可以使用 break 跳出循环或 continue 继续下一轮循环

i=1
l=("Hello" "Lain")
while [[ $i -lt 10 ]]; do
    echo "Hello $i"
    i=$(expr $i + 1)
done

for t in ${l[@]}; do
    echo $t
done

if [[ $i -eq 10 ]]; then
    echo "Loop While execute successfully"
else 
    echo "Loop While execute failed"
fi

until [[ $i -le 1 ]]; do
    echo "Olleh $i"
    i=$(expr $i - 1)
done

# 调用函数，可以对函数传参
parse_params $*