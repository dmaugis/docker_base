#!/bin/bash -e

PYQT_VERSION=5.10.1
SIP_VERSION=4.19.8

cd /tmp
apt-key update && apt-get update 
apt-get install -y build-essential git wget curl pkg-config 

# install python stuff
apt-get install -y python python-dev python-pip python-numpy 

pip install enum34 

apt-get install -y ttf-dejavu*

mkdir -p /usr/local/Qt/5.11/5.11.1/lib/fonts/
cp /usr/share/fonts/truetype/ttf-dejavu/*.ttf /usr/local/Qt/5.11/5.11.1/lib/fonts/

# Install sip
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/sip/sip-$SIP_VERSION/sip-$SIP_VERSION.tar.gz
tar -xzvf sip-$SIP_VERSION.tar.gz
cd sip-$SIP_VERSION
python configure.py 
make && make install
cd /tmp
rm -rf sip-$SIP_VERSION*

# Install PyQt5
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-$PYQT_VERSION/PyQt5_gpl-$PYQT_VERSION.tar.gz
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd PyQt5_gpl-$PYQT_VERSION

python configure.py --confirm-license --qmake=/usr/local/Qt/5.11/5.11.1/bin/qmake
patch  configure.py < ../configure.patch
#/tmp/PyQt5_gpl-5.10.1/QtTest/sipQtTestQTest.cpp:281:14: error: 'waitForEvents' is not a member of 'QTest'
patch QtTest/sipQtTestQTest.cpp < ../sipQtTestQTest.patch
make -j4 
make install
cd /tmp
rm -rf PyQt5_gpl-$PYQT_VERSION*
rm *.patch

#CMD /shared/PyQt5_gpl-5.10.1/examples/qtdemo/qtdemo.py

rm -rf /var/lib/apt/lists/*



