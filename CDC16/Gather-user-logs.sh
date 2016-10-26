#!/usr/bin/env bash

echo "test"
## BELOW THIS POINT - user specific
#cat ~/.bash_history > $(whoami)-bash_history.txt
#if [ $? -eq 0 ]; then
#    echo "Good:bash_history obtained"
#else
#    echo "Failed"
#fi

for i in $(ls)
do
    echo "$i"
done