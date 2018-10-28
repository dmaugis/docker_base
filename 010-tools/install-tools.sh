#!/bin/bash -e


echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

apt-get update
apt-get install -y --no-install-recommends locate
apt-get install -y --no-install-recommends ca-certificates
apt-get install -y --no-install-recommends apt-utils software-properties-common python-software-properties
apt-get install -y --no-install-recommends build-essential cmake git mercurial bzr pkg-config vim
apt-get install -y --no-install-recommends wget curl unzip tar

# allows easier doc of bash scripts
cd /usr/local/bin/
wget https://github.com/Sylvain303/docopts/releases/download/v0.6.3-alpha1/docopts
chmod a+x  docopts

rm -rf /var/lib/apt/lists/*

apt list --installed

