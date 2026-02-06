#!/bin/bash

NAME=Datta #Variable declaration 
AGE=$1 #Passing values through args during the execution but printing the value through var reference
echo "My name is: $NAME"
echo "My Age is: $AGE"
echo "My village is:$2" #$2 not assigned to any valiable, will be taking value through args
