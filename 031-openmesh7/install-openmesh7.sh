#!/bin/bash -e

apt-get update
apt-get install -y libxmu-dev libxi-dev

cd /tmp

git clone --progress --verbose -b 'OpenMesh-7.1' https://www.graphics.rwth-aachen.de:9000/OpenMesh/OpenMesh.git
mkdir build_OpenMesh && cd build_OpenMesh

cmake . ../OpenMesh -DCMAKE_BUILD_TYPE=Release 

make -j4 install

cd ..
rm -Rf /tmp/OpenMesh
rm -Rf /tmp/build_OpenMesh

rm -rf /var/lib/apt/lists/*
rm /tmp/install-openmesh7.sh
pkg-installed



