# | SEGA SATURN HITACHI Motorola 68000 GCC C COMPILER |

## |OVERVIEW|

This is an -optimised- version of the GCC C compiler for SCSP (Motorola 68EC000)
microprocessors.

## |BUILDING|

### |GDB|

TODO

### |OVERALL|

Currently, only GNU/Linux and Windows are actively supported as build targets.
Other operating systems may work with modification to the build files. If you
have made changes to build on a non-supported operating system, please use
GitHub to make a pull request. All new build platforms are very much
appreciated.

In order to successfully build GCC, the following environment variables need
to be defined:

- export SRCDIR=$(pwd)/source
- export BUILDDIR=$(pwd)/build
- export TARGETMACH=sh-elf
- export BUILDMACH=x86_64-pc-linux-gnu
- export HOSTMACH=x86_64-pc-linux-gnu
- export INSTALLDIR=$(pwd)/toolchain
- export SYSROOTDIR=$INSTALLDIR/sysroot
- export ROOTDIR=$(pwd)
- export DOWNLOADDIR=$(pwd)/download
- export PROGRAM_PREFIX=sh-

**A quick way to define them is to run var.sh.**

**PROGRAM_PREFIX** is the prefix used before the tool's name, such as:
saturn-sh2-gcc, where gcc is the program, with saturn-sh2- being the prefix.
BUILDMACH is the development machine the compiler will run on.

**HOSTMACH** is the system architecture the compiler will run on, while the
TARGETMARCH is the architecture the program or library created from the Saturn
SH-2 compilerwill run on.

**BUILDMACH** is used for cross-compiling, set it to the current machine's build
architecture, and the HOSTMACH to the platform the generated compiler will run
on.  When not cross-compiling, set both HOSTMACH and BUILDMACH to the same
value.
Depending on the operating system the compiler is built on, additional tools
may be required.  For cross-compiling for Windows, MinGW-w64 (i686 or x86_64)
will be required on GNU/Linux systems.

**ENABLE_DOWNLOAD_CACHE** can be set to 1 to skip the call to `download.sh`, for
example if the dependency tarballs have already been downloaded using something
else.

**ENABLE_BOOTSTRAP** can be set to 1 to validate the build.

**After the environment variables are set, run build-elf.sh.**

**Note :** _There are no Windows batch files for compilation of the compiler on a native
Windows install.  MSYS with MinGW-w64 or Cygwin may work, though they have not
been tested._

**Note2 :** A quick way to use this repository :

> chmod 777 *.sh
>
> dos2unix *
>
> chmod +x *.sh
>
> . ./var-elf.sh ./build-elf.sh

### |MSYS2|

It is possible to buid using https://www.msys2.org/, 
once the installation is finished, start Minty and :
* Upgrade the system  > pacman -Syu
* Install gcc > pacman -S mingw-w64-ucrt-x86_64-gcc
* Add /ucrt64/bin to $PATH > echo "export PATH=$PATH:/ucrt64/bin" >> ~/.bashrc
* reload .bashrc > source ~/.bashrc
* Install git > pacman -S git
* Install wget > pacman -S wget
* Install make and co > pacman -S make automake texinfo bison autoconf mingw-w64-x86_64-libiconv
* clone this repository
* > ./var-elf.sh ./build-elf.sh
