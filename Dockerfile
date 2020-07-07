FROM brainlife/fsl:5.0.9 

MAINTAINER Garikoitz Lerma-Usabiaga <glerma@stanford.edu> 

# RUN apt-get update 
# RUN apt install debconf-utils 
# RUN apt-get -qq update && apt-get -qq install -y \
#    unzip \
#    wget \
#    curl \
#    zip \
#    gzip \
#    python \
#    bzip2 \
#    ants \
#	vim
## install ants / fsl / other requirements
# RUN apt-get install -y ants 

RUN apt-get update && apt-get install -y ants

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
RUN cd mrtrix3 && git fetch --tags && git checkout tags/3.0.1 && ./configure -nogui && ./build

## manually add to path
ENV PATH=$PATH:/mrtrix3/bin

# Add Miniconda
# RUN mkdir /miniconda3
# RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh
# RUN bash Miniconda3-4.5.4-Linux-x86_64.sh -b -p /miniconda3 -f
# RUN chmod a+wrx /miniconda3
# RUN rm Miniconda3-4.5.4-Linux-x86_64.sh

# Set path to conda
# ENV PATH $PATH:/miniconda3/bin

# Updating Miniconda packages
# RUN conda update conda

# Copy requirements
# COPY requirements.txt ./

# pip install requirements
# RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Copy python files
# COPY flipX.py ./


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
# RUN ldconfig 

# Ubuntu, by default it changes the default /bin/sh to point to a thing called "dash" rather than "bash". 
# "dash" is simpler/faster to load than "bash", but unfortunately it breaks a lot of programs that 
# expects /bin/sh to point to bash. 
# To correct this, you can add following in your Dockerfile to reset it to bash.
# https://wiki.ubuntu.com/DashAsBinSh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


