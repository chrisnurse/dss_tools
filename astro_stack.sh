#!/bin/bash

echo "Copy stacked files into the stacked_channels directory..."
cp l/Autosave.fit stacked_channels/l.fit 2> /dev/null 
cp r/Autosave.fit stacked_channels/r.fit 2> /dev/null
cp g/Autosave.fit stacked_channels/g.fit 2> /dev/null
cp b/Autosave.fit stacked_channels/b.fit 2> /dev/null
cp h/Autosave.fit stacked_channels/h.fit 2> /dev/null
cp o/Autosave.fit stacked_channels/o.fit 2> /dev/null
cp s/Autosave.fit stacked_channels/s.fit 2> /dev/null
echo "Placed a copy of stacked tif files for each channel in the stacked_channels directory"
