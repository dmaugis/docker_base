#!/bin/bash -e

cd /tmp

echo "9698bee364c9ebfa817a455a5c06c29d" > /etc/machine-id

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

apt-get update
apt-get install -y qt5-default qtbase5-examples qt5-qmake qt5-image-formats-plugins \
                   libqt5x11extras5-dev qttools5-dev qttools5-dev-tools \
                   qtquick1-5-dev qtscript5-dev \
                   qttools5-dev qtmultimedia5-dev libqt5svg5-dev libqt5webkit5-dev \
                   libqt5xmlpatterns5-dev libqt5xmlpatterns5 libqt5xmlpatterns5-private-dev

rm /tmp/install-qt5.sh
rm -rf /var/lib/apt/lists/*
pkg-installed


