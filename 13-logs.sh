#!/bin/bash

#To install any package, we have to run with sudo access. But not all the users use the same. So, let's validate
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

UNINSTALL(){
if [ $1 -ne 0 ]; then
    echo "$2...FAILURE" | tee -a $LOGS_FILE
    exit 1
else
    echo "$2...SUCCESS" | tee -a $LOGS_FILE
fi
}

dnf remove nginx -y &>> $LOGS_FILE
UNINSTALL $? "Removing Nginx" 

dnf remove mysql -y &>> $LOGS_FILE
UNINSTALL $? "Removing MySQL" 

dnf remove python -y &>> $LOGS_FILE
UNINSTALL $? "Removing python"