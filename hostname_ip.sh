#!/bin/bash

#create file name ip with all IPs in it
#create file hostname with all respective hostnames in it
##if servers are passwordless from host machine then will be very easy to work with this script###

index_array=(`cat ip`)
index_array2=(`cat hostname`)
len=${#index_array[@]}

for (( i=0; i<$len; i++ ));
do
ssh root@${index_array[$i]} hostnamectl set-hostname ${index_array2[$i]} --static
done
