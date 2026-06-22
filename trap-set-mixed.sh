#!/bin/bash
Set -e # Set will consider errors as ERR
Trap 'echo “There is an error in $LINENO, command: $BASH_COMMAND”' ERR

echo "hello world"
echo "This is a test script to demonstrate the use of trap command in bash scripting"
echo "This script will print the line number and the command that caused the error if any command fails"
echo "This is a test script to demonstrate the use of trap command in bash scripting"
echo "This script will print the line number and the command that caused the error if any command