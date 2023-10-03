#!/bin/bash

# @author: RoyenHeart
# @description: 第一个 shell script
# shell script, shell 脚本，是一种脚本程序，shell ≠ shell script
# 使用 shell 脚本可以做很多自动化的事情，其本身也可以作为一个可执行程序加载到用户环境变量中使用
# 这里的教程以 bash script 为例

# 这是注释
### 这也是注释
:<<EOF
这也是注释
EOF
: '
这同样是注释
'
echo "Hello Navi" # 这里还是注释

# 试着运行它：
# > chmod u+x learn01.sh && ./learn01.sh
# > /bin/bash ./learn01.sh