#!/bin/bash -e

apt-get update
apt-get install -y build-essential cmake git pkg-config unzip
#ln -s /usr/local/include/pcl-1.8/pcl /usr/local/include/pcl
# Install PCL
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
cd /tmp 
rm -Rf /tmp/pypcl/
git clone https://github.com/strawlab/python-pcl.git pypcl
cd pypcl
#git checkout pcl-1.8.1
PCL_ROOT=/usr/local/include/pcl-1.8
#PCL_ROOT=/usr/local/include/pcl-1.8
pip install cython==0.25.2
python setup.py build_ext -i
python setup.py install
cd /tmp
rm -Rf /tmp/pypcl
#ln -s /usr/local/include/pcl-1.8/pcl /usr/local/include/pcl
ln -s /usr/include/eigen3/Eigen /usr/include/Eigen
ln -s /usr/include/eigen3/unsupported /usr/include/unsupported
