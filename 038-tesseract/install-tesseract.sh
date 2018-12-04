#!/bin/bash -e

apt-get update
apt-get install -y software-properties-common python-software-properties
#install tesseract
add-apt-repository ppa:alex-p/tesseract-ocr
apt-get update
apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev
apt-get install -y tesseract-ocr-eng
#apt-get install -y tesseract-ocr-fra
#apt install -y tesseract-ocr-all 
pyenv global 3.7.0
pip install --no-cache-dir pytesseract
pyenv global 2.7.15
pip install --no-cache-dir pytesseract


rm -rf /var/lib/apt/lists/*

