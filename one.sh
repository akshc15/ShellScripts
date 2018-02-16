#!/bin/bash

#installing yum 
#ask user the path for yum data/repo
function yum 
{
echo "Enter full path for yum configuration:"
read path
`yum-config-manager --add-repo=$path`
echo "yum installed succcessfully"
echo "manually manage "gpgcheck""
}

##installing apache server packages
function apache 
{
echo "enter yes to install apache:"
read ans
if [ $ans == yes ] || [ $ans ==YES]
then
`yum install httpd httpd-manual -y`
echo "Apache packages installed successfully"
elif [ $ans == no ] || [ $ans == NO ]
then
echo "Apache will NOT be installed"
else
echo "wrong choice"
fi
}

#status of services
function statu
{
echo "select the services to check status OR to add exception in firewall"
echo "1.HTTP/apache"
echo "2.ENABLE / START HTTPD Serive"
echo "3.ADD service to firewall"
read ch
if [ $ch == 1 ]
then
op=`systemctl status httpd | grep Active`
echo "$op"
elif [ $ch == 2 ]
then
`systemctl enable httpd`
`systemctl start httpd`
echo "DONE Check status"
elif [ $ch == 3 ]
then
echo "Enter the service name:"
read ser
add=`firewall-cmd --permanent --add-service=$ser`
echo "$add"
else
echo "wrong choice"
fi
}

echo "##Enter the choice:##"
echo "1.Configure YUM"
echo "2.Install APACHE"
echo "3.Check status of apache OR ADD service to firewall"
read ip
if [ $ip == 1 ]
 then
 yum 
 elif [ $ip == 2 ]
 then
 apache
 elif [ $ip == 3 ]
 then
 statu
 else
 echo "wrong choice"
fi
