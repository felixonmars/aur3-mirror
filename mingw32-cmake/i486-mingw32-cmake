#!/bin/sh
mingw32_prefix=/usr/i486-mingw32

PATH=${mingw32_prefix}/bin:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${mingw32_prefix} \
    -DCMAKE_INSTALL_LIBDIR:PATH=${mingw32_prefix}/lib \
    -DINCLUDE_INSTALL_DIR:PATH=${mingw32_prefix}/include \
    -DLIB_INSTALL_DIR:PATH=${mingw32_prefix}/lib \
    -DSYSCONF_INSTALL_DIR:PATH=${mingw32_prefix}/etc \
    -DSHARE_INSTALL_DIR:PATH=${mingw32_prefix}/share \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-i486-mingw32.cmake \
    "$@"
    
