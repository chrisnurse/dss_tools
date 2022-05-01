#!/bin/bash

# !!! THIS ISN'T FULLY WORKING YET
# We need to get the right calibration files based on bin, channel and exposure time

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

REF_IMAGE=$3
BIN=$5
EXPOSURE_TIME=$6

if [ "$4" = "cal" ]
then
    if [ "$BIN" = "" ]
    then
        echo "When using calibration, you must specify Bin1, Bin2, etc... "
        exit 1
    fi

    if [ "$EXPOSURE_TIME" = "" ]
    then
        echo "When using calibration, you must specify exposure time, e.g. 30s, 180s etc."
        exit 1
    fi

    # Bias frames are very fast, with no light on the sensor
    BIAS_FOLDER="$BIAS_PATH/$BIN"
    if [ -d "$BIAS_FOLDER" ]
    then
        for img in $(find "$BIAS_FOLDER/$BIN" -name "*.fit")
        do 
            echo "1	bias	$img"  
        done
    fi

    # Dark flats have the same exposure time as the flats, but with no light on the sensor
    DARK_FLATS_FOLDER="$DARK_FLATS_PATH/$BIN"
    if [ -d "$DARK_FLATS_PATH" ]
    then
        for img in $(find $DARK_FLATS_PATH -name "*$BIN*.fit")
        do 
            echo "1	darkflat	$img"  
        done
    fi

    # Flats have a fast exposure time and a flat image, to calibrate the optics all the way from the camera, through the aperture
    FLATS_FOLDER="$FLATS_PATH/$BIN"
    if [ -d "$FLATS_FOLDER" ]
    then
        for img in $(find $FLATS_FOLDER -name "*$BIN*.fit")
        do 
            echo "1	flat	$img"  
        done
    fi

    # Darks should probably be in the data directory with the lights
    # Darks have the same exposure time as lights, but with no light on the sensor    
    DARKS_FOLDER="$DARKS_PATH/$BIN/$EXPOSURE_TIME"
    if [ -d "$DARKS_FOLDER" ]
    then
        for img in $(find "$DARKS_FOLDER/$BIN/$EXPOSURE_TIME" -name "*$BIN*.fit")
        do 
            echo "1	dark	$img"  
        done
    fi

fi

cat $ASTRO_HOME/scripts/dss_prefs.txt 