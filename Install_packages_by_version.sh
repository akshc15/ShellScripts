#!/bin/bash
release=`awk '{print $6}' /etc/redhat-release` 
ver=8
st=`echo "$ver <= $release" | bc`
if [ $st -eq 1 ]; then
        echo "rhel 8"
        yum install tree -y
        echo "tree installed"
else
        echo "rhel7"
        yum install openssh* -y
        echo "sshd installed"
fi
