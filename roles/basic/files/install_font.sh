#!/bin/bash

apt install -y zip fontconfig

curl -OL https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
cd ttf
cp * /usr/share/fonts/
fc-cache -f -v
fc-list | grep "Hack"
