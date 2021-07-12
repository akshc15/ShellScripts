#!/bin/bash
###This is to make multiple servers passwordless from server (base machine) #
##create file named ip and paste all ip in that file##
for i in $(cat ip); do echo $i; sshpass -p password ssh -o StrictHostKeyChecking=no $i exit; sshpass -p password ssh-copy-id $i; done
