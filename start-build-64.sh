#!/bin/bash
echo ... starting 64 bit build
cd ${0%/*}
mkdir build-64
cd build-64
cmake -DTARGET_ARCH=x86_w64-w64-mingw32 -DCMAKE_INSTALL_PREFIX=../prefix-64 -DMAKEJOBS=4 -G Ninja ..
ninja mpv
cd ..
echo ... 64-bit build finished
