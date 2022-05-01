#!/bin/bash

files=$(ls ./*_$1_*fit 2> /dev/null | wc -l)

if [ "$files" == "0" ]
then
    echo "There are no '.fit' files for the $1 channel"
    exit 0
fi

[ ! -d ./$1 ] && mkdir ./$1 

find *_$1_*fit -exec mv {} ./$1 \; 

files=$(ls ./$1/*.fit 2> /dev/null | wc -l)

if [ "$files" != "0" ]
then
    chmod 440 ./$1/*
fi
