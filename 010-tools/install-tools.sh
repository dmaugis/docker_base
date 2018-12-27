#!/bin/bash

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# tools
apt-get update
apt-get install -y --no-install-recommends locate
apt-get install -y --no-install-recommends ca-certificates
apt-get install -y --no-install-recommends apt-utils software-properties-common python-software-properties
apt-get install -y --no-install-recommends build-essential cmake git mercurial bzr pkg-config vim
apt-get install -y --no-install-recommends wget curl unzip tar
apt-get install -y --no-install-recommends bison flex 

# graphic libs
apt-get install -y --no-install-recommends freeglut3-dev libxt-dev libgl1-mesa-dev 

# utility libs
apt-get install -y --no-install-recommends libboost-all-dev libgflags-dev libgoogle-glog-dev 
apt-get install -y --no-install-recommends libtbb-dev mpi-default-dev

# math libs
apt-get install -y --no-install-recommends libsuitesparse-dev  libatlas-base-dev 
apt-get install -y  libgmp-dev libmpfr-dev libmetis-dev libmpfi-dev libntl-dev


# allows easier argument parsing on bash scripts
cd /usr/local/bin/
wget https://github.com/Sylvain303/docopts/releases/download/v0.6.3-alpha1/docopts
chmod a+x  docopts

#updatedb
rm -rf /var/lib/apt/lists/*
rm /tmp/install-tools.sh
pkg-installed




