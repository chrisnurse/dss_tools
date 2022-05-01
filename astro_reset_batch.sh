#!/bin/bash

[ -d ./$1 ] && chmod ug=rw ./$1/* && mv ./$1/* . && rmdir ./$1

echo "'fit' files for the $1 channel have been moved from the ./$1 directory back to the current directory"
