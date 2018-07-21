#!/bin/bash -e

apt-get update
apt-get install -y build-essential cmake git pkg-config unzip
apt-get install -y libboost-all-dev
apt-get install -y libflann-dev 

# Install PCL

cd /tmp 
git clone https://github.com/PointCloudLibrary/pcl.git pcl
cd pcl
git checkout pcl-1.8.1
mkdir -p ../build
cd ../build 
#cmake -D WITH_CUDA=true -D BUILD_GPU=true -D BUILD_visualization=true -D BUILD_CUDA=true -D BUILD_2d=true ..
#make -j 4
#make install
cmake -D Qt5Concurrent_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Concurrent \
      -D Qt5OpenGL_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5OpenGL \
      -D WITH_CUDA=ON \
      -D WITH_OPENGL=ON \
      -D WITH_QT=ON \
      -D WITH_VTK=ON \
      -D WITH_OpenNI=OFF \
      -D WITH_OpenNI2=OFF \
      -D BUILD_example=OFF \
      -D BUILD_global_tests=OFF \
      ../pcl

make -j 4
make install
cd /tmp
rm -Rf build
rm -Rf pcl
ldconfig 
