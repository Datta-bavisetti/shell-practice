#!/bin/bash

#To install any package, we have to run with sudo access. But not all the users use the same. So, let's validate
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user"
    exit 1
fi

UNINSTALL(){
if [ $1 -ne 0 ]; then
    echo "$2...FAILURE"
    exit 1
else
    echo "$2...SUCCESS"
fi
}

dnf remove nginx -y
UNINSTALL $? "Removing Nginx" #Here $? is 1st parameter and "---" is second parameter

dnf remove mysql -y
UNINSTALL $? "Removing MySQL" #Here $? is 1st parameter and "---" is second parameter

dnf remove python -y
UNINSTALL $? "Removing python" #Here $? is 1st parameter and "---" is second parameter