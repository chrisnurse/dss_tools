#!/bin/bash

# DSS TOOLS
# This script presents the help information for the toolkit commands

echo "Oztronomy - Deep Sky Stacker and ASIAIR data toolkit"
echo "----------------------------------------------------"
echo
echo "The toolkit is currently most useful when paired with Deep Sky Stacker and ASIAIR"
echo
echo "Use '. go_astro.sh' to move to the image storage directory, and initialise required environment variables"
echo
echo "Quick start, run the following commands in the folder that you copied your ASIAIR data to:"
echo
echo "astro_clean.sh                Cleanup unwanted files"
echo "astro_prep.sh                 Organise images into directories for each channel"
echo "astro_dss_prep.sh Bin1 180s   Create the DSS stacking files, and include calibration frames to suit the binning and exposure time used"
echo
echo
echo "--------------------------------------------------------------------------------------------------------------------------------------"
echo
echo "Command reference:"
echo
echo "astro_prep.sh                     Move all fit files into their own channel directory (LRGBHOS"
echo
echo "astro_reset_batch.sh              Move all fit files into their own channel directory (LRGBHOS"
echo
echo "astro_clean.sh                    Remove temporary files used in grading image quality and stacking"
echo
echo "astro_get_stacked.sh              Move stacked files from channel directories to the stacked_channels directory"
echo
echo
echo "The astro_batch.sh command is used by astro_prep.sh"
echo "astro_batch.sh [channel label]    Organise 'fit' files into a directory for a specified channel"
echo
echo "Example:"
echo "astro_batch.sh R"
echo
echo
echo "astro_dss_prep.sh Bin Exposure    Automatically create the file lists for DSS, score the files, select reference image and prepare for stacking"
echo
echo "Arguments:"
echo "     Bin: Bin1, Bin2, etc. Must match the part of the file name that specifies binning."
echo "Exposure: 60s or 180s, etc. This is the exposure time."
echo