#!/bin/bash
#Get current date
currentdate=$(date +%y%m%d)
#Find user expiration date
userexp=$(chage -l $1 | awk  '/^Password expires/ { print $NF}')

passexp=$(date -d "$userexp" "+%y%m%d")

if [[ $userexp != never ]]
then
       (( exp =  passexp - currentdate  ))

       if (( exp <=  5 ))
           then
               echo "You have $exp days left or less to change your password"
       fi
           else
       echo "Your password is set to never expire"
fi