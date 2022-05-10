#!/bin/bash

# DSS TOOLS
# This script will execute the DSS command line to stack the images for each of the channels


dss_stack () {
    if [ -f "$1_dss_list.txt" ]
    then
        echo "Stacking the $1 channel..."
        if [ -f "$1/Autosave.fit" ]
        then
            rm "$1/Autosave*"
        fi

        DeepSkyStackerCL.exe /FITS /S "$1_dss_list.txt" > /dev/null
    fi
}

dss_stack "l"
dss_stack "r"
dss_stack "g"
dss_stack "b"

dss_stack "h"
dss_stack "o"
dss_stack "s"
