#!/bin/bash
set -e

[ -d $BUILDDIR/gcc-final ] && rm -rf $BUILDDIR/gcc-final

mkdir $BUILDDIR/gcc-final
cd $BUILDDIR/gcc-final

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
	--build=$BUILDMACH --target=$TARGETMACH --host=$HOSTMACH \
	--prefix=$INSTALLDIR --enable-languages=c,c++ --disable-bootstrap \
	--with-gnu-as --with-gnu-ld --with-gcc  \
    --with-stabs --disable-shared --disable-threads \
	--disable-multilib --disable-tls --disable-libssp --disable-lto \
	--disable-newlib --disable-multilib --disable-libstdcxx \
	--with-cpu=m68000 --disable-werror \
	--program-prefix=${PROGRAM_PREFIX} ${GCC_FINAL_FLAGS}

make $MAKEFLAGS
make install $MAKEFLAGS

cd ${CDIR}
