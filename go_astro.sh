#!/bin/bash

# DSS TOOLS
# The purpose of this script is to initialise environment variables 
# which are used throughout the toolkit.

export ASTRO_HOME=/mnt/m/astro
export DSS_PATH="/mnt/m/astro/deep_sky_stacker/DeepSkyStacker"

export BIAS_PATH="$ASTRO_HOME/imaging/calibration/Bias"
export DARKS_PATH="$ASTRO_HOME/imaging/calibration/Dark"
export DARK_FLATS_PATH="$ASTRO_HOME/imaging/calibration/DarkFlats"
export FLATS_PATH="$ASTRO_HOME/imaging/calibration/Flats"

export PATH="$PATH:$DSS_PATH"

cd $ASTRO_HOME
