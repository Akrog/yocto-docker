#!/bin/bash
set -e
DEST=${1:-./out}
libtoolize --automake
aclocal
autoconf
automake -a
./configure ${CONFIGURE_FLAGS}
make
make install DESTDIR=$DEST
file $DEST/usr/local/bin/hello
