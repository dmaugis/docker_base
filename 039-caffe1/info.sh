#!/bin/bash
echo "======================================================================================"
pyenv global 2.7.15
ldconfig /usr/local/Qt/5.11/5.11.1/lib/
export PYTHONPATH=/root/.pyenv/versions/2.7.15/lib/:/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages:/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages/vtkmodules
export PYTHON_VERSION=2.7.15
export CAFFE_ROOT=/opt/caffe
export PYCAFFE_ROOT=$CAFFE_ROOT/python-$PYTHON_VERSION
export PYTHONPATH=$PYCAFFE_ROOT:$PYTHONPATH
export PATH=$CAFFE_ROOT/tools:$PYCAFFE_ROOT:$PATH
export LD_LIBRARY_PATH=$CAFFE_ROOT/lib:$LD_LIBRARY_PATH
./info.py
echo "======================================================================================"
pyenv global 3.7.0
export PYTHONPATH=/root/.pyenv/versions/3.7.0/lib/:/root/.pyenv/versions/3.7.0/lib/python3.7/site-packages:/root/.pyenv/versions/3.7.0/lib/python3.7/site-packages/vtkmodules
ldconfig /usr/local/Qt/5.11/5.11.1/lib/
./info.py
echo "======================================================================================"
tesseract -v



