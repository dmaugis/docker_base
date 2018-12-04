#!/bin/bash -e

cd /tmp

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

apt-get update
apt-get install -y --no-install-recommends apt-utils
apt-get install -y --no-install-recommends build-essential cmake git mercurial pkg-config vim 
apt-get install -y --no-install-recommends wget curl unzip tar
apt-get install -y --no-install-recommends bison flex 
apt-get install -y --no-install-recommends freeglut3-dev 
apt-get install -y ttf-dejavu*

# install some fonts
mkdir -p /usr/local/Qt/5.11/5.11.1/lib/fonts/
cp /usr/share/fonts/truetype/ttf-dejavu/*.ttf /usr/local/Qt/5.11/5.11.1/lib/fonts/

# build qt5
cd /tmp
wget --retry-connrefused http://download.qt.io/official_releases/qt/5.11/5.11.1/single/qt-everywhere-src-5.11.1.tar.xz 
tar -xvf qt-everywhere-src-5.11.1.tar.xz 
cd qt-everywhere-src-5.11.1 
# https://stackoverflow.com/questions/50785575/configuring-qtbase-fails-with-an-error-could-not-find-qmake-spec
./configure -release -opensource -confirm-license -platform linux-g++ \
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

