#!/bin/bash -e

apt-get update -y 
apt-get install -y build-essential cmake
apt-get install -y libboost-all-dev
apt-get install -y python python-dev python-pip python-numpy

# install opengl support
pip install PyOpenGL PyOpenGL_accelerate

# install cuda support
cd /tmp
git clone --recursive http://git.tiker.net/trees/pycuda.git
cd pycuda
python configure.py --cuda-root=/usr/local/cuda
make install
#python test/test_driver.py
#python test/test_gpuarray.py
#python test/test_cumath.py
cd /tmp
rm -Rf pycuda

rm -rf /var/lib/apt/lists/*



