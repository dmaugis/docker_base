#!/bin/bash -e

apt-get update -y 

apt-get install -y build-essential cmake 
apt-get install -y libxt-dev libgl1-mesa-dev
apt-get install -y perl python python-dev

cd /tmp

# Install vtk8

wget --retry-connrefused https://www.vtk.org/files/release/8.1/VTK-8.1.1.tar.gz 
tar -zxvf VTK-8.1.1.tar.gz 
cd VTK-8.1.1

#sed -i 's/\/\/#define\ GLX_GLXEXT_LEGACY/#define\ GLX_GLXEXT_LEGACY/g' Rendering/OpenGL/vtkXOpenGLRenderWindow.cxx
mkdir build 
cd build
cmake -DVTK_QT_VERSION:STRING=5 \
      -DQt5_DIR:PATH=/usr/local/Qt/5.11/5.11.1/lib/cmake/Qt5 \
      -DVTK_Group_Qt:BOOL=ON \
      -DVTK_Group_Imaging:BOOL=ON \
      -DVTK_Group_Views:BOOL=ON \
      -DVTK_Group_Rendering:BOOL=ON \
      -DVTK_Group_Qt:BOOL=ON \
      -DVTK_USE_LARGE_DATA:BOOL=ON \
      -DVTK_PYTHON_VERSION:STRING="2.7" \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/vtk/8.1/8.1.1 \
      -DVTK_WRAP_PYTHON:BOOL=ON \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      ..


make all 
make install 
ldconfig /usr/local/vtk/8.1/8.1.1/lib/

cd /tmp
rm VTK-8.1.1.tar.gz
rm -Rf VTK-8.1.1
rm -rf /var/lib/apt/lists/*


