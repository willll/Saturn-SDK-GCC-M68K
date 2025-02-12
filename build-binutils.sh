#!/bin/bash
set -e

[ -d $BUILDDIR/binutils ] && rm -rf $BUILDDIR/binutils

mkdir -p $BUILDDIR/binutils
cd $BUILDDIR/binutils

export CFLAGS=${BINUTILS_CFLAGS}
export CXXFLAGS="-s"

$SRCDIR/binutils-${BINUTILSVER}${BINUTILSREV}/configure \
	--host=$HOSTMACH --build=$BUILDMACH --target=$TARGETMACH \
	--prefix=$INSTALLDIR \
	--disable-werror -enable-install-libbfd \
	--program-prefix=${PROGRAM_PREFIX} --disable-multilib --with-cpu=m68000

if [[ "$ENABLE_STATIC_BUILD" != "0" ]]; then
    make configure-host $MAKEFLAGS
    make $MAKEFLAGS LDFLAGS="-all-static"
else
    make $MAKEFLAGS
fi

make install $MAKEFLAGS
