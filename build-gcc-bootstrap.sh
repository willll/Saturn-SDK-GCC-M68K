#!/bin/sh
set -e

[ -d $BUILDDIR/gcc-bootstrap ] && rm -rf $BUILDDIR/gcc-bootstrap

mkdir -p $BUILDDIR/gcc-bootstrap
cd $BUILDDIR/gcc-bootstrap

export PATH=$INSTALLDIR/bin:$PATH

export CFLAGS=""
export CXXFLAGS=""
export LDFLAGS=""

if [[ "$ENABLE_STATIC_BUILD" != "0" ]]; then
    CFLAGS+=" -static"
    CXXFLAGS+=" -static"
    LDFLAGS+=" -static"
fi

export CDIR=$PWD

../../source/gcc-${GCCVER}${GCCREV}/configure \
	--build=$BUILDMACH --host=$HOSTMACH --target=$TARGETMACH \
	--prefix=$INSTALLDIR  \
	--enable-languages=c,c++  \
	--with-gnu-ld --with-gnu-as --with-gcc \
	--disable-shared \
	--disable-libgcj \
	--without-headers \
	--program-prefix=${PROGRAM_PREFIX} \
	--disable-libssp -disable-nls --disable-multilib \
	--disable-newlib

make all-gcc $MAKEFLAGS
make install-gcc $MAKEFLAGS

make all-target-libgcc $MAKEFLAGS
make install-target-libgcc $MAKEFLAGS

cd ${CDIR}
