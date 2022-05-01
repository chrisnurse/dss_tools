#!/bin/bash

echo "Check that '.fit' files exist, and if so, organise each channel into its own folder..."
echo
files=$(ls *.fit 2> /dev/null | wc -l)
if [ "$files" == "0" ]
then
    echo "There are no '.fit' files in the current folder" 
    echo "Exiting, nothing to do."
    exit 1
fi

if [ ! -d ./dark ] 
then
    mkdir ./dark 
fi

if [ ! -d ./stacked_channels ] 
then
    mkdir ./stacked_channels
fi

astro_batch.sh L
astro_batch.sh R
astro_batch.sh G
astro_batch.sh B

astro_batch.sh H
astro_batch.sh O
astro_batch.sh S
