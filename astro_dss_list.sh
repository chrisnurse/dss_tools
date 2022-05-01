#!/bin/bash

# DSS TOOLS
# astro_dss_lst.sh
#
# The purpose of this script is to create DSS file lists.
#
# Initially, the first file list to be created is a list of FIT files from all channels. By creating a single
# file containing images from all channels, we can register, and consequently score the quality of all files
# in one operation.


echo "DSS file list" 
echo "CHECKED	TYPE	FILE" 

for img in $(find $1 -name $2)
do 
    echo "1	light	$img"  
done

if ! [ "$3" = "" ]
then
    echo "0	reflight	$3"  
fi

if [ "$4" = "cal" ]
then
    if [ "$5" = "" ]
    then
        echo "When using calibration, you must specific Bin1, Bin2, etc... "
        exit 1
    fi

    if [ -d "$BIAS_PATH" ]
    then
        for img in $(find $BIAS_PATH -name "*$5*.fit")
        do 
            echo "1	bias	$img"  
        done
    fi

    if [ -d "$DARKS_PATH" ]
    then
        for img in $(find $DARKS_PATH -name "**$5*.fit")
        do 
            echo "1	dark	$img"  
        done
    fi

    if [ -d "$DARK_FLATS_PATH" ]
    then
        for img in $(find $DARK_FLATS_PATH -name "**$5*.fit")
        do 
            echo "1	darkflat	$img"  
        done
    fi

    if [ -d "$FLATS_PATH" ]
    then
        for img in $(find $FLATS_PATH -name "**$5*.fit")
        do 
            echo "1	flat	$img"  
        done
    fi
fi

cat $ASTRO_HOME/scripts/dss_prefs.txt 