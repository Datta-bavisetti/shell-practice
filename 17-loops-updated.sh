#!/bin/bash

# Validate root access
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0")
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FOLDER"

if [ "$USERID" -ne 0 ]; then
    echo "Please run the script with root user" | tee -a "$LOGS_FILE"
    exit 1
fi

# Check if packages are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <package1> <package2> ..." | tee -a "$LOGS_FILE"
    exit 1
fi

install_status() {
    if [ "$1" -ne 0 ]; then
        echo "$2 ... FAILURE" | tee -a "$LOGS_FILE"
    else
        echo "$2 ... SUCCESS" | tee -a "$LOGS_FILE"
    fi
}

for package in "$@"
do
    dnf list installed "$package" &>> "$LOGS_FILE"
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now"
        dnf install "$package" -y &>> "$LOGS_FILE"
        install_status $? "Installing $package"
    else
        echo "$package is already installed"
    fi
done
