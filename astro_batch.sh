#!/bin/bash

# DSS TOOLS
# The purpose of this script is to move files, copied from the ASIAIR, into directories
# that are created for each unique channel (astronomical filter).
#
# This script processes a single channel, as specified on the command line.
#
# For example, if hundreds of files are copied from the ASIAIR into a single local folder, then the file names
# will have _L_, _R_, _G_, _B_ in the filename.
#
# NOTE: On the ASIAIR, you must name your filters simply as follows:
# L R G B H O S

# Filter portion of name is uppercase
f=$1
FILTER=${f^^}
FILES="*_"$FILTER"_*fit"


if [ $(find . -name "$FILES" | wc -l) = "0" ]
then
    echo "There are no '.fit' files for the $FILTER channel"
    exit 0
fi

echo "Organising data for: $FILTER"

[ ! -d ./$1 ] && mkdir ./$1 

find . -maxdepth 1 -name "$FILES" -exec mv {} ./$1 \; 

files=$(ls ./$1/*.fit 2> /dev/null | wc -l)

if [ "$files" != "0" ]
then
    chmod 440 ./$1/*
fi
