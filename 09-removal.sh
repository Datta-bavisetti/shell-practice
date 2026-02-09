#!/bin/bash

#To install/remove any package, we have to run with sudo access. But not all the users use the same. So, let's validate
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user"
    exit 1
fi
    
echo "Removing Nginx"
dnf remove nginx -y

if [ $? -ne 0 ]; then
    echo "Removing Nginx...FAILURE"
    exit 1
else
    echo "Removing Nginx...SUCCESS"
fi

echo "Removing MySQL"
dnf remove mysql -y

if [ $? -ne 0 ]; then
    echo "Removing mysql...FAILURE"
    exit 1
else
    echo "Removing mysql...SUCCESS"
fi

echo "Removing python"
dnf remove python -y

if [ $? -ne 0 ]; then
    echo "Removing python...FAILURE"
    exit 1
else
    echo "Removing python...SUCCESS"
fi