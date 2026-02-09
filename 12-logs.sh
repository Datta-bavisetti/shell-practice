#!/bin/bash

#To install any package, we have to run with sudo access. But not all the users use the same. So, let's validate
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user"
    exit 1
fi

mkdir -p $LOGS_FOLDER

INSTALL(){
if [ $1 -ne 0 ]; then
    echo "$2...FAILURE" 
else
    echo "$2...SUCCESS" 
fi
}

dnf install nginx -y &>> $LOGS_FILE
INSTALL $? "Installing Nginx" 

dnf install mysql -y &>> $LOGS_FILE
INSTALL $? "Installing MySQL" 

dnf install python -y &>> $LOGS_FILE
INSTALL $? "Installing python" 