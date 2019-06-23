#!/bin/bash
# --entrypoint=/bin/bash \
docker run --rm -it \
		-v /black/localhome/glerma/soft/RTP-preproc/config.json:/flywheel/v0/config.json \
        -v /black/localhome/glerma/TESTDATA/RTP-preproc/input:/flywheel/v0/input \
        -v /black/localhome/glerma/TESTDATA/RTP-preproc/output:/flywheel/v0/output \
        vistalab/RTP-preproc:1.0.3
