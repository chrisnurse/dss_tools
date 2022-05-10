#!/bin/bash

# DSS TOOLS
# The purpose of this script is to move the stacked image for each channel into the stacked_channels folder.
# This is intended to make it easy to find and identify the stacked images, in order to finally load
# them into image editing software.

echo "Copy the stacked files for each channel to the stacked_channels directory"

cp l/Autosave.fit stacked_channels/l.fit 2> /dev/null 
cp r/Autosave.fit stacked_channels/r.fit 2> /dev/null
cp g/Autosave.fit stacked_channels/g.fit 2> /dev/null
cp b/Autosave.fit stacked_channels/b.fit 2> /dev/null
cp h/Autosave.fit stacked_channels/h.fit 2> /dev/null
cp o/Autosave.fit stacked_channels/o.fit 2> /dev/null
cp s/Autosave.fit stacked_channels/s.fit 2> /dev/null

echo "Copy complete"
