#!/bin/bash 

apt-get update -y 
#apt-get install -y libxt-dev libgl1-mesa-dev 
#apt-get install -y libqt5x11extras5-dev qttools5-dev

export PATH=$PATH:/root/.pyenv/plugins/pyenv-virtualenv/shims:/root/.pyenv/shims:/root/.pyenv/bin

cd /tmp
 
# get vtk8
git clone --progress --verbose --branch 'v8.2.0.rc2'  https://github.com/Kitware/VTK.git  VTK-8.2.0.rc2
cd VTK-8.2.0.rc2

# Build Fails for 8.1.1 with Python 3.7 Wrapping
#patch -p0 < 17350.patch

cd /tmp/VTK-8.2.0.rc2


#======================================== build 3.7.0
pyenv global 3.7.0
pyenv rehash

mkdir build.3.7.0 
cd build.3.7.0
#      -DQt5_DIR:PATH=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5 \

cmake -DVTK_QT_VERSION:STRING=5 \
      -DVTK_Group_Qt:BOOL=ON \
      -DVTK_Group_Imaging:BOOL=ON \
      -DVTK_Group_Views:BOOL=ON \
      -DVTK_Group_Rendering:BOOL=ON \
      -DVTK_Group_StandAlone:BOOL=ON \
      -DVTK_Group_Web:BOOL=OFF \
      -DVTK_Group_MPI:BOOL=OFF \
      -DVTK_USE_LARGE_DATA:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/vtk/8.2/8.2.0.rc2 \
      -DVTK_WRAP_PYTHON:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX=/root/.pyenv/versions/3.7.0 \
      -DEXECUTABLE_OUTPUT_PATH=/root/.pyenv/versions/3.7.0/bin \
      -DPYTHON_VERSION_STRING=3.7.0 \
      -DVTK_PYTHON_VERSION=3.7.0 \
      -DPYTHON_VERSION_MAJOR=3 \
      -DPYTHON_VERSION_MINOR=7 \
      -DPYTHON_EXECUTABLE=/root/.pyenv/versions/3.7.0/bin/python3.7 \
      -DPYTHON_LIBRARIES=/root/.pyenv/versions/3.7.0/lib/libpython3.7m.so \
      -DPYTHON_INCLUDE_DIRS=/root/.pyenv/versions/3.7.0/include/python3.7m/ \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DCMAKE_BUILD_TYPE=Release \
      ..

make -j4 all 
make install 

#======================================== build 2.7.15

cd /tmp/VTK-8.2.0.rc2

pyenv global 2.7.15
pyenv rehash

mkdir build.2.7.15 
cd build.2.7.15
#     -DQt5_DIR:PATH=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5 \

cmake -DVTK_QT_VERSION:STRING=5 \
      -DVTK_Group_Qt:BOOL=ON \
      -DVTK_Group_Imaging:BOOL=ON \
      -DVTK_Group_Views:BOOL=ON \
      -DVTK_Group_Rendering:BOOL=ON \
      -DVTK_Group_StandAlone:BOOL=ON \
      -DVTK_Group_Web:BOOL=OFF \
      -DVTK_Group_MPI:BOOL=OFF \
      -DVTK_USE_LARGE_DATA:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/vtk/8.2/8.2.0.rc2 \
      -DVTK_WRAP_PYTHON:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX=/root/.pyenv/versions/2.7.15 \
      -DEXECUTABLE_OUTPUT_PATH=/root/.pyenv/versions/2.7.15/bin \
      -DVTK_PYTHON_VERSION=2.7.15 \
      -DPython_ADDITIONAL_VERSIONS=2.7 \
      -DPYTHON_VERSION_MAJOR=2 \
      -DPYTHON_VERSION_MINOR=7 \
      -DPYTHON_VERSION_STRING=2.7.15 \
      -DPYTHON_EXECUTABLE=/root/.pyenv/versions/2.7.15/bin/python2.7 \
      -DPYTHON_LIBRARIES=/root/.pyenv/versions/2.7.15/lib/libpython2.7.so \
      -DPYTHON_INCLUDE_DIRS=/root/.pyenv/versions/2.7.15/include/python2.7/ \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DCMAKE_BUILD_TYPE=Release \
      ..

make -j4 all 
make install 

#======================================== without python...
cd /tmp/VTK-8.2.0.rc2
mkdir build
cd build

#       -DQt5_DIR:PATH=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5 \

cmake -DVTK_QT_VERSION:STRING=5 \
      -DVTK_Group_Qt:BOOL=ON \
      -DVTK_Group_Imaging:BOOL=ON \
      -DVTK_Group_Views:BOOL=ON \
      -DVTK_Group_Rendering:BOOL=ON \
      -DVTK_Group_StandAlone:BOOL=ON \
      -DVTK_Group_Web:BOOL=OFF \
      -DVTK_Group_MPI:BOOL=OFF \
      -DVTK_USE_LARGE_DATA:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/vtk/8.2/8.2.0.rc2 \
      -DVTK_WRAP_PYTHON:BOOL=OFF \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DCMAKE_BUILD_TYPE=Release \
      ..

make -j4 all 
make install 

# why oh why ?
#ldconfig /usr/local/Qt/5.11/5.11.1/lib/

cd /tmp
rm -rf /var/lib/apt/lists/*


