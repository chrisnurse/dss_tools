#!/bin/bash

# DSS TOOLS
# The purpose of this script is to move the data files from the channel specific directory
# back to the current directory. Essentially, this returns the files to the original state
# as when they were first copied from the ASIAIR.

[ -d ./$1 ] && chmod ug=rw ./$1/* && mv ./$1/* . && rmdir ./$1

echo "'fit' files for the $1 channel have been moved from the ./$1 directory back to the current directory"
