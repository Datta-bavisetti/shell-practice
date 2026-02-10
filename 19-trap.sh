#!/bin/bash

set -e
trap '"echo There is an error in $LINENO, Command: $BASH_COMMAND"' ERR

echo "My name is Datta!"
echho "I'm learning..DevOps" 