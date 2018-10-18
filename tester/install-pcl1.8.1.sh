#!/bin/bash -e

apt-get update
apt-get install -y build-essential cmake git pkg-config unzip
apt-get install -y libboost-all-dev
apt-get install -y libflann-dev 


pyenv global 2.7.15


# Install PCL

cd /tmp 
git clone --progress --verbose https://github.com/PointCloudLibrary/pcl.git pcl
cd pcl
git checkout pcl-1.8.1
mkdir -p ../build_pcl
cd ../build_pcl

cmake -D Qt5Concurrent_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Concurrent \
      -D Qt5OpenGL_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5OpenGL \
      -D VTK_DIR=/usr/local/vtk/8.1/8.1.1/lib/cmake/vtk-8.1/ \
      -D WITH_CUDA=ON \
      -D WITH_OPENGL=ON \
      -D WITH_QT=ON \
      -D WITH_VTK=ON \
      -D WITH_OpenNI=OFF \
      -D WITH_OpenNI2=OFF \
      -D BUILD_example=ON \
      -D BUILD_global_tests=OFF \
      ../pcl

make -j 4
make install

#cp surface/include/pcl/surface/*_hull.h /usr/local/include/pcl-1.8/pcl/surface/

cd /tmp

git clone --progress --verbose  https://github.com/strawlab/python-pcl.git

pip install cython==0.25.2

exit 0

rm -Rf build_pcl
rm -Rf pcl
rm -rf /var/lib/apt/lists/*


# https://python-pcl-fork.readthedocs.io/en/latest/install.html
cd /tmp
git clone --progress --verbose  https://github.com/strawlab/python-pcl.git
cd python-pcl
pip install -e .
rm -Rf python-pcl

pyenv global 3.7.0
git clone --progress --verbose  https://github.com/strawlab/python-pcl.git
cd python-pcl
pip install -e .
rm -Rf python-pcl


rm -rf /var/lib/apt/lists/*

