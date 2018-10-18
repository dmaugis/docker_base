#!/bin/bash
echo "======================================================================================"
pyenv global 2.7.15

export PYTHON_VERSION=2.7.15
export CAFFE_ROOT=/opt/caffe
export PYCAFFE_ROOT=$CAFFE_ROOT/python-$PYTHON_VERSION
export PYTHONPATH=$PYCAFFE_ROOT:$PYTHONPATH
export PATH=$CAFFE_ROOT/tools:$PYCAFFE_ROOT:$PATH
export LD_LIBRARY_PATH=$CAFFE_ROOT/lib:$LD_LIBRARY_PATH
./info.py
exit
echo "======================================================================================"
pyenv global 3.7.0
./info.py
echo "======================================================================================"
tesseract -v


