#!/bin/bash -e

cd /tmp

export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 
pyenv global 2.7.15

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
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler

apt-get install -y --no-install-recommends libgflags-dev

export CAFFE_ROOT=/opt/caffe
mkdir -p $CAFFE_ROOT
cd $CAFFE_ROOT
export CLONE_TAG=1.0    

git clone --depth 1 https://github.com/BVLC/caffe.git . 

cd python
for req in $(cat requirements.txt) pydot; 
    do pip2.7 install $req; 
done
cd .. 
git clone https://github.com/NVIDIA/nccl.git 
cd nccl
make 
cd ..
rm -rf nccl
mkdir build
cd build 
cmake -DUSE_CUDNN=1 -DUSE_NCCL=1 .. 
make -j4

export PYCAFFE_ROOT=$CAFFE_ROOT/python
export PYTHONPATH=$PYCAFFE_ROOT:$PYTHONPATH
export PATH=$CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig


rm -rf /var/lib/apt/lists/*




