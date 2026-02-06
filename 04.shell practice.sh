#!/bin/bash

#This script will give an over view how "read" command works!
echo "Welcome to Online shopping Website"
echo "=================================="
echo " Please enter User Name: "
read USER_NAME #You can able to see what you are entering
echo " Please enter your Password: "
read -s PASSWORD #This will hide what we are tying on the command line

if [ $PASSWORD == 'datta321' ]; then
    echo "Dear $USER_NAME, enjoy your shopping..!" 
else
    echo " Ooops...Please enter valid credentials next time "
fi

