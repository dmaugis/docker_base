#!/bin/bash -e

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
        protobuf-compiler \
        libsuitesparse-dev  

cd /tmp

#Eigen (Required)
hg clone https://bitbucket.org/eigen/eigen#3.2
mkdir eigen_build && cd eigen_build
cmake . ../eigen
make &&  make install
cd ..

#Ceres (Required)
#git clone https://ceres-solver.googlesource.com/ceres-solver ceres-solver
git clone -b 1.14.x https://ceres-solver.googlesource.com/ceres-solver

mkdir ceres_build && cd ceres_build/
#cmake . ../ceres-solver/ -DMINIGLOG=ON -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF
cmake . ../ceres-solver/ -DBUILD_TESTING=OFF 
#cmake . ../ceres-solver/ 
make -j2 &&  make install
#make test
cp -Rf bin /usr/local/bin/ceres
cd ..

cd ..

rm -Rf /tmp/ceres*
rm -Rf /tmp/eigen*
rm -rf /var/lib/apt/lists/*


