# RTP-preproc
Reproducible Tract Profiles - preprocessing.

This gear takes diffusion images, bvec and bval files, and optionally a T1 and preprocess them. 
The output of this gear is prepared to go to RTP-pipeline.

TO-DO:
1. Document different preprocessing options. 
2. Include other vistalab tools in the same gear to have a complete set of solutions. 
  2.1. dwi-bvec-flip-detect
  2.2. dwi-flip-bvec
  2.3. dwi-acpc-anat-normalize
