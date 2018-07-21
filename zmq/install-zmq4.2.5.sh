#!/bin/bash -e

apt-get update
apt-get install -y build-essential cmake git pkg-config unzip locate
apt-get install -y libsodium-dev
updatedb

cd /tmp
git clone https://github.com/zeromq/libzmq.git libzmq
cd libzmq
git checkout v4.2.5
mkdir -p ../build
cd ../build 
cmake -D BUILD_TESTS=OFF ../libzmq/
make
make install
cd ..
rm -Rf build
rm -Rf libzmq

pip install pyzmq --install-option="--zmq=bundled"

cd /tmp
git clone https://github.com/zeromq/cppzmq.git cppzmq
cd cppzmq
git checkout v4.2.3
mkdir -p ../build
cd ../build 
cmake -D CMAKE_BUILD_TYPE=Release ../cppzmq
make
make install
cd ..
rm -Rf build
rm -Rf cppzmq

cd /tmp
git clone https://github.com/zeromq/czmq.git czmq
cd czmq
git checkout v4.1.1
mkdir -p ../build
cd ../build 
cmake -D BUILD_TESTING=OFF ../czmq/
make
make install
cd ..
rm -Rf build
rm -Rf czmq

cd /tmp
git clone https://github.com/zeromq/zyre.git zyre
cd zyre
git checkout v2.0.0
mkdir -p ../build
cd ../build 
cmake -D BUILD_TESTING=OFF ../zyre/
make
make install
cd ..
rm -Rf build
rm -Rf zyre

cd /tmp
git clone https://github.com/google/flatbuffers.git flatbuffers
cd flatbuffers
git checkout v1.9.0
mkdir -p ../build
cd ../build 
cmake -D FLATBUFFERS_BUILD_SHAREDLIB=ON -D FLATBUFFERS_BUILD_TESTS=OFF ../flatbuffers
make
make install
cd ..
rm -Rf build
rm -Rf flatbuffers
rm -rf /var/lib/apt/lists/*


