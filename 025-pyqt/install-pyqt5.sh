#!/bin/bash -e

PYQT_VERSION=5.10.1
SIP_VERSION=4.19.8

#export PATH="/root/.pyenv/bin:$PATH" 
#eval "$(pyenv init -)" 
#eval "$(pyenv virtualenv-init -)" 

cd /tmp

apt-key update && apt-get update 
apt-get install -y build-essential git wget curl pkg-config 
apt-get install -y ttf-dejavu*

# install some fonts
#mkdir -p /usr/local/Qt/5.11/5.11.1/lib/fonts/
#cp /usr/share/fonts/truetype/ttf-dejavu/*.ttf /usr/local/Qt/5.11/5.11.1/lib/fonts/

wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/sip/sip-$SIP_VERSION/sip-$SIP_VERSION.tar.gz
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-$PYQT_VERSION/PyQt5_gpl-$PYQT_VERSION.tar.gz
####################################################################################
pyenv global 3.7.0
#pip3.7 install enum34 

# Install sip
tar -xzvf sip-$SIP_VERSION.tar.gz
cd sip-$SIP_VERSION
python3 configure.py 
make && make install
cd /tmp

rm -rf sip-$SIP_VERSION/

# Install PyQt5
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd PyQt5_gpl-$PYQT_VERSION

python3 configure.py --confirm-license --qmake=/usr/local/Qt/5.11/5.11.1/bin/qmake
patch  configure.py < ../configure.patch
#/tmp/PyQt5_gpl-5.10.1/QtTest/sipQtTestQTest.cpp:281:14: error: 'waitForEvents' is not a member of 'QTest'
patch QtTest/sipQtTestQTest.cpp < ../sipQtTestQTest.patch
make -j4 
make install
cd /tmp
rm -rf PyQt5_gpl-$PYQT_VERSION
# Verify installation
# Verify installation
#python3 -c 'from PyQt5 import QtCore; print "Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR);'


####################################################################################
# install python stuff
pyenv global 2.7.15
#pip2.7 install enum34 

# Install sip
tar -xzvf sip-$SIP_VERSION.tar.gz
cd sip-$SIP_VERSION
python2.7 configure.py 
make && make install
cd /tmp
rm -rf sip-$SIP_VERSION/
# Install PyQt5
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd PyQt5_gpl-$PYQT_VERSION

python2.7 configure.py --confirm-license --qmake=/usr/local/Qt/5.11/5.11.1/bin/qmake
patch  configure.py < ../configure.patch
#/tmp/PyQt5_gpl-5.10.1/QtTest/sipQtTestQTest.cpp:281:14: error: 'waitForEvents' is not a member of 'QTest'
patch QtTest/sipQtTestQTest.cpp < ../sipQtTestQTest.patch
make -j4 
make install
cd /tmp
mv PyQt5_gpl-$PYQT_VERSION/examples /root/pyqt5-examples

rm -rf PyQt5_gpl-$PYQT_VERSION
# Verify installation
python2.7 -c 'from PyQt5 import QtCore; print "Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR);'
#rm *.patch
#CMD /shared/PyQt5_gpl-5.10.1/examples/qtdemo/qtdemo.py



####################################################################################
cd /tmp
rm -rf PyQt5_gpl-$PYQT_VERSION*
rm -rf sip*
rm -rf /var/lib/apt/lists/*



