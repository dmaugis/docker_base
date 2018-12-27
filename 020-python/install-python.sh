#!/bin/bash -e

cd /tmp

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

apt-get update
apt-get install -y --no-install-recommends apt-utils
apt-get install -y --no-install-recommends build-essential cmake git mercurial bzr pkg-config vim
apt-get install -y --no-install-recommends wget curl unzip tar


### install pyenv [
#https://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get
apt-get install -y --no-install-recommends build-essential libbz2-dev libssl-dev libreadline-dev libsqlite3-dev tk-dev
# optional scientific package headers (for Numpy, Matplotlib, SciPy, etc.)
apt-get install -y --no-install-recommends libpng-dev libfreetype6-dev  
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
cat <<'EOF' >> ~/.bashrc 
export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 
EOF
cat <<'EOF' >> ~/.profile
export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 
EOF
export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 


apt-get install -y --no-install-recommends libffi-dev
### ] install pyenv

### build install python 3.7.0 [
CONFIGURE_OPTS=--enable-shared pyenv install 3.7.0
#pyenv virtualenv 3.7.0 python3.7.0
### ] build install python 3.7.0
### build install python 2.7.15 [
CONFIGURE_OPTS=--enable-shared pyenv install 2.7.15
#pyenv virtualenv 2.7.15 python2.7.15
### ] build install python 2.7.15

pyenv global 3.7.0
pip3.7 install --upgrade pip
pip3.7 install h5py
pip3.7 install PyOpenGL
pip3.7 install Pillow
pip3.7 install cython
pip3.7 install numpy
pip3.7 install scipy
pip3.7 install scikit-image
pip3.7 install scikit-learn
pip3.7 install pandas
pip3.7 install matplotlib
pip3.7 install seaborn
#pip3.7 install bokeh
#pip3.7 install plotly
pip3.7 install jupyter
#pip3.7 install enum34 
#pip3.7 install visdom dominate
pip3.7 install setuptools
pip3.7 install protobuf

pyenv global 2.7.15
pip2.7 install --upgrade pip
pip2.7 install h5py
pip2.7 install PyOpenGL
pip2.7 install Pillow
pip2.7 install cython
pip2.7 install numpy
pip2.7 install scipy
pip2.7 install scikit-image
pip2.7 install scikit-learn
pip2.7 install pandas
pip2.7 install matplotlib
pip2.7 install seaborn
#pip2.7 install bokeh
#pip2.7 install plotly
pip2.7 install jupyter
pip2.7 install enum34 
pip2.7 install future
#pip2.7 install visdom dominate
pip2.7 install setuptools
pip2.7 install protobuf

rm /tmp/python-build.*.log
rm -rf /var/lib/apt/lists/*



