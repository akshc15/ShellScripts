#!/bin/bash

##usage for  /test /dev/xvda3

data1=` df | grep /dev/xvda3 | awk '{print $5}' | cut -d"%" -f1`

##usage for / /dev/xvda2

data2=` df | grep /dev/xvda2 | awk '{print $5}' | cut -d"%" -f1`

##condition and mail for /test

if [ $data1 -gt 2 ] || [ $data -lt 2 ]
then
#mail using mail command and service
#echo "The usage for /test = $data1 %" | `mail -s "Usage change in /test:" akshay.chetule@gmail.com`
#mail using sendmail service
echo "The usage for /test = $data1 %" | `sendmail akshay.chetule@gmail.com`
echo "change in usage for /test at `date | awk '{print $2 " " $3 " " $4}'` = $data1" >> /root/log
else
echo "There is no change Usage at `date | awk '{print $2 " " $3 " " $4}'` is = $data1 %" >> /root/nochange 
fi

##condition and mail for /
if [ $data2 -gt 13 ] || [ $data2 -lt 13 ]
then
#mail using mail command and service
#echo "The usage for / = $data2 %" | `mail -s "Usage change in /:" akshay.chetule@gmail.com`
#mail using sendmail service
echo "The usage for / = $data2 %" | `sendmail akshay.chetule@gmail.com`
echo "change in usage for / at `date | awk '{print $2 " " $3 " " $4}'` = $data2" >> /root/log2
else
#echo "The usage for / = $data2 %" | `mail -s "Usage change in /:" akshay.chetule@gmail.com`
echo "There is no change Usage at `date | awk '{print $2 " " $3 " " $4}'` is = $data2 %" >> /root/nochange2 
fi
