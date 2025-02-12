#!/bin/bash

# Directories
export INSTALLDIR=${INSTALLDIR:=$PWD/toolchain/toolchain}
export SYSROOTDIR=$INSTALLDIR/sysroot
export ROOTDIR=${ROOTDIR:=$PWD}
export DOWNLOADDIR=$PWD/toolchain/download
export RELSRCDIR=./toolchain/source
export SRCDIR=$PWD/toolchain/source
export BUILDDIR=$PWD/toolchain/build

# Detect host system and set build/host machine
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export BUILDMACH=x86_64-pc-linux-gnu
    export HOSTMACH=x86_64-pc-linux-gnu
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Adjust for M4 Mac (ARM64 architecture)
    if [[ "$(uname -m)" == "arm64" ]]; then
        export BUILDMACH=aarch64-apple-darwin
        export HOSTMACH=aarch64-apple-darwin
    else
        export BUILDMACH=x86_64-apple-darwin
        export HOSTMACH=x86_64-apple-darwin
    fi
elif [[ "$OSTYPE" == "cygwin" ]]; then
    export BUILDMACH=i686-pc-linux-gnu
    export HOSTMACH=i686-pc-linux-gnu
elif [[ "$OSTYPE" == "msys" ]]; then
    export BUILDMACH=mingw32
    export HOSTMACH=mingw32
else
    export BUILDMACH=x86_64-pc-linux-gnu
    export HOSTMACH=x86_64-pc-linux-gnu
fi

# Toolchain-specific settings
export GCC_BOOTSTRAP="--disable-bootstrap"
export PROGRAM_PREFIX=${PROGRAM_PREFIX:=m68k-}
export TARGETMACH=${TARGETMACH:=m68k-elf}
export OBJFORMAT=${OBJFORMAT:=ELF}

export GCC_FINAL_FLAGS="--with-sysroot=$SYSROOTDIR"
export BINUTILS_CFLAGS="-s"
export GCC_BOOTSTRAP_FLAGS=""

# Source versions
source versions.sh
