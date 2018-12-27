#!/bin/bash -e

apt-get update
apt-get update && apt-get install -y --no-install-recommends \
        libopenblas-dev   \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        libsuitesparse-dev  


mkdir -p /tmp/build
cd /tmp/build

git clone --verbose --progress -b "3.3.5" https://github.com/eigenteam/eigen-git-mirror.git --recursive eigen
mkdir eigen_build && cd eigen_build
cmake . ../eigen
make &&  make install
cd ..

cd /root
g++ -I/usr/local/include/eigen3/ sample_eigen3.cpp -o sample_eigen3
./sample_eigen3

rm -Rf /tmp/eigen*
rm -Rf /tmp/build
rm -rf /var/lib/apt/lists/*
rm /tmp/install-eigen3.sh
#pkg-installed



