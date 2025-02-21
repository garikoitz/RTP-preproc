# RTP-preproc
Reproducible Tract Profiles - preprocessing.

This container is part of the [RTP2](https://github.com/garikoitz/RTP-pipeline/wiki) suite of tools. 

This container/gear takes diffusion images, bvec and bval files, and optionally a T1 and preprocess them. 
The output of this gear is prepared to go to RTP-pipeline.

This gear is an adaptation from mrTrix's (https://github.com/MRtrix3/mrtrix3) recommended preprocessing procedure implemented in Brainlife (https://brainlife.io/app/5a813e52dc4031003b8b36f9)


Please, refer to the wiki for the most updated information in how to use it. 
[Link to the wiki](https://github.com/garikoitz/RTP-preproc/wiki)


### Summary

In this section the treatment of diffusion images is performed, specifically the preprocessing, registration, modeling and tracking. As performed in the most popular tract recontruction programs. MRtrix (Tournier et al., 2019),FSL (Smith et al., 2004), Tracula (Yendiki et al., 2011), TrackVis (Wang et al., 2007), DSI-studio (Yeh et al., 2010) or Dipy (Garyfallidis et al., 2014).
RTP2 uses some of the code from the same base repository (https://www.github.com/vistalab/vistasoft), but the
tractography system has been redesigned for flexibility and completeness based on Freesurfer (Fischl, 2012), MRtrix (Tournier et al., 2019).

RTP-preproc runs the MRtrix3 preprocessing pipeline, based on FSL's topup when the optional inverse phase encoded data are provided, otherwise the pipeline uses FSL's eddy tool. The pipeline can also perform de-noising, reslicing, and alignment to an anatomical image. Required inputs are diffusion NIfTI, BVEC, BVAL, and Anatomical (ACPC aligned) NIfTI.".

### Cite

*For citation information, please visit: https://www.biorxiv.org/content/10.1101/2022.03.17.484761v1*
*License:* *Other*


### Inputs

- *DIFF*
  - __Name__: *DIFF*
  - __Type__: *nifti*
  - __Description__: *Diffusion NIfTI image.*
  - __Notes__:*{}*

- *BVAL*
  - __Name__: *BVAL*
  - __Type__: *bval*
  - __Description__: *BVAL file.*
  - __Notes__:*{}*

- *BVEC*
  - __Name__: *BVEC*
  - __Type__: *bvec*
  - __Description__: *BVEC file.*
  - __Notes__:*{}*
  
- *ANAT*
  - __Name__: *ANAT*
  - __Type__: *nifti*
  - __Description__: *Optional anatomical T1w NIfTI image. Required only if anatalign=true*
  - __Optional__:*true*
  - __Notes__:*{}*

- *FSMASK*
  - __Name__: *FSMASK*
  - __Type__: *nifti*
  - __Description__: *Optional freesurfer mask, if not passed FSL will calculate it internally.*
  - __Optional__:*true*
  - __Notes__:*{}*

- *RDIF*
  - __Name__: *RDIF*
  - __Type__: *nifti*
  - __Description__: *Optional reverse phase encoded (rpe) diffusion NIfTI image.*
  - __Optional__:*true*
  - __Notes__:*{}*


- *RBVL*
  - __Name__: *RBVL*
  - __Type__: *bval*
  - __Description__: *Optional reverse phase encoded (rpe) BVAL file.*
  - __Optional__:*true*
  - __Notes__:*{}*


- *RBVC*
  - __Name__: *RBVC*
  - __Type__: *bvec*
  - __Description__: *Optional reverse phase encoded (rpe) BVEC file.*
  - __Optional__:*true*
  - __Notes__:*{}*

### Config

- *acqd*
  - __Name__: *acqd*
  - __Type__: *string*
  - __Description__: *Encoding direction in the phase of adquisition*
  - __Default__: *PA*
  
- *denoise*
  - __Name__: *denoise*
  - __Type__: *boolean*
  - __Description__: *Denoise data using PCA*
  - __Default__: *true*
  
- *degibbs*
  - __Name__: *degibbs*
  - __Type__: *boolean*
  - __Description__: *Perform Gibbs ringing correction*
  - __Default__: *true*
  
- *eddy*
  - __Name__: *eddy*
  - __Type__: *boolean*
  - __Description__: *Perform eddy current correction. If inverted phase encoding direction files are found, eddy will be done as part of topup.*
  - __Default__: *true*

- *bias*
  - __Name__: *bias*
  - __Type__: *boolean*
  - __Description__: *Compute bias correction with ANTs on dwi data*
  - __Default__: *false*

- *ricn*
  - __Name__: *ricn*
  - __Type__: *boolean*
  - __Description__: *Perform Rician background noise removal*
  - __Default__: *false*

- *norm*
  - __Name__: *norm*
  - __Type__: *boolean*
  - __Description__: *Perform intensity normalization of dwi data*
  - __Default__: *false*

- *nval*
  - __Name__: *nval*
  - __Type__: *number*
  - __Description__: *Normalize the intensity of the FA white matter mask to this number*
  - __Default__: *1000*

- *anatalign*
  - __Name__: *anatalign*
  - __Type__: *boolean*
  - __Description__: *Align dwi data with anatomy*
  - __Default__: *false*

- *doreslice*
  - __Name__: *-doreslice*
  - __Type__: *boolean*
  - __Description__: *Do reslicing*
  - __Default__: *false*

- *saveoutput*
  - __Name__: *-saveoutput*
  - __Type__: *boolean*
  - __Description__: *Save all the intermediate files (both .mif and .nii.gz), for QC and debugging*
  - __Default__: *false*

- *reslice*
  - __Name__: *reslice*
  - __Type__: *boolean*
  - __Description__: *By default reslicing is not done. If you want it done, set doreslice=true and set a number (e.g., 1) here to reslice the dwi data to this isotropic voxel size (in mm).*
  - __Default__: *false*
  - __Optional__: *true*

- *bias_method*
  - __Name__: *bias_method*
  - __Type__: *string*
  - __Description__: *ants or fsl option for dwibiascorrect: performs B1 field inhomogeneity correction for a DWI volume series*
  - __Default__: *ants*

- *antsb*
  - __Name__: *antsb*
  - __Type__: *string*
  - __Description__: *param b for ANTs, when called from dwibiascorrect ants, N4BiasFieldCorrection option -b. [initial mesh resolution in mm, spline order] This value is optimised for human adult data and needs to be adjusted for rodent data. --bspline-fitting [splineDistance,<splineOrder=3>] [initialMeshResolution,<splineOrder=3>] These options describe the b-spline fitting parameters. The initial b-spline mesh at the coarsest resolution is specified either as the number of elements in each dimension, e.g. 2x2x3 for 3-D images, or it can be specified as a single scalar parameter which describes the isotropic sizing of the mesh elements. The latter option is typically preferred. For each subsequent level, the spline distance decreases in half, or equivalently, the number of mesh elements doubles Cubic splines (order = 3) are typically used.*
  - __Default__: *[150,3]*

- *antsc*
  - __Name__: *antsc*
  - __Type__: *string*
  - __Description__: *param c for ANTs, when called from dwibiascorrect ants, N4BiasFieldCorrection option -c. [numberOfIterations,convergenceThreshold]. --convergence [<numberOfIterations=50x50x50x50>,<convergenceThreshold=0.0>] Convergence is determined by calculating the coefficient of variation between subsequent iterations. When this value is less than the specified threshold from the previous iteration or the maximum number of iterations is exceeded the program terminates. Multiple resolutions can be specified by using 'x' between the number of iterations at each resolution, e.g. 100x50x50.*
  - __Default__: *[200x200,1e-6]*

- *antss*
  - __Name__: *antss*
  - __Type__: *string*
  - __Description__: *param s for ANTs, when called from dwibiascorrect ants, N4BiasFieldCorrection option -s. shrink-factor applied to spatial dimensions. --shrink-factor 1/2/3/4/... Running N4 on large images can be time consuming. To lessen computation time, the input image can be resampled. The shrink factor, specified as a single integer, describes this resampling. Shrink factors <= 4 are commonly used.*
  - __Default__: *2*

- *eddy_data_is_shelled*
  - __Name__: *eddy_data_is_shelled*
  - __Type__: *boolean*
  - __Description__: *At the moment eddy works for single- or multi-shell diffusion data, i.e. it doesn't work for DSI data. In order to ensure that the data is shelled eddy checks it, and only proceeds if it is happy that it is indeed shelled. The checking is performed through a set of heuristics such as i) how many shells are there? ii) what are the absolute numbers of directions for each shell? iii) what are the relative numbers of directions for each shell? etc. It will for example be suspicious of too many shells, too few directions for one of the shells etc. It has emerged that some popular schemes get caught in this test. Some groups will for example acquire a mini shell with low b-value and few directions and that has failed to pass the check, even though it turns out eddy works perfectly well on the data. For that reason we have introduced the --data_is_shelled flag. If set, it will bypass any checking and eddy will proceed as if data was shelled. Please be aware that if you have to use this flag you may be in untested territory and that it is a good idea to check your data extra carefully after having run eddy on it.*
  - __Default__: *true*

- *eddy_slm*
  - __Name__: *eddy_slm*
  - __Type__: *string*
  - __Description__: *Second level model that specifies the mathematical form for how the diffusion gradients cause eddy currents. For high quality data with 60 directions, or more, sampled on the whole sphere we have not found any advantage of performing second level modelling. Hence our recommendation for such data is to use none, and that is also the default. If the data has quite few directions and/or is has not been sampled on the whole sphere it can be advantageous to specify --slm=linear.*
  - __Default__: *linear*

- *eddy_niter*
  - __Name__: *eddy_niter*
  - __Type__: *number*
  - __Description__: *eddy does not check for convergence. Instead it runs a fixed number of iterations given by --niter. This is not unusual for registration algorithms where each iteration is expensive (i.e. takes long time). Instead we run it for a fixed number of iterations, 5 as default. If, on visual inspection, one finds residual movement or EC-induced distortions it is possible that eddy has not fully converged. In that case we primarily recommend that one uses --fwhm=10,0,0,0,0, as described above, to speed up convergence. Only if that fails do we recommend increasing the number of iterations.*
  - __Default__: *5*

- *eddy_repol*
  - __Name__: *bias_method*
  - __Type__: *boolean*
  - __Description__: *When set this flag instructs eddy to remove any slices deemed as outliers and replace them with predictions made by the Gaussian Process. Exactly what constitutes an outlier is affected by the parameters --ol_nstd, --ol_nvox, --ol_type, --ol_pos and --ol_sqr. If the defaults are used for all those parameters an outlier is defined as a slice whose average intensity is at least four standard deviations lower than the expected intensity, where the expectation is given by the Gaussian Process prediction. The default is to not do outlier replacement since we don't want to risk people using it unawares. However, our experience and tests indicate that it is always a good idea to use --repol.*
  - __Default__: *true*

- *eddy_mporder*
  - __Name__: *eddy_mporder*
  - __Type__: *number*
  - __Description__: *If one wants to do slice-to-vol motion correction --mporder should be set to an integer value greater than 0 and less than the number of excitations in a volume. Only when --mporder > 0 will any of the parameters prefixed by --s2v_ be considered. The larger the value of --mporder, the more degrees of freedom for modelling movement. If --mporder is set to N-1, where N is the number of excitations in a volume, the location of each slice/MB-group is individually estimated. We don't recommend going that high and in our tests we have used values of N/4 -- N/2. The underlying temporal model of movement is a DCT basis-set of order N. Slice-to-vol motion correction is computationally very expensive so it is only implemented for the CUDA version.*
  - __Default__: *0*

- *eddy_slspec*
  - __Name__: *eddy_slspec*
  - __Type__: *string*
  - __Description__: *Specifies a text-file that describes how the slices/MB-groups were acquired. This information is necessary for eddy to know how a temporally continuous movement translates into location of individual slices/MB-groups. Let us say a given acquisition has N slices and that m is the MB-factor (also known as Simultaneous Multi-Slice (SMS)). Then the file pointed to be --slspec will have N/m rows and m columns. Let us for example assume that we have a data-set which has been acquired with an MB-factor of 3, 15 slices and interleaved slice order. The file would then be [0 5 10;2 7 12;4 9 14;1 6 11;3 8 13] where the first row [0 5 10] specifies that the first, sixth and 11th slice are acquired first and together, followed by the third, eighth and 13th slice etc. For single-band data and for multi-band data with an odd number of excitations/MB-groups it is trivial to work out the --slspec file using the logic of the example. For an even number of excitations/MB-groups it is considerably more difficult and we recommend using a DICOM->niftii converter that writes the exact slice timings into a .JSON file. This can then be used to create the --slspec file.*
  - __Default__: *hi there\n1 1 1\n3 3 3*

- *topup_lambda*
  - __Name__: *topup_lambda*
  - __Type__: *string*
  - __Description__: *replace lambda value in topup.*
  - __Default__: *0.005,0.001,0.0001,0.000015,0.000005,0.0000005,0.00000005,0.0000000005,0.00000000001*

### Outputs

#### Files

- *Preprocessed diffusion data*
  - __Name__: *dwi.nii.gz*
  - __Type__: *nifti*
  - __Description__: *Images resulting from RTP2 preprocessing*
  
- *Extra preproc results*
  - __Name__: *Extra files*
  - __Type__: *Various*
  - __Description__: *All files generated during preprocessing that are not needed for tractography*


#### Prerequisite


1. ____docker garikoitz/rtppreproc____


## Usage

This is an example for Docker container:

```
docker run --rm -ti \
    -v </path/to/input/>:/flywheel/v0/input/ \
    -v </path/for/output/>:/flywheel/v0/output \
    -v </path/for/example_config.json>:/flywheel/v0/config.json
    garikoitz/rtppreproc:<version-tag>
```
This is an example for Singularity container:

```
singularity run -e --no-home \
    --bind /scratch:/scratch \
    --bind </path/to/input/>:/flywheel/v0/input/:ro \
    --bind </path/for/output/>:/flywheel/v0/output \
    --bind </path/for/example_config.json>:/flywheel/v0/config.json
    garikoitz/rtppreproc:<version-tag>
 ```
##### *{Input-File}*

1. Difussion data "nifti"
2. Difussion vectors "bvec"
3. Difussion values "bval"
4. Configuration file "json"
Optional
5. Anatomical image "nifti"
6. Brainmask from FS "nifti"
7. Reverse phase encoded diffusion "nifti"
8. Reverse phase encoded diffusion vectors "bvec"
9. Reverse phase encoded diffusion values "bval"


## FAQ

[FAQ.md](FAQ.md)

