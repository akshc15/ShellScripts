#!/bin/bash

##Create file Named ip_list and add all server IP (Should be in same Directory)##
ips=ip_list
/bin/bash -e "/e[1;32m@@@@@STARTING  TO PING IPS PROVIDED@@@@@@\e[0m"
for i in `cat ips`
do
ping $i -c 1 >> /dev/null
if [ `echo $?` -eq 0 ]
then
echo "$i pinged"
else
echo "$i not pinging"
fi
done
