#!/bin/bash

# Deletes the file without printing which file we are deleting
find . -name '*.log' -type f -mtime +14 -exec rm -f {} \;

# Prints which file we are deleting
find . -name '*.log' -type f -mtime +14 -print -exec rm -f {} \;
