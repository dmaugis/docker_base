#!/bin/bash -e

apt-key update 
apt-get update 
apt-get install -y -qq  \
  		build-essential cmake \
                tar \
                bison \
                flex \
                freeglut3-dev 

apt-get install -y python python-dev python-pip python-numpy


cd /tmp

# build qt5

wget --retry-connrefused http://download.qt.io/official_releases/qt/5.11/5.11.1/single/qt-everywhere-src-5.11.1.tar.xz 

tar -xvf qt-everywhere-src-5.11.1.tar.xz 

cd qt-everywhere-src-5.11.1 

./configure -release -opensource -confirm-license \
            -c++std c++11 \
            -skip qtandroidextras \
            -skip qtgamepad \
            -skip qtlocation \
            -skip qtmacextras \
            -skip qtserialbus \
            -skip qtserialport \
            -skip qtwayland \
            -skip qtsensors \
            -skip qtwebchannel \
            -skip qtvirtualkeyboard \
            -skip qtwebengine \
            -skip qtwebsockets \
            -nomake tests \
            -no-qml-debug \
            -shared \
            -qt-xcb \
            -prefix /usr/local/Qt/5.11/5.11.1

make -j4 all 

make install 

ldconfig /usr/local/Qt/5.11/5.11.1/lib

cd /tmp
rm -Rf qt-everywhere-src-5.11.1
rm qt-everywhere-src-5.11.1.tar.xz
rm -rf /var/lib/apt/lists/*

