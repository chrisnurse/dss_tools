#!/bin/bash

# DSS TOOLS
# The purpose of this script is to delete redundant or tempoary files
# created by DSS or the ASIAIR.
# 
# Some of the files also relate to Nebulosity.


echo "DANGER!"
echo
echo "The purpose of this script is to remove any unwanted files in the current or sub-directories."
echo
echo
echo "Files which will be deleted are:"
echo
echo "ASIAIR thumbnails         All files matching *.jpg"
echo "Nebulosity working files  All files matching pproc_*.fit"
echo "Nebulosity working files  All files matching Q*_Light*.fit"
echo "DSS working files         All files named Autosave.tif"
echo "DSS working files         All files named *.Info.txt"
echo
echo
echo "Press CTRL-C to abort..."
echo
read -p "Press ENTER to continue..."
read -p "Press ENTER again if you are sure you wish to continue..."

find . -name 'Autosave.tif' -delete && \
find . -name 'pproc_*.fit' -delete && \
find . -name 'Q*_Light*.fit' -delete && \
find . -name '*.jpg' -delete
find . -name '*.Info.txt' -delete
