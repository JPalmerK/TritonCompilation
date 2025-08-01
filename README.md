# TritonCompilation 
This repo contains modified version of Triton (https://github.com/MarineBioAcousticsRC/Triton) with multiple remoras pre-installed

Triton figure not loading


# Built In Functionality
## Create LTSA
Functional

## Load LTSA
Functional

## Convert HARP to XWAV
Not tested

## Decimate WAV/XWAV
Not tested

# Remora Status

## Airgun Detector
Some changes. Appears to be working with test soundtrap data, returns mostly empty mat file. However, no airguns in the data so output may be incorrect. Furtehr validation needded

## Batch LTSA
Tested on 4 soundtrap files, need to test on harp/xwave/etc formal evaluation of output. 

## Cluster Tool
All GUI's functioning, test data needed

## EchoDet- semifunctional
Added a wrapper function to run. Runs, loads, but no templates present on testing. These will need to be added and recompiled. 


## Explosion-Detector- functional
Installed appears to be working (no errors, produces data) on wav files. Not tested on HARP data. 

## Fish Detector- semifunctional
Installed may be working? Runs, no errors but doesn't produce data (potentially no fish in the local example data)

## LabelVis
All dropdowns/windows working. No data to fully evaluate on.

## Ship Detector
Tested on 4 soundtrap files. Need to test on data with harp/xwave/etc with ship noise to be detected. Informed  evaluation of output. 

## Soundscape Metrics
All gui's loading properly, Tested on 4 soundtrap files.  Informed evaluation of output needed. 

## SPICE-Detector
All gui's loading properly, Tested on 4 soundtrap files.  Informed evaluation of output needed. 


# Currently Excuded Remoras (JAVA dependencies)
Tethes, Logger, Detector

