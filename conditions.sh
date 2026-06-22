#!/bin/bash

AGE=11

if [[ $AGE -gt 18 ]]; then
    echo "you are eligible for vouting"
elif [[ $AGE -gt 10 && $AGE -lt 18 ]]; then
    echo "you are a teenager"
else
    echo "you are a child"
fi