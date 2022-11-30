#!/bin/bash
git status
sleep 3
echo "-------Begin-------"
if [ ! $1 ]; then
    read -r -p "Please input your Video commit message: " input
else
    input=$1
fi

git add -A
if [ $input ]; then
    git commit -am $input
else
    git commit -am "自动化代码提交"
fi
git push -f


echo "--------End--------"
