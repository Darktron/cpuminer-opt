#!/bin/bash

# Linux build

make distclean || echo clean

rm -f config.status
./autogen.sh || echo done

CFLAGS="-Ofast -march=armv8-a+crypto+crc+aes+sha2 -Wall -flax-vector-conversions" ./configure  --with-curl 

make -j $nproc

strip -s cpuminer
