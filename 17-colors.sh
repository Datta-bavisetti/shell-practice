#!/bin/bash

#To install any package, we have to run with sudo access. 
#But not all the users use the same. So, let's validate
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0.log"
#color codes in shell scripting
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run the script with root user$N"
    exit 1
fi

INSTALL(){
if [ $1 -ne 0 ]; then
    echo -e "$2... $R FAILURE$N" | tee -a $LOGS_FILE
else
    echo -e "$2... $G SUCCESS$N" | tee -a $LOGS_FILE
fi
}

for package in $@
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo -e " $B $package$N is not installed, installing now" 
        dnf install $package -y &>> $LOGS_FILE
        INSTALL $? "Installing $package" 
    else
        echo -e "$package is already installed...$Y SKIPPING$N" 
    fi
done