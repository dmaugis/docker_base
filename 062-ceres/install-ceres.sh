#!/bin/bash -e

cd /tmp

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#Prepare and empty machine for building:
apt-get update 
#-qq &&  apt-get install -qq
#apt-get install -y --no-install-recommends ca-certificates build-essential 
#apt-get -y install libpng-dev libjpeg-dev libtiff-dev 
#apt-get -y install libglu1-mesa-dev libboost-iostreams-dev 
apt-get -y install libboost-program-options-dev libboost-system-dev libboost-serialization-dev 
apt-get -y install libatlas-base-dev libsuitesparse-dev    
#apt-get -y install libxxf86vm1 libxxf86vm-dev libxi-dev libxrandr-dev   
#apt-get -y install graphviz  libcgal-dev 

#Ceres (Required)
#git clone https://ceres-solver.googlesource.com/ceres-solver ceres-solver
git clone -b 1.14.x https://ceres-solver.googlesource.com/ceres-solver

mkdir ceres_build && cd ceres_build/
#cmake . ../ceres-solver/ -DMINIGLOG=ON -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF
cmake . ../ceres-solver/ -DBUILD_EXAMPLES=ON
make -j4
make install

rm -Rf /tmp/ceres-solver
rm -Rf /tmp/ceres_build

rm -rf /var/lib/apt/lists/*


