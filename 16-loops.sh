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

for package in $@
do
    dnf list installed $package &>> $LOGS_FILE
    echo "$package found, uninstalling now"
    if [ $? -eq 0 ]; then
        dnf remove $package -y
        UNINSTALL $? "Uninstalling $package"
    fi
done
