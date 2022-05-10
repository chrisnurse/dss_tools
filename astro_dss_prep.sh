#!/bin/bash

# DSS TOOLS
# The purpose of this script is to execute astro_dss_list.sh then score the FIT quality of the fit files,
# and finally to create a file list for each channel (LRGBHOS) which contains the reference frame and 
# calibration frames.

BIN=$1
EXPOSURE_TIME=$2


if [ "$BIN" = "" ] | [ "$EXPOSURE_TIME" = "" ]
then
    echo "Usage:"
    echo "astro_dss_prep.sh Bin Exposure"
    echo
    echo "Arguments:"
    echo "     Bin: Bin1, Bin2, etc. Must match the part of the file name that specifies binning."
    echo "Exposure: 60.0s or 180.0s, etc. Must match the part of the file name that specifies precise exposure time."
    exit 1
fi

echo
echo "Creating Deep Sky Stacker file list in ./dss_images.txt"
echo
echo "Bin:      $BIN"
echo "Exposure: $EXPOSURE_TIME"
echo

astro_dss_list.sh . *.fit > dss_images.txt

echo
echo "Deep Sky Stacker is registering and scoring the images..."
echo "This can take a while and you may want to review the Deep Sky Stacker preferences"
echo

DeepSkyStackerCL.exe /FITS /r dss_images.txt > /dev/null

echo "Deep Sky Stacker has registered the images"
echo

echo "Allocating the highest scoring image as the reference frame..."
echo

BEST_IMAGE=""
BEST_SCORE=0

for score_file in $(find . -name "*.Info.txt")
do 
    # Get the value for OverallQuality and remove the decimal point, so later we can do an integer operation (-gt: greater than)
    SCORE=$(astro_dss_get_value.sh "$score_file" "OverallQuality" | sed "s/\.//")

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


[ -d ./l ] && astro_dss_list.sh ./l *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > l_dss_list.txt && echo "Created list file for channel: L"
[ -d ./r ] && astro_dss_list.sh ./r *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > r_dss_list.txt && echo "Created list file for channel: R"
[ -d ./g ] && astro_dss_list.sh ./g *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > g_dss_list.txt && echo "Created list file for channel: G"
[ -d ./b ] && astro_dss_list.sh ./b *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > b_dss_list.txt && echo "Created list file for channel: B"
[ -d ./h ] && astro_dss_list.sh ./h *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > h_dss_list.txt && echo "Created list file for channel: H"
[ -d ./o ] && astro_dss_list.sh ./o *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > o_dss_list.txt && echo "Created list file for channel: O"
[ -d ./s ] && astro_dss_list.sh ./s *.fit $BEST_IMAGE cal $BIN $EXPOSURE_TIME > s_dss_list.txt && echo "Created list file for channel: S"

echo
echo "Each of the above files has the lights for the specific channel, together with available calibration images."
echo
