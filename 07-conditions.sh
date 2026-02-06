#!/bin/bash

echo "Please enter number: "
read NUM

if [ $NUM -gt 20]; then
    echo "Given number $NUM is greater than 20"
elif [ $NUM -eq 20]; then
    echo "Given number $NUM is equal to 20"
else
    echo "Given number $NUM is not greater than 20"
fi
