#!/bin/bash -e

apt-get update
apt-get install -y build-essential cmake cmake-gui git pkg-config unzip

#pip install --no-cache-dir numpy matplotlib scipy

apt-get install -y libeigen3-dev libatlas-base-dev liblapacke-dev 
apt-get install -y libjpeg-dev libpng-dev libtiff-dev libfreetype6-dev
apt-get install -y libav-tools libavcodec-dev libavformat-dev libv4l-dev libdc1394-22-dev libswscale-dev libavresample-dev 

# Latest ubuntu come without jasper
# So, get it, install it, and then clean
wget http://launchpadlibrarian.net/257156898/libjasper1_1.900.1-debian1-2.4+deb8u1_amd64.deb 
wget http://launchpadlibrarian.net/257156894/libjasper-dev_1.900.1-debian1-2.4+deb8u1_amd64.deb 
dpkg -i libjasper1_1.900.1-debian1-2.4+deb8u1_amd64.deb 
dpkg -i libjasper-dev_1.900.1-debian1-2.4+deb8u1_amd64.deb 
rm libjasper-dev_1.900.1-debian1-2.4+deb8u1_amd64.deb 
rm libjasper1_1.900.1-debian1-2.4+deb8u1_amd64.deb

cd /tmp

export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 
pyenv global 2.7.15

# Get OpenCV
git clone https://github.com/opencv/opencv.git 
cd opencv 
git checkout 3.4.2
cd ..
# Get OpenCV contrib modules
git clone https://github.com/opencv/opencv_contrib 
cd opencv_contrib
git checkout 3.4.2
cd ..

mkdir -p /tmp/build 
cd /tmp/build 

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D ENABLE_PRECOMPILED_HEADERS=OFF \
      -D ENABLE_CXX11=ON \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D WITH_CUDA=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib/modules \
      -D BUILD_EXAMPLES=OFF \
      -D WITH_OPENGL=ON \
      -D BUILD_NEW_PYTHON_SUPPORT=ON \
      -D BUILD_DOCS=OFF \
      -D BUILD_TESTS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_JAVA=OFF \
      -D WITH_TBB=ON \
      -D WITH_OPENMP=ON \
      -D WITH_IPP=ON \
      -D WITH_CSTRIPES=ON \
      -D WITH_OPENCL=ON \
      -D WITH_V4L=ON \
      -D WITH_VTK=ON \
      -D WITH_QT=ON \
      -D QT_QMAKE_EXECUTABLE=/usr/local/Qt/5.11/5.11.1/bin/qmake \
      -D Qt5_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5 \
      -D Qt5Core_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Core \
      -D Qt5Concurrent_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Concurrent \
      -D Qt5Gui_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Gui \
      -D Qt5Test_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Test \
      -D Qt5Widgets_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5Widgets \
      -D Qt5OpenGL_DIR=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5OpenGL \
      ../opencv

make -j4 
make install 
cd /tmp
rm -Rf build
rm -Rf opencv*
ldconfig 
rm -rf /var/lib/apt/lists/*

