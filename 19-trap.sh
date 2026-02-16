#!/bin/bash

set -e
trap '"echo There is an error in $LINENO, Command: $BASH_COMMAND"' ERR

echo "My name is Datta!"
echho "I'm learning..DevOps" 

# Output:
# My name is Datta!
# 19-trap.sh: line 7: echho: command not found
# 19-trap.sh: line 7: echo There is an error in 7, Command: echho "I'm learning..DevOps": command not found
