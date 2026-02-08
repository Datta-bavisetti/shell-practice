#!/bin/bash

#To install any package, we have to run with sudo access. But not all the users use the same. So, let's validate
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user"
    exit 1
fi
    
echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing Nginx...FAILURE"
    exit 1
else
    echo "Installing Nginx...SUCCESS"
fi