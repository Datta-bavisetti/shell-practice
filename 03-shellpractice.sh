#!/bin/bash
MIN_AGE=18

# This script is to check their eligibility for Vote
echo "Welcome to Shell Scripting Practice!"
echo "================================"
read -p"Enter your age: " AGE
if [ $AGE -ge $MIN_AGE ]; then
    echo "You are Allowed to Vote"
else
    echo "You are not allowed to Vote as your age is: $AGE. Minimum age requirement to Vote is $MIN_AGE"
fi
