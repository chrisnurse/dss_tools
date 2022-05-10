#!/bin/bash

# DSS TOOLS
# The purpose of this script is to move all of the data files back into the current folder
# This way, the files are essentially returned to the same state as when they were copied
# from the ASIAIR.

astro_reset_batch.sh l
astro_reset_batch.sh r
astro_reset_batch.sh g
astro_reset_batch.sh b
astro_reset_batch.sh h
astro_reset_batch.sh o
astro_reset_batch.sh s


if [ -d "./stacked_channels" ]
then
    rm -rf ./stacked_channels
fi

find . -name 'Autosave.fit' -delete
find . -name '*dss*txt' -delete
find . -name '*.Info*txt' -delete
find . -name '*.stackinfo.txt' -delete
