#!/bin/bash -e

cd $HOME

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#Prepare and empty machine for building:
apt-get update
apt-get -y install libgmp-dev libmpfr-dev zlib1g-dev libtbb-dev libmetis-dev libmpfi-dev libntl-dev
apt-get -y install libatlas-base-dev libsuitesparse-dev libipe-dev cimg-dev
cd /tmp


# LASlib is a C++ library for handling LIDAR data sets stored in the LAS format (or the compressed LAZ format).
git clone https://github.com/LASzip/LASzip.git
mkdir build_LASzip && cd build_LASzip
cmake . ../LASzip
make
make install
cd ..
rm -Rf /tmp/LASzip
rm -Rf /tmp/build_LASzip


cd /tmp
git clone --progress --verbose -b 'releases/CGAL-4.13' https://github.com/CGAL/cgal.git
mkdir build_cgal && cd build_cgal
cmake . ../cgal \
-DCMAKE_BUILD_TYPE=Release \
-DQt5_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5 \
-DWITH_BLAS=ON \
-DWITH_Eigen3=ON -DWITH_OpenGL=ON -DWITH_MPFI=ON -DWITH_MPFR=ON \
-DWITH_ZLIB=ON -DWITH_demos=ON -DWITH_examples=ON \
-DVTK_DIR=/usr/local/vtk/8.1/8.1.1/lib/cmake/vtk-8.1 \
-DLASZIP_INCLUDE_DIR=/usr/local/include/laszip 
make -j4 &&  make -j4 demos && make install
cd ..
rm -Rf /tmp/cgal
rm -Rf /tmp/build_cgal

rm -rf /var/lib/apt/lists/*


