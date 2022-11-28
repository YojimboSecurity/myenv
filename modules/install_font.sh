#!/bin/bash

curl -OL https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
cp ttf/* /usr/share/fonts/
fc-cache -f -v
fc-list | grep "Hack"
