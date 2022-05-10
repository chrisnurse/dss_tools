#!/bin/bash

# DSS TOOLS
# The purpose of this script is to move files, copied from the ASIAIR, into directories
# that are created for each unique channel (astronomical filter).
#
# This script processes all channels for which data exists. For example if data is available for
# LRGB but not HOS, then only the LRGB channels are arranged. 


echo "Check that '.fit' files exist, and if so, organise each channel into its own folder..."
echo
files=$(ls *.fit 2> /dev/null | wc -l)
if [ "$files" == "0" ]
then
    echo "There are no '.fit' files in the current folder" 
    echo "Exiting, nothing to do."
    exit 1
fi

if [ ! -d ./stacked_channels ] 
then
    mkdir ./stacked_channels
fi

astro_batch.sh l
astro_batch.sh r
astro_batch.sh g
astro_batch.sh b

astro_batch.sh h
astro_batch.sh o
astro_batch.sh s
