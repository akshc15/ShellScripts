#!/bin/bash
##Script by Akshay Chetule to Monitor changes in mount points 
##and after some limit to get email notification
##to automate monitoring easily and get logs do following steps first
##1.create files log, log2 ,nochange,nochange2 at /root/ location
##2.create a cronjob for perticalar time or with all * so that this script will run all time


##usage for  /test /dev/xvda3

data1=` df | grep /dev/xvda3 | awk '{print $5}' | cut -d"%" -f1`

##usage for / /dev/xvda2

data2=` df | grep /dev/xvda2 | awk '{print $5}' | cut -d"%" -f1`

##condition and mail for /test

if [ $data1 -gt 2 ] || [ $data1 -lt 2 ]
then
#mail using mail command and service
#echo "The usage for /test = $data1 %" | `mail -s "Usage change in /test:" user@domain.com`
#mail using sendmail service
echo "The usage for /test = $data1 %" | `sendmail user@domain.com`
echo "change in usage for /test at `date | awk '{print $2 " " $3 " " $4}'` = $data1" >> /root/log
else
echo "There is no change Usage at `date | awk '{print $2 " " $3 " " $4}'` is = $data1 %" >> /root/nochange 
fi

##condition and mail for /
if [ $data2 -gt 13 ] || [ $data2 -lt 13 ]
then
#mail using mail command and service
#echo "The usage for / = $data2 %" | `mail -s "Usage change in /:" user@domain.com`
#mail using sendmail service
echo "The usage for / = $data2 %" | `sendmail user@domain.com`
echo "change in usage for / at `date | awk '{print $2 " " $3 " " $4}'` = $data2" >> /root/log2
else
echo "There is no change Usage at `date | awk '{print $2 " " $3 " " $4}'` is = $data2 %" >> /root/nochange2 
fi
