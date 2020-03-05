#!/bin/bash
docker run --rm -it $4 \
        -v $3:/flywheel/v0/config.json \
        -v $2/input:/flywheel/v0/input \
        -v $2/output:/flywheel/v0/output \
        vistalab/rtppreproc:$1 
