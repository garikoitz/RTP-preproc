# RTP-preproc
Reproducible Tract Profiles - preprocessing.

This gear takes diffusion images, bvec and bval files, and optionally a T1 and preprocess them. 
The output of this gear is prepared to go to RTP-pipeline.


## TO-DO:
1. Document different preprocessing options. 
2. Include other vistalab tools in the same gear to have a complete set of solutions in the same gear. Right now it is required to launch them separately. 
    1. dwi-bvec-flip-detect
    2. dwi-flip-bvec
    3. dwi-acpc-anat-normalize



For most of the cases, the steps will be:
1. Run RTP-preproc: select the option to align dwi data with anatomy
2. Run dwi-bvec-flip-detect: if the bvec is flipped, it will detect it and flip it automatically. 
3. Run RTP-pipeline

