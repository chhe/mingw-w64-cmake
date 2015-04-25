#!/bin/bash
# $1: target architecture bit-width = [32|64]

PACKAGES_TO_REMOVE=( ffmpeg lame )

if [ "$1" == 32 ]; then
  arch="i686-w64-mingw32"
elif [ "$1" == 64 ]; then
  arch="x86_64-w64-mingw32"
else
  echo
  echo ... unknown architecture bit-width: $1
  exit -1;
fi
echo ... starting $1-bit build with compiler architecture $arch
cd ${0%/*}
if [ ! -d "build-$1" ]; then
  mkdir "build-$1"
fi
cd "build-$1"

echo
echo ... removing packages before build
for package in "${PACKAGES_TO_REMOVE[@]}"
do
  echo ... ... removing packages/${package} if present
  if [ -d "packages/${package}-prefix" ]; then
    rm -rf packages/${package}-prefix
    echo ... ... ... packages/${package}-prefix removed!
  fi
done

echo
echo ... calling CMAKE
echo
cmake -DTARGET_ARCH=$arch -DCMAKE_INSTALL_PREFIX="../prefix-$1" -DMAKEJOBS=2 -G Ninja ..

echo
echo ... calling NINJA
echo
ninja mpv
rc=$?
cd ..
if [[ $rc != 0 ]]; then
  echo
  echo ... $1-bit build finished with errors
  exit $rc;
fi
echo ... $1-bit build finished
