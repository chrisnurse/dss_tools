#!/bin/bash

# DSS TOOLS
# The purpose of this script is to initialise environment variables 
# which are used throughout the toolkit.
#
# To execute this script correctly, use:
#   . go_astro.sh
#
# All of the environment variables will be set in your shell, and the current directory will be set at the very end of the script


# Set it to your preferred location. The scripts must be in a sub directory of this location.
export ASTRO_HOME=/mnt/m/astro

# Set the installation location for DSS
export DSS_PATH="/mnt/m/astro/deep_sky_stacker/DeepSkyStacker"
export PATH="$PATH:$DSS_PATH"

# Set the locations of your calibration data
export BIAS_PATH="$ASTRO_HOME/imaging/calibration/Bias"
export DARKS_PATH="$ASTRO_HOME/imaging/calibration/Dark"
export DARK_FLATS_PATH="$ASTRO_HOME/imaging/calibration/DarkFlats"
export FLATS_PATH="$ASTRO_HOME/imaging/calibration/Flats"

# Change directory to the preferred location, which might be the ASTRO_HOME folder, but it can also be somewhere else that you store your data
cd $ASTRO_HOME

echo astro_help.sh