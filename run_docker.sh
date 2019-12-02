#!/bin/bash
#docker run --rm -it --entrypoint=/bin/bash \
docker run --rm -it \
        -v /share/wandell/users/glerma/TESTDATA/RTP-preproc/config.json:/flywheel/v0/config.json \
        -v /black/localhome/glerma/TESTDATA/RTP-preproc/input:/flywheel/v0/input \
        -v /black/localhome/glerma/TESTDATA/RTP-preproc/output:/flywheel/v0/output \
        vistalab/rtppreproc:1.0.4
