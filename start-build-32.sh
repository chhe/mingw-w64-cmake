#!/bin/bash
echo ... starting 32 bit build
cd ${0%/*}
mkdir build-32
cd build-32
cmake -DTARGET_ARCH=i686-w64-mingw32 -DCMAKE_INSTALL_PREFIX=../prefix-32 -DMAKEJOBS=4 -G Ninja ..
ninja mpv
cd ..
echo ... 32-bit build finished
