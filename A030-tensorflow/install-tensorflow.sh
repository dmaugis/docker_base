#!/bin/bash -e

cd /tmp

export PATH="/root/.pyenv/bin:$PATH" 
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)" 
pyenv global 2.7.15

apt-get update

pip2.7 install tensorflow-gpu
pip2.7 install keras

rm -rf /var/lib/apt/lists/*




