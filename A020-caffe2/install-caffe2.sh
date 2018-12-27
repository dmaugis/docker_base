#!/bin/bash -e

cd /tmp

export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 
pyenv global 2.7.15

apt-get update
apt-get install -y --no-install-recommends \
      libgoogle-glog-dev \
      libgtest-dev \
      libiomp-dev \
      libleveldb-dev \
      liblmdb-dev \
      libopenmpi-dev \
      libsnappy-dev \
      libprotobuf-dev \
      openmpi-bin \
      openmpi-doc \
      protobuf-compiler 

apt-get install -y --no-install-recommends libgflags-dev

          
pip2.7 install \
      future \
      numpy \
      protobuf \
      typing

git clone --progress --verbose  https://github.com/pytorch/pytorch.git 
cd pytorch
git submodule update --init --recursive
python2.7 setup.py install

cd ~ 
#python2.7 -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"
#python2.7 -c 'from caffe2.python import workspace; print(workspace.NumCudaDevices())'

rm -rf /var/lib/apt/lists/*




