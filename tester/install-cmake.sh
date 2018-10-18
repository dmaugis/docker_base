
apt-get update -y
apt-get install -y libcurl4-openssl-dev 
apt-get -y install libncurses5-dev
mkdir -p ~/tmp/cmake
cd ~/tmp/cmake
wget https://cmake.org/files/v3.10/cmake-3.10.2.tar.gz
tar -xzf cmake-3.10.2.tar.gz
cd cmake-3.10.2/
./bootstrap --system-curl 
#--qt-gui
make
make install





