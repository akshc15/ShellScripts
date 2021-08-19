#!/bin/bash


### Author : Akshay C.
#  This is the script to recover mistakely deleted script\####
##  Codition 1 : File or script must be running in background or must be scheduled in crontab  ###
## Enter exact correct name with extenstion to get better result ##

echo -e "\033[32mEnter File Name That Is DELETED And You Want To Recover:\033[m"
read a
## In a we have taken file name that we want to recover for input to do further process #

## In n we will save the PID of the script that is running and deleted
n=`ps -ef | grep "$a" | head -1 | awk '{print $2}'`
### As we will recover from temp files we will concatenate the file ##
#ls -l /proc/$n/fd
cat /proc/$n/fd/255

cat /proc/$n/fd/255 > /root/Akshay/RECOVERED/`ps -ef | grep "$a" | head -1 | awk '{print $9}'`
echo -e "\033[32mRECOVERED FILE IS STORED IN root/Akshay/RECOVERED/\033[m"


##Thank YOU###
