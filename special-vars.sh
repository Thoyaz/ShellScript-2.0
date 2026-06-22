#!/bin/bash

NAME=$1
echo "name comming frmo doller-1 : ${NAME}"

SKILLS=$@
echo "skills comming from doller-@: ${SKILLS}"

echo "Number of args passed to the script: $#"

echo "Scrit name : $0"

echo "Precent working directory is : $PWD"

echo "user name of the person executing the script is : $USER"

echo "Home directory of the person executing the script is : $HOME"

echo "PID of the script is : $$"

sleep 10 &

echo "background process id is : $!"

echo "exit status of the last command executed is : $?"