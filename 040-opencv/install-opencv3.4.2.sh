#!/bin/bash -e

apt-get update
apt-get install -y build-essential cmake cmake-gui git pkg-config unzip

#pip install --no-cache-dir numpy matplotlib scipy

apt-get install -y libeigen3-dev libatlas-base-dev liblapacke-dev 
apt-get install -y libjpeg-dev libpng-dev libtiff-dev libfreetype6-dev
apt-get install -y libav-tools libavcodec-dev libavformat-dev libv4l-dev libdc1394-22-dev libswscale-dev libavresample-dev 
apt-get install -y libgflags-dev libgoogle-glog-dev 

# Latest ubuntu come without jasper
# So, get it, install it, and then clean
wget http://launchpadlibrarian.net/257156898/libjasper1_1.900.1-debian1-2.4+deb8u1_amd64.deb 
wget http://launchpadlibrarian.net/257156894/libjasper-dev_1.900.1-debian1-2.4+deb8u1_amd64.deb 
dpkg -i libjasper1_1.900.1-debian1-2.4+deb8u1_amd64.deb 
dpkg -i libjasper-dev_1.900.1-debian1-2.4+deb8u1_amd64.deb 
rm libjasper-dev_1.900.1-debian1-2.4+deb8u1_amd64.deb 
rm libjasper1_1.900.1-debian1-2.4+deb8u1_amd64.deb

cd /tmp

# Get OpenCV
git clone  --progress --verbose https://github.com/opencv/opencv.git 
cd opencv 
git checkout 3.4.2
cd ..
# Get OpenCV contrib modules
git clone  --progress --verbose https://github.com/opencv/opencv_contrib 
cd opencv_contrib
git checkout 3.4.2
cd ..

#-------------------------------------------------------------------

pyenv global 2.7.15
mkdir -p /tmp/build 
cd /tmp/build


cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D ENABLE_PRECOMPILED_HEADERS=OFF \
      -D ENABLE_CXX11=ON \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D WITH_CUDA=ON \
      -D INSTALL_C_EXAMPLES=ON \
      -D PYTHON2_EXECUTABLE=/root/.pyenv/versions/2.7.15/bin/python2.7 \
      -D PYTHON2_INCLUDE_DIR=/root/.pyenv/versions/2.7.15/include/python2.7/ \
      -D PYTHON2_LIBRARY=/root/.pyenv/versions/2.7.15/lib/libpython2.7.so \
      -D PYTHON2_PACKAGES_PATH=/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages \
      -D PYTHON2_NUMPY_INCLUDE_DIRS=/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages/numpy/core/include \
      -D PYTHON3_EXECUTABLE=/root/.pyenv/versions/3.7.0/bin/python3.7 \
      -D PYTHON3_INCLUDE_DIR=/root/.pyenv/versions/3.7.0/include/python3.7m/ \
      -D PYTHON3_LIBRARY=/root/.pyenv/versions/3.7.0/lib/libpython3.7m.so \
      -D PYTHON3_PACKAGES_PATH=/root/.pyenv/versions/3.7.0/lib/python3.7/site-packages \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=/root/.pyenv/versions/3.7.0/lib/python3.7/site-packages/numpy/core/include \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
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
      -D FORCE_VTK=ON \
      -D WITH_VTK=ON \
      -D WITH_QT=ON \
      -D WITH_OPENCL=OFF \
      -D Caffe_INCLUDE_DIR=/usr/local/caffe1/include \
      -D Caffe_LIBS=/usr/local/caffe1/lib \
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
#ldconfig 
rm -rf /var/lib/apt/lists/*

