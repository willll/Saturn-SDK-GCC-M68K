#!/bin/bash

export BINUTILSVER=2.44
export BINUTILSREV=
export GCCVER=14.3.0
export GCCREV=
export NEWLIBVER=
export NEWLIBREV=
#export NEWLIBVER=4.4.0
#export NEWLIBREV=.20231231
export MPCVER=1.3.1
export MPCREV=
export MPFRVER=4.2.2
export MPFRREV=
export GMPVER=6.3.0
export GMPREV=
export GDBVER=
#export GDBVER=14.2
export GDBREV=

export ENABLE_DOWNLOAD_CACHE=${ENABLE_DOWNLOAD_CACHE:=1}
export ENABLE_STATIC_BUILD=${ENABLE_STATIC_BUILD:=0}

exec "$@"
