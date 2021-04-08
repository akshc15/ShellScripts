#!/bin/bash
#this script will filter ip based on ping and will save them in 2 files 
#there should be a file named ip having all ips in it as input
for i in `cat ip`
do
	ping -c 3 $i &> /dev/null
	if  [ $? -ne 0 ]; then
		echo $i failed
		echo $i >> failed_ip
	else
		echo $i running
		echo $i >> running_ip
	fi
done
