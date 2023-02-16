#!/bin/bash

# This script is to create the enviroment for the Cert-Together RHCSA Hands-on labs we do each session. So as not to repeat ourselves, here is a script that will build out the expected environment

# run from a root shell,but be sure to set their passwords to redhat  once the script is complete. 

#Create Directory Structure
mkdir -p /data/sales /data/account
# Check that directories are created

echo "Directories Created"
ls -l /data
sleep 2
# Create users
useradd linda
useradd laura
# check users exist
tail -2 /etc/passwd
sleep 2
# check that groups exist
groupadd sales
groupadd account
tail -2 /etc/group
sleep 2
# add user to group
usermod -aG sales laura
id laura
id linda
sleep 2
# change ownership on the folder
chown linda:sales /data/sales
chown linda:account /data/account

ls -l /data
sleep 2
# set the permissions to deny other and allow user:group owner
chmod 770 /data/sales
chmod 770 /data/sales

ls -l /data

echo "Be sure to set linda and laura's password to redhat before proceeding"
sleep 2
exit 0
