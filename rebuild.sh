#!/bin/bash
#echo "delete all containers"
#./docker-rm-all

cd 000-root   ; ./build.sh ; cd ..
cd 010-tools  ; ./build.sh ; cd ..
cd 015-qt5    ; ./build.sh ; cd ..
cd 016-eigen3 ; ./build.sh ; cd ..
cd 017-ceres1 ; ./build.sh ; cd ..
cd 020-python ; ./build.sh ; cd ..
cd 025-pyqt5  ; ./build.sh ; cd ..
cd 030-vtk8   ; ./build.sh ; cd ..
cd 031-openmesh7  ; ./build.sh ; cd ..
cd 032-cgal4  ; ./build.sh ; cd ..
cd 038-tesseract ; ./build.sh ; cd ..
cd 039-caffe1 ; ./build.sh ; cd ..
cd 040-opencv3 ; ./build.sh ; cd ..
cd 050-pcl1 ; ./build.sh ; cd ..
cd 060-zmq4 ; ./build.sh ; cd ..
cd 999-base ; ./build.sh ; cd ..
cd A000-pytorch ; ./build.sh ; cd ..
#cd A020-caffe2 ; ./build.sh ; cd ..
cd A030-tensorflow ; ./build.sh ; cd ..

docker image list

