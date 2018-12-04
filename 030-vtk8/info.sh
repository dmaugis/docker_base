#!/bin/bash
echo "======================================================================================"
pyenv global 2.7.15
ldconfig /usr/local/Qt/5.11/5.11.1/lib/
export PYTHONPATH=/root/.pyenv/versions/2.7.15/lib/:/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages:/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages/vtkmodules
./info.py
python CylinderExample.py
echo "======================================================================================"
pyenv global 3.7.0
export PYTHONPATH=/root/.pyenv/versions/3.7.0/lib/:/root/.pyenv/versions/3.7.0/lib/python3.7/site-packages:/root/.pyenv/versions/3.7.0/lib/python3.7/site-packages/vtkmodules
ldconfig /usr/local/Qt/5.11/5.11.1/lib/
./info.py
python CylinderExample.py
