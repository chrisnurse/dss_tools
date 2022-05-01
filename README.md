Oztronomy - Deep Sky Stacker and ASIAIR data toolkit
----------------------------------------------------

Tools to accelerate the Deep Sky Stacker worflow.

# WHY USE THE TOOLKIT?

If you have an ASIAIR and use Deep Sky Stacker (DSS) then this toolkit is intended to help you to get to stacked images for all of your channels, faster.
If you do not use ASIAIR and DSS, then this toolkit is likely not for you, but perhaps you can use it as a basis to develop something for your needs.

Note that the toolkit is a work in progress, and largely based on how I currently think I want to structure my data, i.e. how I want to organise different sets of calibration frames, by the binning, exposure time and perhaps other attributes. This may change, but what I am essentially trying to avoid is directories with 100s of files in. It would be easier to have everything lumped in one folder from a bulk file processing perspective, but it's better to have things grouped together, then it's easier to work with large numbers of files.  

# GETTING STARTED

## About the toolkit compatibility
The toolit is a collection of shell scripts, the location of which must be in your PATH. 
The toolkit is specifically a collection of BASH scripts, so your computer must be able to run BASH.
For Windows users, it is assumed that you are using Windows Subsystem for Linux, as all the paths are in UNIX, not Windows format.

## One time configuration

Follow these steps when you have first cloned the toolkit from Github:

1. Ensure you edit your .bashrc file and add the toolkit scripts location to the path, e.g:

export PATH=$PATH:/mnt/m/astro/scripts

2. You must modify go_astro.sh, for example, to state the location of your home folder, under which the scripts are located. Also, you have to set the installation location of DSS.
   
3. Use the go_astro.sh command to set yourself up for image processing:
    . go_astro.sh

    This is a special syntax that tells your current shell to execute the command, and not to start a new shell.

4. Organise your calibration data

The go_astro.sh command sets a number of environment variables which specify the location of your calibration files:

BIAS_PATH
DARKS_PATH
DARK_FLATS_PATH
FLATS_PATH

Let's look at the Dark folder and remember in my example I have my astro data in /mnt/m/astro

My DARKS_PATH = /mnt/m/astro/imaging/calibration/Dark

The naming of the folder is self explanatory.

Next, inside this folder are subfolders for binning... 
/mnt/m/astro/imaging/calibration/Dark/Bin1
/mnt/m/astro/imaging/calibration/Dark/Bin2

...and then with each of those there are sub folders for exposure time:
/mnt/m/astro/imaging/calibration/Dark/Bin1/30s
/mnt/m/astro/imaging/calibration/Dark/Bin1/60s
/mnt/m/astro/imaging/calibration/Dark/Bin1/180s
etc.

So where applicable, your calibration data should be organised by image type, binning and exposure time.

5. Use the toolkit and execute astro_help.sh to gert a quick reminder of the most important commands. Execure the help command straight after you have setup the go_astro.sh script, as it will show your PATH is set correctly.
