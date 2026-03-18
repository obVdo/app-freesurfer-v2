#!/bin/bash

set -e
set -x

t1=$(jq -r '.t1' config.json)
export FREESURFER_HOME=${FREESURFER_HOME:-/usr/local/freesurfer}
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export OMP_NUM_THREADS=8
export SUBJECTS_DIR=$(pwd)
echo "FREESURFER_LICENSE value: $FREESURFER_LICENSE"
echo "FS_LICENSE value: $FS_LICENSE"
echo "license.txt content:"; cat license.txt

rm -rf output freesurfer
recon-all -i $t1 -subject output -all -parallel -openmp $OMP_NUM_THREADS

mkdir -p freesurfer
mv output freesurfer

echo '{"brainlife": []}' > product.json
