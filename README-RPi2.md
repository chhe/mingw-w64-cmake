# Building using Raspbian on a Raspberry Pi 2

## Installing prerequisites

```
sudo apt-get install libtool autoconf gettext re2c ragel texinfo libgmp-dev libmpfr-dev libmpc-dev gperf flex bison libcurl4-gnutls-dev
```

## Building Automake

```
$ sudo apt-get remove automake
$ git clone git://git.savannah.gnu.org/automake.git && cd automake
$ git checkout tags/v1.15
$ ./bootstrap.sh
$ ./configure --prefix=/usr
$ make
$ sudo make install
```

## Building Ninja

```
$ git clone git://github.com/martine/ninja.git && cd ninja
$ git checkout release
$ ./configure.py --bootstrap
$ sudo cp ./ninja /usr/local/bin/
```

## Building CMake

```
$ wget http://www.cmake.org/files/v3.2/cmake-3.2.1.tar.gz
$ tar -xpvzf cmake-3.2.1.tar.gz
$ cd cmake-3.2.1
$ ./configure --system-curl --system-zlib
$ make
$ sudo make install
```

## Building Yasm

```
$ git clone https://github.com/yasm/yasm.git && cd yasm
$ ./autogen.sh
$ ./configure
$ make
$ sudo make install
```

## Building Wine

```
#$ wget http://prdownloads.sourceforge.net/wine/wine-1.6.2.tar.bz2
#$ tar -xpvjf wine-1.6.2.tar.bz2 && cd wine-1.6.2
$ wget http://prdownloads.sourceforge.net/wine/wine-1.7.45.tar.bz2
$ tar -xpvjf wine-1.7.45.tar.bz2 && cd wine-1.7.45
$ ./configure --without-x
$ make
$ sudo make install
```