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
## Explosion-Detector- functional
Installed appears to be working (no errors, produces data) on wav files. Not tested on HARP data. 

## Fish Detector- semifunctional
Installed may be working? Runs, no errors but doesn't produce data (potentially no fish in the local example data)

## EchoDet- semifunctional
Added a wrapper function to run. Runs, loads, but no templates present on testing. These will need to be added and recompiled. 

## Airgun Detector
Some changes. Appears to be working with test soundtrap data, returns mostly empty mat file. However, no airguns in the data so output may be incorrect. Furtehr validation needded

## LabelVis
All dropdowns/windows working. No data to fully evaluate on.

## Batch LTSA
Should this be in the tools menu or is this a derivitive of other functionality?

## Cluster Tool
All gui's loading properly, functionality not finalized

## Soundscape Metrics
All gui's loading properly, functionality not finalized


# Currently Excuded Remoras (JAVA dependencies)
Tethes, Logger, Detector

