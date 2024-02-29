#!/bin/bash
. ~/.nvm/nvm.sh
nvm use 11.9.0
minify-all-js ./build -j
cd build && zip -r ../release.zip ./*
