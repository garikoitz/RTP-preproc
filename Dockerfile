FROM brainlife/fsl:5.0.9 

MAINTAINER Garikoitz Lerma-Usabiaga <glerma@stanford.edu> 

# RUN apt-get update 
RUN apt install debconf-utils 
RUN apt-get -qq update && apt-get -qq install -y \
    unzip \
    wget \
    curl \
    zip \
    gzip \
    python \
    bzip2 \
    ants \
	vim
## install ants / fsl / other requirements
# RUN apt-get install -y ants 

## add N4BiasFieldCorrection to path
ENV export ANTSPATH=/usr/lib/ants
ENV PATH=$PATH:/usr/lib/ants

## run distributed script to set up fsl
RUN . /etc/fsl/fsl.sh

RUN apt-get install -y fsl-first-data fsl-atlases 

## add better eddy functions
RUN wget https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_cuda8.0
RUN mv eddy_cuda8.0 /usr/local/bin/eddy_cuda
RUN wget https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_openmp -P /usr/local/bin
RUN chmod +x /usr/local/bin/eddy_cuda
RUN chmod +x /usr/local/bin/eddy_openmp

## install mrtrix3 requirements
RUN apt-get install -y git g++ python python-numpy libeigen3-dev zlib1g-dev libqt4-opengl-dev libgl1-mesa-dev libfftw3-dev libtiff5-dev

## install and compile mrtrix3
RUN git clone https://github.com/MRtrix3/mrtrix3.git
RUN cd mrtrix3 && git fetch --tags && git checkout tags/3.0_RC3 && ./configure -nogui && ./build

## manually add to path
ENV PATH=$PATH:/mrtrix3/bin

# Add Miniconda
RUN mkdir /conda
RUN chmod a+wrx /conda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh
RUN bash Miniconda3-4.5.4-Linux-x86_64.sh -b -p /conda
RUN rm Miniconda3-4.5.4-Linux-x86_64.sh

# Set path to conda
ENV PATH $PATH:/conda/miniconda3/bin

# Updating Miniconda packages
RUN conda update conda

# Copy requirements
COPY requirements.txt ./

# pip install requirements
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Copy python files
COPY flipX.py ./


#make it work under singularity 
# RUN ldconfig && mkdir -p /N/u /N/home /N/dc2 /N/soft /mnt/scratch

#https://wiki.ubuntu.com/DashAsBinSh 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


# Make directory for flywheel spec (v0)
ENV FLYWHEEL /flywheel/v0
RUN mkdir -p ${FLYWHEEL}
VOLUME ${FLYWHEEL}
WORKDIR ${FLYWHEEL}
COPY run ${FLYWHEEL}/run
COPY manifest.json ${FLYWHEEL}/manifest.json
# COPY awkflipbvec.sh ${FLYWHEEL}/awkflipbvec.sh
COPY flipX.py ${FLYWHEEL}/flipX.py


# Configure entrypoint
ENTRYPOINT ["/flywheel/v0/run"]


#make it work under singularity
RUN ldconfig 

