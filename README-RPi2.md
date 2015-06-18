# Building using Raspbian on a Raspberry Pi 2

## Installing prerequisites

```
sudo apt-get install re2c ragel texinfo libgmp-dev libmpfr-dev libmpc-dev gperf flex bison
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

## Getting Ninja

```
$ git clone git://github.com/martine/ninja.git && cd ninja
$ git checkout release
$ ./configure.py --bootstrap
$ cp ./ninja /usr/local/bin/
```

## Getting CMake

```
$ wget http://www.cmake.org/files/v3.2/cmake-3.2.1.tar.gz
$ tar -xpvzf cmake-3.2.1.tar.gz
$ cd cmake-3.2.1
$ ./configure --system-curl --system-zlib
$ make
$ sudo make install
```

## Getting Yasm

```
$ git clone https://github.com/yasm/yasm.git && cd yasm
$ ./autogen.sh
$ ./configure
$ make
$ sudo make install
```

## Building Wine

```
$ wget http://prdownloads.sourceforge.net/wine/wine-1.6.2.tar.bz2
$ tar -xpvjf wine-1.6.2.tar.bz2
$ cd wine-1.6.2
$ ./configure --without-x
$ make
$ sudo make install
$
```