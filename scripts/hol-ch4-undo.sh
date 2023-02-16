#!/bin/bash

#Undo account and folder creation for chapter4

# remove users
tail -2 /etc/passwd
userdel -rf laura
userdel -rf linda

tail -2 /etc/passwd

# remove groups
tail -2 /etc/group
groupdel sales
groupdel account

tail -2 /etc/group
# remove folders
rm -rf /data/sales
rm -rf /data/account


echo "Clean up complete"


