#!/bin/bash
# $1: target architecture bit-width = [32|64]
if [ "$1" == 32 ]; then
  arch="i686-w64-mingw32"
elif [ "$1" == 64 ]; then
  arch="x86_64-w64-mingw32"
else
  echo ... unknown architecture bit-width: $1
  exit -1;
fi
echo ... starting $1-bit build with compiler architecture $arch
cd ${0%/*}
if [ ! -d "build-$1" ]; then
  mkdir "build-$1"
fi
cd "build-$1"
cmake -DTARGET_ARCH=$arch -DCMAKE_INSTALL_PREFIX="../prefix-$1" -DMAKEJOBS=2 -G Ninja ..
ninja mpv
rc=$?
cd ..
if [[ $rc != 0 ]]; then
  echo ... $1-bit build finished with errors
  exit $rc;
fi
echo ... $1-bit build finished
