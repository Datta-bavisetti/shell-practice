#!/bin/bash

#To install any package, we have to run with sudo access. But not all the users use the same. So, let's validate
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user"
    exit 1
fi


INSTALL(){
if [ $1 -ne 0 ]; then
    echo "$2...FAILURE"
    exit 1
else
    echo "$2...SUCCESS"
fi

}

echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing Nginx...FAILURE"
    exit 1
else
    echo "Installing Nginx...SUCCESS"
fi

echo "Installing MySQL"
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing mysql...FAILURE"
    exit 1
else
    echo "Installing mysql...SUCCESS"
fi

echo "Installing python"
dnf install python -y

if [ $? -ne 0 ]; then
    echo "Installing python...FAILURE"
    exit 1
else
    echo "Installing python...SUCCESS"
fi