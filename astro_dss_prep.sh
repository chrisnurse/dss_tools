#!/bin/bash

# DSS TOOLS
# The purpose of this script is to execute astro_dss_list.sh then score the FIT quality of the fit files,
# and finally to create a file list for each channel (LRGBHOS) which contains the reference frame and 
# calibration frames.

if [ "$1" = "" ]
then
    echo "Usage:"
    echo "  astro_dss_prep.sh Bin Exposure"
    echo
    echo "Arguments:"
    echo "     Bin: Bin1, Bin2, etc. Must match the part of the file name that specifies binning."
    echo "Exposure: 60s or 180s, etc. This is the exposure time."
    exit 1
fi

BIN=$1
EXPOSURE_TIME=$2

echo "Creating Deep Sky Stacker file list in ./dss_images.txt"
echo

astro_dss_list.sh . *.fit > dss_images.txt

echo "Registering images"
echo "This can take a while and you may want to review the Deep Sky Stacker preferences"
echo
echo "Deep Sky Stacker is registering and scoring the images..."

DeepSkyStackerCL.exe /FITS /r dss_images.txt > /dev/null

echo "Deep Sky Stacker has registered the images"
echo

echo "Allocating the highest scoring image as the reference frame..."
echo

BEST_IMAGE=""
BEST_SCORE=0

for score_file in $(find . -name "*.Info.txt")
do 
    SCORE=$(cat $score_file | tr "\r\n" "\n" | grep "OverallQuality" | sed "s/OverallQuality = //" | sed "s/\.//")

#    echo "** $score_file: $SCORE **"

    if [ "$SCORE" -gt "$BEST_SCORE" ]
    then
        BEST_IMAGE=$(echo "$score_file" | sed "s/.Info.txt/.fit/")
        BEST_SCORE=$SCORE
    fi
    
done

echo "Best image is: $BEST_IMAGE"
echo "        Score: $BEST_SCORE"
echo


[ -d ./L ] && astro_dss_list.sh ./L *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > l_dss_list.txt && echo "Created list file for channel: L"
[ -d ./R ] && astro_dss_list.sh ./R *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > r_dss_list.txt && echo "Created list file for channel: R"
[ -d ./G ] && astro_dss_list.sh ./G *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > g_dss_list.txt && echo "Created list file for channel: G"
[ -d ./B ] && astro_dss_list.sh ./B *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > b_dss_list.txt && echo "Created list file for channel: B"
[ -d ./H ] && astro_dss_list.sh ./H *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > h_dss_list.txt && echo "Created list file for channel: H"
[ -d ./O ] && astro_dss_list.sh ./O *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > o_dss_list.txt && echo "Created list file for channel: O"
[ -d ./S ] && astro_dss_list.sh ./S *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > s_dss_list.txt && echo "Created list file for channel: S"
echo
echo "Each of the above files has the lights for the specific channel, together with available calibration images."
