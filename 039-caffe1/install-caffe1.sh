#!/bin/bash -e

cd /tmp

PYTHON_VERSION=2.7.15

pyenv global $PYTHON_VERSION

apt-get update
apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler

export CAFFE_ROOT=/opt/caffe

export CLONE_TAG=1.0    

cd /tmp
git clone --verbose --progress --depth 1 https://github.com/BVLC/caffe.git 
cd /tmp/caffe

mkdir build
cd build 
#cmake -DUSE_CUDNN=1 -DUSE_NCCL=1 -DBUILD_docs=FALSE -DBUILD_python=OFF -DUSE_OPENCV=FALSE -DCMAKE_INSTALL_PREFIX=/usr/local/caffe1/ .. 
cmake -Wno-dev -DUSE_CUDNN=1 -DUSE_NCCL=1 -DBUILD_docs=FALSE -DUSE_OPENCV=FALSE -DCMAKE_INSTALL_PREFIX=$CAFFE_ROOT .. 
make -j4
make install

pip install -r /opt/caffe/python/requirements.txt 

mv $CAFFE_ROOT/python $CAFFE_ROOT/python-$PYTHON_VERSION

export LD_LIBRARY_PATH=/opt/caffe/lib:$LD_LIBRARY_PATH
export PYCAFFE_ROOT=$CAFFE_ROOT/python-$PYTHON_VERSION
export PYTHONPATH=$PYCAFFE_ROOT:$PYTHONPATH
export PATH=$CAFFE_ROOT/tools:$PYCAFFE_ROOT:$PATH

#make runtest

cd ..

rm -Rf /tmp/caffe
rm -rf /var/lib/apt/lists/*






