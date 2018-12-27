#!/bin/bash
#

cd /tmp
PYQT_VERSION=5.10.1
SIP_VERSION=4.19.8
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/sip/sip-$SIP_VERSION/sip-$SIP_VERSION.tar.gz
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-$PYQT_VERSION/PyQt5_gpl-$PYQT_VERSION.tar.gz

####################################################################################
pyenv global 3.7.0
#pip install pyqt5

# install sip
tar -xzvf sip-$SIP_VERSION.tar.gz
cd sip-$SIP_VERSION
python3.7 configure.py 
make && make install
cd /tmp
rm -rf sip-$SIP_VERSION/

# Install PyQt5
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd PyQt5_gpl-$PYQT_VERSION
python configure.py --confirm-license --verbose --qmake `which qmake`
patch QtTest/sipQtTestQTest.cpp < ../sipQtTestQTest.patch
make -j4 
make install
cd /tmp
rm -rf PyQt5_gpl-$PYQT_VERSION

####################################################################################

cd /tmp

pyenv global 2.7.15

# install sip
tar -xzvf sip-$SIP_VERSION.tar.gz
cd sip-$SIP_VERSION
python2.7 configure.py 
make && make install
cd /tmp
rm -rf sip-$SIP_VERSION/

# Install PyQt5
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd PyQt5_gpl-$PYQT_VERSION
#patch  configure.py < ../configure.patch
python configure.py --confirm-license --verbose --qmake `which qmake`
patch QtTest/sipQtTestQTest.cpp < ../sipQtTestQTest.patch
make -j4 
make install
mv PyQt5_gpl-$PYQT_VERSION/examples /usr/share/pyqt5/examples
rm -rf PyQt5_gpl-$PYQT_VERSION





cd /tmp
rm -rf PyQt5_gpl-*
rm -rf sip*
rm -rf /var/lib/apt/lists/*



