#!/bin/bash

check_key="{{ pillar['secretkey'] }}"

if [ -f "/grdata/.check" ];then
    cat /grdata/.check | grep "$check_key" > /dev/null
    if [ "$?" -eq 0 ];then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi