#!/bin/bash
# You will need to execute the following code every time you need to use this
# package as gcc44 is not the default Archlinux compiler. 

#set gcc44 as default
ln -s /usr/bin/gcc-4.4 /tmp/gcc 
ln -s /usr/bin/cpp-4.4 /tmp/cpp
ln -s /usr/bin/g++-4.4 /tmp/g++
ln -s /usr/bin/gfortran-4.4 /tmp/gfortran
export PATH=/tmp:$PATH
CARCH=`uname -m`
[ "$CARCH" = "x86_64" ] && LIBGCC44=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.4.4/
[ "$CARCH" = "i686" ] && LIBGCC44=/usr/lib/gcc/i686-pc-linux-gnu/4.4.4/
export LD_LIBRARY_PATH=$LIBGCC44:$LD_LIBRARY_PATH


#set mpich2 as default working with gcc44
export PATH=/opt/mpich2-gcc44/bin:$PATH
export MANPATH=/opt/mpich2-gcc44/man:$MANPATH
export PKG_CONFIG_PATH=/opt/mpich2-gcc44/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/opt/mpich2-gcc44:/opt/mpich2-gcc44/lib:$LD_LIBRARY_PATH
