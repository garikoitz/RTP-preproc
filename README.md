# RTP-preproc
Reproducible Tract Profiles - preprocessing.

This container is part of the [RTP2](https://github.com/garikoitz/RTP-pipeline/wiki) suite of tools. 

This container/gear takes diffusion images, bvec and bval files, and optionally a T1 and preprocess them. 
The output of this gear is prepared to go to RTP-pipeline.

This gear is an adaptation from mrTrix's (https://github.com/MRtrix3/mrtrix3) recommended preprocessing procedure implemented in Brainlife (https://brainlife.io/app/5a813e52dc4031003b8b36f9)



Please, refer to the wiki for the most updated information in how to use it. 
[Link to the wiki](https://github.com/garikoitz/RTP-preproc/wiki)



# anatrois (anatROIs: create anatomical ROIs for DWI, fMRI, PET... in subject space)

## Overview

*{Link To Usage}*

*{Link To FAQ}*

### Summary

In this section the treatment of diffusion images is performed, specifically the preprocessing, registration, modeling and tracking. As performed in the most popular tract recontruction programs. MRtrix (Tournier et al., 2019),FSL (Smith et al., 2004), Tracula (Yendiki et al., 2011), TrackVis (Wang et al., 2007), DSI-studio (Yeh et al., 2010) or Dipy (Garyfallidis et al., 2014).
RTP2 uses some of the code from the same base repository (https://www.github.com/vistalab/vistasoft), but the
tractography system has been redesigned for flexibility and completeness based on Freesurfer (Fischl, 2012), MRtrix (Tournier et al., 2019).

RTP-preproc runs the MRtrix3 preprocessing pipeline, based on FSL's topup when the optional inverse phase encoded data are provided, otherwise the pipeline uses FSL's eddy tool. The pipeline can also perform de-noising, reslicing, and alignment to an anatomical image. Required inputs are diffusion NIfTI, BVEC, BVAL, and Anatomical (ACPC aligned) NIfTI.".

### Cite

*For citation information, please visit: https://www.biorxiv.org/content/10.1101/2022.03.17.484761v1*
*License:* *Other*


### Inputs

- *Acquisition phase encoding direction*
  - __Name__: *{From "inputs.Input-File"}*
  - __Type__: *{From "inputs.Input-File.base"}*
  - __Optional__: *{From "inputs.Input-File.optional"}*
  - __Classification__: *{Based on "inputs.Input-File.base"}*
  - __Description__: *{From "inputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*
  
  
  - *{Input-File}*
  - __Name__: *{From "inputs.Input-File"}*
  - __Type__: *{From "inputs.Input-File.base"}*
  - __Optional__: *{From "inputs.Input-File.optional"}*
  - __Classification__: *{Based on "inputs.Input-File.base"}*
  - __Description__: *{From "inputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*
  
  - *{Input-File}*
  - __Name__: *{From "inputs.Input-File"}*
  - __Type__: *{From "inputs.Input-File.base"}*
  - __Optional__: *{From "inputs.Input-File.optional"}*
  - __Classification__: *{Based on "inputs.Input-File.base"}*
  - __Description__: *{From "inputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*
  
  - *{Input-File}*
  - __Name__: *{From "inputs.Input-File"}*
  - __Type__: *{From "inputs.Input-File.base"}*
  - __Optional__: *{From "inputs.Input-File.optional"}*
  - __Classification__: *{Based on "inputs.Input-File.base"}*
  - __Description__: *{From "inputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*

### Config

- *{Config-Option}*
  - __Name__: *{From "config.Config-Option"}*
  - __Type__: *{From "config.Config-Option.type"}*
  - __Description__: *{From "config.Config-Option.description"}*
  - __Default__: *{From "config.Config-Option.default"}*
  
  - *{Config-Option}*
  - __Name__: *{From "config.Config-Option"}*
  - __Type__: *{From "config.Config-Option.type"}*
  - __Description__: *{From "config.Config-Option.description"}*
  - __Default__: *{From "config.Config-Option.default"}*
  
  - *{Config-Option}*
  - __Name__: *{From "config.Config-Option"}*
  - __Type__: *{From "config.Config-Option.type"}*
  - __Description__: *{From "config.Config-Option.description"}*
  - __Default__: *{From "config.Config-Option.default"}*
  
  - *{Config-Option}*
  - __Name__: *{From "config.Config-Option"}*
  - __Type__: *{From "config.Config-Option.type"}*
  - __Description__: *{From "config.Config-Option.description"}*
  - __Default__: *{From "config.Config-Option.default"}*

### Outputs

#### Files

*{A list of output files (if possible?)}*

- *{Output-File}*
  - __Name__: *{From "outputs.Input-File"}*
  - __Type__: *{From "outputs.Input-File.base"}*
  - __Optional__: *{From "outputs.Input-File.optional"}*
  - __Classification__: *{Based on "outputs.Input-File.base"}*
  - __Description__: *{From "outputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*
  
  
  - *{Output-File}*
  - __Name__: *{From "outputs.Input-File"}*
  - __Type__: *{From "outputs.Input-File.base"}*
  - __Optional__: *{From "outputs.Input-File.optional"}*
  - __Classification__: *{Based on "outputs.Input-File.base"}*
  - __Description__: *{From "outputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*
  
  
  - *{Output-File}*
  - __Name__: *{From "outputs.Input-File"}*
  - __Type__: *{From "outputs.Input-File.base"}*
  - __Optional__: *{From "outputs.Input-File.optional"}*
  - __Classification__: *{Based on "outputs.Input-File.base"}*
  - __Description__: *{From "outputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*
  
  
  - *{Output-File}*
  - __Name__: *{From "outputs.Input-File"}*
  - __Type__: *{From "outputs.Input-File.base"}*
  - __Optional__: *{From "outputs.Input-File.optional"}*
  - __Classification__: *{Based on "outputs.Input-File.base"}*
  - __Description__: *{From "outputs.Input-File.description"}*
  - __Notes__: *{Any additional notes to be provided by the user}*


### Pre-requisites

This section contains any prerequisites

#### Prerequisite

A list of containers, in the order they need to be run:

1. __*{Gear-Name}__*
    - Level: *{Level at which gear needs to be run}*

#### Prerequisite Files

A list of any files (OTHER than those specified by the input) that the gear will need.
If possible, list as many specific files as you can:

1. ____{File-Name}__*
    - Origin: *{Gear-Name, or Scanner, or Upload?}*
    - Level: *{Container level the file is at}*
    - Classification: *{Required classification(s) that the file can be}*
    
    
1. ____{File-Name}__*
    - Origin: *{Gear-Name, or Scanner, or Upload?}*
    - Level: *{Container level the file is at}*
    - Classification: *{Required classification(s) that the file can be}*


## Usage

This section provides a more detailed description of the gear, including not just WHAT it does, but HOW it works in flywheel.

### Description

*{A detailed description of how the gear works}*

#### File Specifications

This section contains specifications on any input files that the gear may need

##### *{Input-File}*

A description of the input file

### Workflow

A picture and description of the workflow


Description of workflow

1. Upload file to container
1. Select file as input to gear






## FAQ

[FAQ.md](FAQ.md)

