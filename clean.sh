#!/usr/bin/env bash

# clean thirdparty install and compiled libraries  

# ====================================================
# import the utils 
. bash_utils.sh 

# ====================================================

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

set -e

print_blue "=================================================================="
print_blue "cleaning thirdparty packages and utils..."

rm -Rf thirdparty/pangolin 

rm -Rf thirdparty/g2opy

rm -Rf thirdparty/protoc                   # set by install_delf.sh 

rm -Rf thirdparty/orbslam2_features/build
rm -Rf thirdparty/orbslam2_features/lib

rm -Rf cpp/utils/build  
rm -Rf cpp/utils/lib 

if [ -d "thirdparty/opencv-python" ]; then
    rm -Rf "thirdparty/opencv-python"
fi

if [ -d "thirdparty/open3d" ]; then
    rm -Rf thirdparty/open3d
fi

if [ -d "thirdparty/opencv" ]; then
    rm -Rf thirdparty/opencv
fi

cd thirdparty/pydbow3
./clean.sh
cd $SCRIPT_DIR

cd thirdparty/pydbow2
./clean.sh
cd $SCRIPT_DIR

cd thirdparty/pyibow
./clean.sh
cd $SCRIPT_DIR


# clean downloaded models and reset submodules
# git submodule foreach 'git reset --hard; git clean -xfd'