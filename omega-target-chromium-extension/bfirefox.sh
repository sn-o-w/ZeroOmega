#!/bin/bash
. ~/.nvm/nvm.sh
nvm use 11.9.0
rm -f ./release.zip
#minify-all-js ./build -j
cd build
rm -f manifest-chrome.json
mv manifest.json manifest-chrome.json
mv manifest-firefox.json manifest.json
zip -r ../release.zip ./*
mv manifest-chrome.json manifest.json
