#!/bin/bash

#Print the numbers in given range
echo "Please enter the number range to print up to: "
read NUM
for i in { seq 1 "$NUM"}
do
    echo $i
done