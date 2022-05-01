#!/bin/bash

# DSS TOOLS


echo "Oztronomy - Deep Sky Stacker and ASIAIR data toolkit"
echo "----------------------------------------------------"
echo
echo "The toolkit is currently most useful when paired with Nebulosity"
echo
echo "Use '. go_astro.sh' to move to the image storage directory, and initialise required environment variables"
echo
echo
echo "astro_prep.sh                     Move all fit files into their own channel directory (LRGBHOS"
echo "astro_reset_batch.sh              Move all fit files into their own channel directory (LRGBHOS"
echo "astro_clean.sh                    Remove temporary files used in grading image quality and stacking"
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
echo "astro_dss_prep.sh Bin             Automatically create the file lists for DSS, score the files, select reference image and prepare for stacking"
echo
echo "Example:"
echo "astro_dss_prep.sh Bin1"
