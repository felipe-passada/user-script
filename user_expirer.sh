#!/bin/bash
# 

#Get current date
currentdate=$(date +%s)

# find expiration date of user
userexp=$(chage -l isadmin | awk '/^Password expires/ { print $NF }')

# convert expiration date to seconds
passexp=$(date -d "$userexp" "+%s")

if [ $passexp != "never" ]
then
    # find the remaining days for expiry
    (( exp = passexp - currentdate))

    # convert remaining days from sec to days
    (( expday =  exp / 86400 ))

    if ((expday < 10 ))
    then
        echo "Your password gonna expire, please change as soon as possible!!!"
    fi
fi